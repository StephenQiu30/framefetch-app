import 'package:flutter/material.dart';
import 'package:framegrab/features/admin/presentation/admin_edit_sheet.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class StorageCleanupSheet extends StatefulWidget {
  const StorageCleanupSheet({required this.onCleanup, super.key});
  final Future<void> Function(int days) onCleanup;
  @override
  State<StorageCleanupSheet> createState() => _StorageCleanupSheetState();
}

final class _StorageCleanupSheetState extends State<StorageCleanupSheet> {
  int _days = 30;
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return AdminEditSheet(
      title: l.adminCleanupTitle,
      saveLabel: l.adminCleanupAction,
      savingLabel: l.loadingData,
      destructiveAction: true,
      onSave: () => widget.onCleanup(_days),
      fields: [
        Text(l.adminCleanupDescription),
        ShadInputFormField(
          initialValue: '30',
          keyboardType: TextInputType.number,
          onChanged: (v) => _days = int.tryParse(v) ?? 0,
          validator: (_) =>
              _days < 1 || _days > 3650 ? l.invalidConfiguration : null,
          label: Text(l.cleanupDaysLabel),
          description: const Text('1–3650'),
        ),
      ],
    );
  }
}
