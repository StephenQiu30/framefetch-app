import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/routing/auth_return_location.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/presentation/auth_error_text.dart';
import 'package:framegrab/features/auth/presentation/auth_failure_message.dart';
import 'package:framegrab/features/auth/presentation/auth_page_scaffold.dart';
import 'package:framegrab/features/auth/presentation/auth_validation.dart';
import 'package:framegrab/features/auth/presentation/password_field.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

final class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<ShadFormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (ref.read(authSessionProvider).isBusy) return;
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final returnLocation = safeAuthReturnLocation(
      GoRouterState.of(context).uri.queryParameters['from'],
    );
    FocusManager.instance.primaryFocus?.unfocus();
    final authenticated = await ref
        .read(authSessionProvider.notifier)
        .login(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
    if (mounted && authenticated && ref.read(authSessionProvider).isSignedIn) {
      context.go(returnLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final session = ref.watch(authSessionProvider);
    final failure = session.failure;
    final from = GoRouterState.of(context).uri.queryParameters['from'];
    final registerLocation = Uri(
      path: '/auth/register',
      queryParameters: from == null ? null : {'from': from},
    ).toString();
    return AuthPageScaffold(
      title: localizations.welcomeBack,
      child: AutofillGroup(
        child: ShadForm(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ShadInputFormField(
                key: const Key('login-email-field'),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.email],
                autocorrect: false,
                validator: (value) => validateAuthEmail(value, localizations),
                label: Text(localizations.emailLabel),
              ),
              const SizedBox(height: AppSpacing.small),
              PasswordField(
                controller: _passwordController,
                label: localizations.passwordLabel,
                fieldKey: const Key('login-password-field'),
                obscure: _obscurePassword,
                onToggle: () {
                  setState(() => _obscurePassword = !_obscurePassword);
                },
                validator: (value) => validateAuthPassword(
                  value,
                  localizations,
                  registering: false,
                ),
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => unawaited(_submit()),
              ),
              const SizedBox(height: AppSpacing.medium),
              AuthErrorText(
                message: failure == null
                    ? null
                    : authFailureMessage(localizations, failure),
              ),
              if (failure != null) const SizedBox(height: AppSpacing.medium),
              ShadButton(
                key: const Key('login-submit-button'),
                onPressed: session.isBusy ? null : () => unawaited(_submit()),
                enabled:
                    (session.isBusy ? null : () => unawaited(_submit())) !=
                    null,
                height: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                child: Flexible(
                  child: Text(
                    session.phase == AuthSessionPhase.submitting
                        ? localizations.loginSubmitting
                        : localizations.loginSubmit,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.small),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: ShadButton.link(
                  key: const Key('go-register-button'),
                  onPressed: session.isBusy
                      ? null
                      : () => context.pushReplacement(registerLocation),
                  enabled: !session.isBusy,
                  height: 0,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Flexible(child: Text(localizations.goRegister)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
