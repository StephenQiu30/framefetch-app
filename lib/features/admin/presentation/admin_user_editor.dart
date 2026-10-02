import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/admin/application/admin_providers.dart';
import 'package:framegrab/features/admin/data/admin_repository.dart';
import 'package:framegrab/features/admin/presentation/admin_edit_sheet.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_dropdown_field.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:video_server_api/video_server_api.dart';

Future<void> editAdminUser(
  BuildContext context,
  WidgetRef ref,
  ManagedUserResponse user,
) async {
  final saved = await showShadSheet<bool>(
    context: context,
    isDismissible: false,
    builder: (_) => ShadSheet(
      draggable: false,
      closeIcon: const SizedBox.shrink(),
      isScrollControlled: true,
      child: Builder(builder: (_) => AdminUserEditor(user: user)),
    ),
  );
  if (saved == true && context.mounted) ref.invalidate(adminUsersProvider);
}

final class AdminUserEditor extends ConsumerStatefulWidget {
  const AdminUserEditor({required this.user, super.key});
  final ManagedUserResponse user;
  @override
  ConsumerState<AdminUserEditor> createState() => _AdminUserEditorState();
}

final class _AdminUserEditorState extends ConsumerState<AdminUserEditor> {
  late var _role = widget.user.role;
  late var _active = widget.user.isActive;
  late var _exempt = widget.user.quota.exempt ?? false;
  late final _activeTasks = TextEditingController(
    text: _integer(widget.user.quota.maxActivePerOwner),
  );
  late final _dailyTasks = TextEditingController(
    text: _integer(widget.user.quota.dailyTasks),
  );
  late final _dailyGiB = TextEditingController(
    text: _gib(widget.user.quota.dailyBytes),
  );
  late final _storageGiB = TextEditingController(
    text: _gib(widget.user.quota.storageBytes),
  );
  late final _analysisAttempts = TextEditingController(
    text: _integer(widget.user.quota.dailyAnalysisAttempts),
  );

  static String _integer(int? value) => value?.toString() ?? '';
  static String _gib(int? value) => value == null ? '' : '${value / (1 << 30)}';
  static int? _parseInteger(String value) =>
      value.trim().isEmpty ? null : int.parse(value.trim());
  static int? _parseBytes(String value) => value.trim().isEmpty
      ? null
      : (double.parse(value.trim()) * (1 << 30)).round();

  @override
  void dispose() {
    for (final controller in [
      _activeTasks,
      _dailyTasks,
      _dailyGiB,
      _storageGiB,
      _analysisAttempts,
    ]) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _save() => ref
      .read(adminRepositoryProvider)
      .updateUser(
        widget.user,
        _role,
        _active,
        quota: UserQuotaSettings(
          (b) => b
            ..exempt = _exempt
            ..maxActivePerOwner = _parseInteger(_activeTasks.text)
            ..dailyTasks = _parseInteger(_dailyTasks.text)
            ..dailyBytes = _parseBytes(_dailyGiB.text)
            ..storageBytes = _parseBytes(_storageGiB.text)
            ..dailyAnalysisAttempts = _parseInteger(_analysisAttempts.text),
        ),
      );

  Widget _quotaField(
    TextEditingController controller,
    String label, {
    bool decimal = false,
  }) {
    final l = AppLocalizations.of(context);
    return ShadInputFormField(
      controller: controller,
      label: Text(label),
      placeholder: Text(l.adminUseSystemDefault),
      keyboardType: TextInputType.numberWithOptions(decimal: decimal),
      validator: (value) {
        if (value.trim().isEmpty) return null;
        final number = decimal ? double.tryParse(value) : int.tryParse(value);
        return number == null ||
                !number.isFinite ||
                number <= 0 ||
                (decimal && (number * (1 << 30)).round() < 1)
            ? l.invalidConfiguration
            : null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return AdminEditSheet(
      title: widget.user.username,
      onSave: _save,
      fields: [
        AppDropdownField<UserRole>(
          value: _role,
          label: l.adminRoleLabel,
          options: [
            AppDropdownOption(value: UserRole.user, label: l.adminRoleUser),
            AppDropdownOption(value: UserRole.admin, label: l.adminRoleAdmin),
          ],
          onSelected: (value) {
            if (value != null) setState(() => _role = value);
          },
        ),
        ShadSwitch(
          value: _active,
          label: Text(l.adminAccountActive),
          onChanged: (value) => setState(() => _active = value),
        ),
        Text(l.adminQuotaTitle, style: ShadTheme.of(context).textTheme.h4),
        ShadSwitch(
          value: _exempt,
          label: Text(l.adminQuotaExempt),
          onChanged: (value) => setState(() => _exempt = value),
        ),
        _quotaField(_activeTasks, l.adminQuotaActive),
        _quotaField(_dailyTasks, l.adminQuotaDailyTasks),
        _quotaField(_dailyGiB, l.adminQuotaDailyGiB, decimal: true),
        _quotaField(_storageGiB, l.adminQuotaStorageGiB, decimal: true),
        _quotaField(_analysisAttempts, l.adminQuotaAnalysis),
      ],
    );
  }
}
