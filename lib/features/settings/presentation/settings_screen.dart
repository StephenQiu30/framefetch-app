import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/presentation/profile_avatar_section.dart';
import 'package:framegrab/features/auth/presentation/profile_editor.dart';
import 'package:framegrab/features/settings/presentation/settings_navigation_entry.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_page_intro.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final isAdmin = ref.watch(
      authSessionProvider.select(
        (session) => session.user?.role.name == 'admin',
      ),
    );

    return SafeArea(
      top: false,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.pageHorizontal,
          AppSpacing.pageTop,
          AppSpacing.pageHorizontal,
          AppSpacing.pageBottom,
        ),
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1280),
              child: Semantics(
                container: true,
                explicitChildNodes: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppPageIntro(
                      description: localizations.accountDescription,
                      title: localizations.profileTitle,
                    ),
                    const SizedBox(height: AppSpacing.section),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth >= 768) {
                          return const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: ProfileAvatarSection()),
                              SizedBox(width: AppSpacing.section),
                              Expanded(flex: 2, child: ProfileEditor()),
                            ],
                          );
                        }
                        return const Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ProfileAvatarSection(),
                            SizedBox(height: AppSpacing.xxLarge),
                            ProfileEditor(),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: AppSpacing.section),
                    SettingsNavigationEntry(
                      key: const Key('activity-history-entry'),
                      icon: PhosphorIconsRegular.listBullets,
                      onTap: () => context.push('/history/activity'),
                      title: localizations.activityHistoryTitle,
                      description: localizations.activityHistoryDescription,
                    ),
                    if (isAdmin) ...[
                      const SizedBox(height: AppSpacing.section),
                      SettingsSectionLabel(
                        label: localizations.adminCenterTitle,
                      ),
                      const SizedBox(height: AppSpacing.small),
                      SettingsNavigationEntry(
                        key: const Key('admin-center-entry'),
                        icon: PhosphorIconsRegular.shieldCheck,
                        onTap: () => context.push('/admin'),
                        title: localizations.adminCenterTitle,
                        description: localizations.adminCenterDescription,
                      ),
                    ],
                    const SizedBox(height: AppSpacing.section),
                    const _LogoutAction(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final class _LogoutAction extends ConsumerWidget {
  const _LogoutAction();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final session = ref.watch(authSessionProvider);
    if (session.user == null) {
      return const SizedBox.shrink();
    }
    return ShadButton.destructive(
      key: const Key('logout-button'),
      onPressed: session.isBusy
          ? null
          : () => unawaited(ref.read(authSessionProvider.notifier).logout()),
      leading: const Icon(PhosphorIconsRegular.signOut),
      enabled:
          (session.isBusy
              ? null
              : () => unawaited(
                  ref.read(authSessionProvider.notifier).logout(),
                )) !=
          null,
      height: 0,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Flexible(
        child: Text(
          session.phase == AuthSessionPhase.signingOut
              ? localizations.loggingOut
              : localizations.logoutAction,
        ),
      ),
    );
  }
}
