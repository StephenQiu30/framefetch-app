import 'package:flutter/material.dart';
import 'package:framefetch/core/theme/app_spacing.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class AdminCatalogRow extends StatelessWidget {
  const AdminCatalogRow({
    required this.item,
    required this.busy,
    required this.onToggle,
    required this.onEdit,
    required this.onDelete,
    super.key,
  });
  final ProviderCatalogEntryResponse item;
  final bool busy;
  final ValueChanged<bool> onToggle;
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
          ShadSwitch(
            value: item.isVisible,
            enabled: !busy,
            onChanged: busy ? null : onToggle,
            label: Text(item.displayName),
            sublabel: Text(
              '${item.key} · ${l.sortOrder}: ${item.sortOrder}\n${item.systemRegistered ? l.adminSystemRegistered : l.adminSystemMissing}',
            ),
          ),
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
