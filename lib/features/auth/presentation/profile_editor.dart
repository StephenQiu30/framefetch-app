import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/data/profile_repository.dart';
import 'package:framegrab/features/auth/domain/username.dart';
import 'package:framegrab/features/auth/presentation/auth_validation.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_dropdown_field.dart';
import 'package:framegrab/shared/presentation/data_request_failure_message.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:video_server_api/video_server_api.dart';

final class ProfileEditor extends ConsumerStatefulWidget {
  const ProfileEditor({super.key});
  @override
  ConsumerState<ProfileEditor> createState() => _ProfileEditorState();
}

final class _ProfileEditorState extends ConsumerState<ProfileEditor> {
  final _form = GlobalKey<ShadFormState>();
  late final _username = TextEditingController(
    text: ref.read(authSessionProvider).user?.username,
  );
  bool _saving = false;
  late UserRole _role =
      ref.read(authSessionProvider).user?.role ?? UserRole.user;
  String? _notice;
  @override
  void dispose() {
    _username.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_saving || !(_form.currentState?.validate() ?? false)) return;
    final l = AppLocalizations.of(context);
    setState(() {
      _saving = true;
      _notice = null;
    });
    bool usernameSaved = false;
    try {
      final repository = ref.read(profileRepositoryProvider);
      final current = ref.read(authSessionProvider).user;
      if (normalizeUsername(_username.text) != current?.username) {
        await repository.update(normalizeUsername(_username.text));
        usernameSaved = true;
      }
      if (current?.role == UserRole.admin && _role != current?.role) {
        await repository.updateRole(_role);
      }
      if (mounted) {
        ShadSonner.of(
          context,
        ).show(ShadToast(description: Text(l.profileSaved)));
      }
    } catch (error) {
      if (mounted) {
        setState(
          () => _notice = usernameSaved
              ? l.profilePartialSave
              : error is DataRequestFailure &&
                    error.code == 'username_already_registered'
              ? l.usernameRegisteredError
              : dataRequestFailureMessage(l, error),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final user = ref.watch(authSessionProvider).user;
    if (user == null) return const SizedBox.shrink();
    return ShadForm(
      key: _form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l.profileFieldsTitle,
            style: ShadTheme.of(context).textTheme.small,
          ),
          const SizedBox(height: 16),
          ShadInputFormField(
            key: const Key('profile-username-field'),
            controller: _username,
            enabled: !_saving,
            validator: (v) => validateAuthUsername(v, l),
            onChanged: (_) => setState(() => _notice = null),
            label: Text(l.usernameLabel),
            description: Text(l.usernameHelp),
          ),
          const SizedBox(height: 16),
          ShadInputFormField(
            key: ValueKey('profile-email-${user.email}'),
            initialValue: user.email,
            readOnly: true,
            label: Text(l.emailLabel),
            description: Text(l.profileEmailHelp),
          ),
          const SizedBox(height: 16),
          AppDropdownField<UserRole>(
            value: _role,
            label: l.profileRoleLabel,
            enabled: user.role == UserRole.admin && !_saving,
            options: [
              AppDropdownOption(value: UserRole.admin, label: l.adminRoleAdmin),
              AppDropdownOption(value: UserRole.user, label: l.adminRoleUser),
            ],
            onSelected: (value) {
              if (value != null) {
                setState(() {
                  _role = value;
                  _notice = null;
                });
              }
            },
          ),
          const SizedBox(height: 8),
          Text(
            user.role == UserRole.admin
                ? l.profileRoleAdminHelp
                : l.profileRoleUserHelp,
            style: ShadTheme.of(context).textTheme.muted,
          ),
          if (_notice != null)
            Semantics(liveRegion: true, child: Text(_notice!)),
          const SizedBox(height: 16),
          ShadButton(
            key: const Key('profile-save-button'),
            onPressed:
                _saving ||
                    (normalizeUsername(_username.text) == user.username &&
                        _role == user.role)
                ? null
                : _save,
            enabled:
                (_saving ||
                        (normalizeUsername(_username.text) == user.username &&
                            _role == user.role)
                    ? null
                    : _save) !=
                null,
            height: 0,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Flexible(
              child: Text(_saving ? l.savingProfile : l.saveProfile),
            ),
          ),
        ],
      ),
    );
  }
}
