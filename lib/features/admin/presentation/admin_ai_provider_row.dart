import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/admin/presentation/ai_engine_label.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:video_server_api/video_server_api.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.displayName, style: ShadTheme.of(context).textTheme.large),
          const SizedBox(height: AppSpacing.xSmall),
          Text(
            '${aiEngineLabel(l, item.engine)} · ${item.model}\n${item.authMode == AiProviderAuthMode.hostLogin ? l.hostLoginLabel : l.apiKeyLabel} · ${item.credentialConfigured ? l.adminCredentialReady : l.adminCredentialMissing}',
            style: ShadTheme.of(context).textTheme.muted,
          ),
          if (item.isActive) Text(l.adminActiveLine),
          Wrap(
            spacing: AppSpacing.small,
            children: [
              if (!item.isActive)
                ShadButton.outline(
                  enabled: !busy,
                  onPressed: busy ? null : onActivate,
                  child: Text(l.adminActivateAction),
                ),
              ShadButton.ghost(
                enabled: !busy,
                onPressed: busy ? null : onEdit,
                child: Text(l.editAction),
              ),
              if (!item.isActive && item.key != 'local-codex')
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
