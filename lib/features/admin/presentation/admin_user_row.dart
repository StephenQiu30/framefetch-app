import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_formatters.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:video_server_api/video_server_api.dart';

final class AdminUserRow extends StatelessWidget {
  const AdminUserRow({
    required this.user,
    required this.isCurrent,
    required this.busy,
    required this.onEdit,
    required this.onDelete,
    super.key,
  });
  final ManagedUserResponse user;
  final bool isCurrent;
  final bool busy;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(user.username, style: ShadTheme.of(context).textTheme.large),
          const SizedBox(height: AppSpacing.xSmall),
          Text(
            '${user.email}\n${user.role == UserRole.admin ? l.adminRoleAdmin : l.adminRoleUser} · ${user.isActive ? l.adminAccountEnabled : l.adminAccountDisabled}',
            style: ShadTheme.of(context).textTheme.muted,
          ),
          if (user.role == UserRole.admin || user.quota.exempt == true)
            Text(
              l.adminQuotaExempt,
              style: ShadTheme.of(context).textTheme.muted,
            ),
          Text(
            '${l.createdAtLabel}: ${formatDataTime(context, user.createdAt)}',
            style: ShadTheme.of(context).textTheme.muted,
          ),
          if (isCurrent)
            Text(l.adminCurrentUser)
          else
            Wrap(
              spacing: AppSpacing.small,
              children: [
                ShadButton.ghost(
                  enabled: !busy,
                  onPressed: busy ? null : onEdit,
                  child: Text(l.editAction),
                ),
                ShadButton.ghost(
                  enabled: !busy,
                  onPressed: busy ? null : onDelete,
                  child: Text(l.deleteAction),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
