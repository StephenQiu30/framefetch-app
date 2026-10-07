import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framefetch/core/theme/app_spacing.dart';
import 'package:framefetch/features/admin/application/admin_mutation_controller.dart';
import 'package:framefetch/features/admin/application/admin_providers.dart';
import 'package:framefetch/features/admin/data/admin_configuration_repository.dart';
import 'package:framefetch/features/admin/data/admin_repository.dart';
import 'package:framefetch/features/admin/presentation/admin_catalog_row.dart';
import 'package:framefetch/features/admin/presentation/admin_edit_sheet.dart';
import 'package:framefetch/features/admin/presentation/admin_page.dart';
import 'package:framefetch/features/admin/presentation/catalog_editor.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch/shared/presentation/data_page_view.dart';
import 'package:framefetch/shared/presentation/data_request_failure_message.dart';
import 'package:framefetch/shared/presentation/list_filters.dart';
import 'package:framefetch/shared/presentation/list_query.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class AdminProvidersScreen extends ConsumerStatefulWidget {
  const AdminProvidersScreen({super.key});
  @override
  ConsumerState<AdminProvidersScreen> createState() =>
      _AdminProvidersScreenState();
}

final class _AdminProvidersScreenState
    extends ConsumerState<AdminProvidersScreen> {
  final Set<String> _busy = {};
  ListQuery _query = const ListQuery();

  void _filter({String? search, String? status}) {
    if (_busy.isNotEmpty || ref.read(adminCatalogMutationProvider)) {
      return;
    }
    setState(
      () => _query = ListQuery(
        search: search ?? _query.search,
        status: status,
        pageSize: _query.pageSize,
      ),
    );
  }

  Future<void> _toggle(ProviderCatalogEntryResponse item, bool value) async {
    setState(() => _busy.add(item.key));
    try {
      await ref
          .read(adminRepositoryProvider)
          .updateProviderVisibility(item, value);
      if (mounted) ref.invalidate(adminProviderCatalogProvider);
    } catch (_) {
      if (mounted) {
        ShadSonner.of(context).show(
          ShadToast(
            description: Text(AppLocalizations.of(context).adminActionFailed),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _busy.remove(item.key));
    }
  }

  Future<void> _delete(ProviderCatalogEntryResponse item) async {
    final l = AppLocalizations.of(context);
    if (!await confirmAdminDelete(
          context,
          description: l.adminDeleteCatalogDescription,
        ) ||
        !mounted) {
      return;
    }
    final result = await ref
        .read(adminCatalogMutationProvider.notifier)
        .run(
          () => ref
              .read(adminConfigurationRepositoryProvider)
              .deleteCatalog(item.key),
        );
    if (!mounted || result == AdminMutationResult.stale) return;
    if (result == AdminMutationResult.failed) {
      ShadSonner.of(
        context,
      ).show(ShadToast(description: Text(l.adminActionFailed)));
      return;
    }
    ref.invalidate(adminProviderCatalogProvider);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final result = ref.watch(adminProviderCatalogProvider);
    final busy = ref.watch(adminCatalogMutationProvider) || _busy.isNotEmpty;
    return AdminPage(
      title: l.adminProvidersTitle,
      refreshLabel: l.refreshAction,
      onRefresh: () =>
          ref.refresh(adminProviderCatalogProvider.future).then((_) {}),
      children: [
        ShadButton(
          enabled: !busy,
          onPressed: busy ? null : () => editCatalog(context, ref),
          child: Text(l.createPlatform),
        ),
        const SizedBox(height: AppSpacing.medium),
        ListFilters(
          query: _query,
          searchLabel: l.searchPlatforms,
          statuses: {'visible': l.visiblePlatform, 'hidden': l.hiddenPlatform},
          onSearch: (v) => _filter(search: v, status: _query.status),
          onStatus: (v) => _filter(status: v),
        ),
        ...result.when(
          data: (data) {
            final filtered = data.items
                .where(
                  (item) =>
                      '${item.key} ${item.displayName}'.toLowerCase().contains(
                        _query.search.toLowerCase(),
                      ) &&
                      (_query.status == null ||
                          item.isVisible == (_query.status == 'visible')),
                )
                .toList();
            final page = _query.page.clamp(
              1,
              (filtered.length / _query.pageSize).ceil().clamp(1, 1000000),
            );
            final items = filtered
                .skip((page - 1) * _query.pageSize)
                .take(_query.pageSize)
                .toList();
            return [
              if (items.isEmpty) DataStateMessage(title: l.adminPlatformsEmpty),
              for (final item in items)
                AdminCatalogRow(
                  key: ValueKey('catalog-${item.key}'),
                  item: item,
                  busy: busy,
                  onToggle: (v) => _toggle(item, v),
                  onEdit: () => editCatalog(context, ref, item),
                  onDelete: () => _delete(item),
                ),
              if (filtered.isNotEmpty)
                ListPagination(
                  page: page,
                  pageSize: _query.pageSize,
                  total: filtered.length,
                  busy: busy,
                  onPage: (v) {
                    setState(
                      () => _query = ListQuery(
                        page: v,
                        pageSize: _query.pageSize,
                        search: _query.search,
                        status: _query.status,
                      ),
                    );
                  },
                  onPageSize: (v) {
                    setState(
                      () => _query = ListQuery(
                        pageSize: v,
                        search: _query.search,
                        status: _query.status,
                      ),
                    );
                  },
                ),
            ];
          },
          error: (error, _) => adminError(
            action: l.retryAction,
            title: l.loadFailedTitle,
            description: dataRequestFailureMessage(l, error),
            retry: () => ref.invalidate(adminProviderCatalogProvider),
          ),
          loading: () => adminLoading(l.loadingData),
        ),
      ],
    );
  }
}
