import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/admin/application/admin_selection_controller.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class AdminBulkDeleteBar extends StatelessWidget {
  const AdminBulkDeleteBar({
    required this.state,
    required this.eligibleIds,
    required this.onSelectPage,
    required this.onDelete,
    this.disabled = false,
    super.key,
  });
  final AdminSelectionState state;
  final List<String> eligibleIds;
  final ValueChanged<bool> onSelectPage;
  final VoidCallback onDelete;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: AppSpacing.medium,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ShadCheckbox(
              value:
                  eligibleIds.isNotEmpty &&
                  eligibleIds.every(state.selected.contains),
              enabled: !disabled && !state.busy && eligibleIds.isNotEmpty,
              label: Text(l.adminSelectAll),
              onChanged: onSelectPage,
            ),
            if (state.selected.isNotEmpty)
              ShadButton.destructive(
                enabled: !disabled && !state.busy,
                onPressed: disabled || state.busy ? null : onDelete,
                child: Text(
                  '${l.adminDeleteSelected} (${state.selected.length})',
                ),
              ),
          ],
        ),
        if (state.hasFailure) ...[
          const SizedBox(height: AppSpacing.small),
          ShadAlert.destructive(description: Text(l.adminDeletePartialFailure)),
        ],
        const SizedBox(height: AppSpacing.medium),
      ],
    );
  }
}

final class AdminSelectionRow extends StatelessWidget {
  const AdminSelectionRow({
    required this.selected,
    required this.enabled,
    required this.onChanged,
    required this.label,
    required this.child,
    super.key,
  });
  final bool selected;
  final bool enabled;
  final ValueChanged<bool> onChanged;
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: AppSpacing.medium),
        child: Semantics(
          label: label,
          child: ShadCheckbox(
            value: selected,
            enabled: enabled,
            onChanged: onChanged,
          ),
        ),
      ),
      const SizedBox(width: AppSpacing.medium),
      Expanded(child: child),
    ],
  );
}
