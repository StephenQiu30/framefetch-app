import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/admin/application/admin_providers.dart';
import 'package:framegrab/features/admin/application/admin_selection_controller.dart';
import 'package:framegrab/features/admin/data/admin_configuration_repository.dart';
import 'package:framegrab/features/admin/data/admin_repository.dart';
import 'package:framegrab/features/admin/presentation/admin_ai_provider_row.dart';
import 'package:framegrab/features/admin/presentation/admin_bulk_delete_bar.dart';
import 'package:framegrab/features/admin/presentation/admin_edit_sheet.dart';
import 'package:framegrab/features/admin/presentation/admin_page.dart';
import 'package:framegrab/features/admin/presentation/ai_provider_editor.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:framegrab/shared/presentation/data_request_failure_message.dart';
import 'package:framegrab/shared/presentation/list_query.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:video_server_api/video_server_api.dart';

final class AdminAiProvidersScreen extends ConsumerStatefulWidget {
  const AdminAiProvidersScreen({super.key});
  @override
  ConsumerState<AdminAiProvidersScreen> createState() =>
      _AdminAiProvidersScreenState();
}

final class _AdminAiProvidersScreenState
    extends ConsumerState<AdminAiProvidersScreen> {
  String? _busyKey;
  String _search = '';
  int _page = 1;
  int _pageSize = 10;
  bool _deletable(AiProviderProfileResponse item) =>
      !item.isActive && item.key != 'local-codex';

  Future<void> _activate(String key) async {
    setState(() => _busyKey = key);
    try {
      await ref.read(adminRepositoryProvider).activateAiProvider(key);
      if (mounted) {
        ref.read(adminAiSelectionProvider.notifier).clear();
        ref.invalidate(adminAiProvidersProvider);
      }
    } catch (_) {
      if (mounted) {
        ShadSonner.of(context).show(
          ShadToast(
            description: Text(AppLocalizations.of(context).adminActionFailed),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _busyKey = null);
    }
  }

  Future<void> _delete([AiProviderProfileResponse? item]) async {
    final l = AppLocalizations.of(context);
    if (!await confirmAdminDelete(
          context,
          title: item == null ? l.adminDeleteSelectionTitle : null,
          description: l.adminDeleteAiDescription,
        ) ||
        !mounted) {
      return;
    }
    final controller = ref.read(adminAiSelectionProvider.notifier);
    if (item != null) controller.selectPage([item.key], true);
    final current = await controller.deleteSelected(
      ref.read(adminConfigurationRepositoryProvider).deleteAi,
    );
    if (current && mounted) ref.invalidate(adminAiProvidersProvider);
  }

  void _filter(String value) {
    if (_busyKey != null || ref.read(adminAiSelectionProvider).busy) return;
    ref.read(adminAiSelectionProvider.notifier).clear();
    setState(() {
      _search = value;
      _page = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final result = ref.watch(adminAiProvidersProvider);
    final selection = ref.watch(adminAiSelectionProvider);
    final controller = ref.read(adminAiSelectionProvider.notifier);
    final busy = selection.busy || _busyKey != null;
    return AdminPage(
      title: l.adminAiProvidersTitle,
      description: l.adminAiProvidersDescription,
      refreshLabel: l.refreshAction,
      onRefresh: () =>
          ref.refresh(adminAiProvidersProvider.future).then((_) {}),
      children: [
        ShadButton(
          enabled: !busy,
          onPressed: busy ? null : () => editAiProvider(context, ref),
          child: Text(l.createAiProvider),
        ),
        const SizedBox(height: AppSpacing.medium),
        ShadInput(placeholder: Text(l.adminAiSearch), onChanged: _filter),
        ...result.when(
          data: (data) {
            final filtered = data.items
                .where(
                  (item) => '${item.key} ${item.displayName} ${item.model}'
                      .toLowerCase()
                      .contains(_search.toLowerCase()),
                )
                .toList();
            final page = _page.clamp(
              1,
              (filtered.length / _pageSize).ceil().clamp(1, 1000000),
            );
            final items = filtered
                .skip((page - 1) * _pageSize)
                .take(_pageSize)
                .toList();
            return [
              const SizedBox(height: AppSpacing.medium),
              Text(
                data.agentAvailable
                    ? l.adminAgentAvailable
                    : l.adminAgentUnavailable,
              ),
              const SizedBox(height: AppSpacing.medium),
              if (items.isEmpty)
                DataStateMessage(
                  title: l.adminAiEmpty,
                  description: l.adminAiEmptyDescription,
                ),
              if (items.isNotEmpty)
                AdminBulkDeleteBar(
                  disabled: busy,
                  state: selection,
                  eligibleIds: items
                      .where(_deletable)
                      .map((item) => item.key)
                      .toList(),
                  onSelectPage: (v) => controller.selectPage(
                    items.where(_deletable).map((item) => item.key),
                    v,
                  ),
                  onDelete: () => _delete(),
                ),
              for (final item in items)
                AdminSelectionRow(
                  key: ValueKey('ai-${item.key}'),
                  selected: selection.selected.contains(item.key),
                  enabled: !busy && _deletable(item),
                  label: item.displayName,
                  onChanged: (v) => controller.toggle(item.key, v),
                  child: AdminAiProviderRow(
                    item: item,
                    busy: busy,
                    onActivate: () => _activate(item.key),
                    onEdit: () => editAiProvider(context, ref, item),
                    onDelete: () => _delete(item),
                  ),
                ),
              if (filtered.isNotEmpty)
                ListPagination(
                  page: page,
                  pageSize: _pageSize,
                  total: filtered.length,
                  busy: busy,
                  onPage: (v) {
                    controller.clear();
                    setState(() => _page = v);
                  },
                  onPageSize: (v) {
                    controller.clear();
                    setState(() {
                      _pageSize = v;
                      _page = 1;
                    });
                  },
                ),
            ];
          },
          error: (error, _) => adminError(
            action: l.retryAction,
            title: l.loadFailedTitle,
            description: dataRequestFailureMessage(l, error),
            retry: () => ref.invalidate(adminAiProvidersProvider),
          ),
          loading: () => adminLoading(l.loadingData),
        ),
      ],
    );
  }
}
