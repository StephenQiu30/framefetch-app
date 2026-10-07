import 'package:flutter/material.dart';
import 'package:framefetch/features/admin/presentation/admin_page.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_icons/phosphor_icons.dart';

final class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final items = [
      (
        l10n.adminAnalyticsTitle,
        PhosphorIconsRegular.chartLineUp,
        '/admin/analytics',
      ),
      (l10n.adminFilesTitle, PhosphorIconsRegular.hardDrive, '/admin/files'),
      (l10n.adminUsersTitle, PhosphorIconsRegular.users, '/admin/users'),
      (
        l10n.adminProvidersTitle,
        PhosphorIconsRegular.treeStructure,
        '/admin/providers',
      ),
      (
        l10n.adminAiProvidersTitle,
        PhosphorIconsRegular.sparkle,
        '/admin/ai-providers',
      ),
      (
        l10n.adminOperationLogsTitle,
        PhosphorIconsRegular.clockCounterClockwise,
        '/admin/operation-logs',
      ),
    ];
    return AdminPage(
      backFallbackLocation: '/',
      title: l10n.adminCenterTitle,
      refreshLabel: l10n.refreshAction,
      onRefresh: () async {},
      children: [
        for (final item in items)
          AdminSectionLink(
            title: item.$1,
            icon: item.$2,
            onTap: () => context.push(item.$3),
          ),
      ],
    );
  }
}
