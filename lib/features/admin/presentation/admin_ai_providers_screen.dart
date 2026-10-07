import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framefetch/core/theme/app_spacing.dart';
import 'package:framefetch/features/admin/application/admin_mutation_controller.dart';
import 'package:framefetch/features/admin/application/admin_providers.dart';
import 'package:framefetch/features/admin/data/admin_configuration_repository.dart';
import 'package:framefetch/features/admin/data/admin_repository.dart';
import 'package:framefetch/features/admin/presentation/admin_ai_provider_row.dart';
import 'package:framefetch/features/admin/presentation/admin_edit_sheet.dart';
import 'package:framefetch/features/admin/presentation/admin_page.dart';
import 'package:framefetch/features/admin/presentation/ai_provider_editor.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch/shared/presentation/data_page_view.dart';
import 'package:framefetch/shared/presentation/data_request_failure_message.dart';
import 'package:framefetch/shared/presentation/list_query.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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

  Future<void> _activate(String key) async {
    setState(() => _busyKey = key);
    try {
      await ref.read(adminRepositoryProvider).activateAiProvider(key);
      if (mounted) {
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

  Future<void> _delete(AiProviderProfileResponse item) async {
    final l = AppLocalizations.of(context);
    if (!await confirmAdminDelete(
          context,
          description: l.adminDeleteAiDescription,
        ) ||
        !mounted) {
      return;
    }
    final result = await ref
        .read(adminAiMutationProvider.notifier)
        .run(
          () =>
              ref.read(adminConfigurationRepositoryProvider).deleteAi(item.key),
        );
    if (!mounted || result == AdminMutationResult.stale) return;
    if (result == AdminMutationResult.failed) {
      ShadSonner.of(
        context,
      ).show(ShadToast(description: Text(l.adminActionFailed)));
      return;
    }
    ref.invalidate(adminAiProvidersProvider);
  }

  void _filter(String value) {
    if (_busyKey != null || ref.read(adminAiMutationProvider)) return;
    setState(() {
      _search = value;
      _page = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final result = ref.watch(adminAiProvidersProvider);
    final busy = ref.watch(adminAiMutationProvider) || _busyKey != null;
    return AdminPage(
      title: l.adminAiProvidersTitle,
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
              if (items.isEmpty) DataStateMessage(title: l.adminAiEmpty),
              for (final item in items)
                AdminAiProviderRow(
                  key: ValueKey('ai-${item.key}'),
                  item: item,
                  busy: busy,
                  onActivate: () => _activate(item.key),
                  onEdit: () => editAiProvider(context, ref, item),
                  onDelete: () => _delete(item),
                ),
              if (filtered.isNotEmpty)
                ListPagination(
                  page: page,
                  pageSize: _pageSize,
                  total: filtered.length,
                  busy: busy,
                  onPage: (v) {
                    setState(() => _page = v);
                  },
                  onPageSize: (v) {
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
