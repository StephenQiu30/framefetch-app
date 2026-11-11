import 'package:flutter/material.dart';
import 'package:framefetch/core/theme/app_spacing.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class AdminAiProviderRow extends StatelessWidget {
  const AdminAiProviderRow({
    required this.item,
    required this.busy,
    required this.onEdit,
    required this.onActivate,
    required this.onDelete,
    super.key,
  });

  final AiProviderProfileResponse item;
  final bool busy;
  final VoidCallback onEdit;
  final VoidCallback onActivate;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final visionLabel = item.supportsVision
        ? l.adminImageSupported
        : l.adminTextOnly;
    final credentialLabel = item.credentialConfigured
        ? l.adminCredentialReady
        : l.adminCredentialMissing;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.displayName, style: ShadTheme.of(context).textTheme.large),
          const SizedBox(height: AppSpacing.xSmall),
          Text(
            '${item.model} · $visionLabel\n${l.apiKeyLabel} · $credentialLabel',
            style: ShadTheme.of(context).textTheme.muted,
          ),
          if (item.isActive) Text(l.adminActiveLine),
          Wrap(
            spacing: AppSpacing.small,
            children: [
              ShadButton(
                enabled: !busy,
                onPressed: busy ? null : onEdit,
                child: Text(l.editAction),
              ),
              if (item.credentialConfigured && !item.isActive)
                ShadButton.outline(
                  enabled: !busy,
                  onPressed: busy ? null : onActivate,
                  child: Text(l.adminActivateAction),
                ),
              if (item.credentialConfigured)
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
