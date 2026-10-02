import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/admin/application/admin_providers.dart';
import 'package:framegrab/features/admin/application/admin_selection_controller.dart';
import 'package:framegrab/features/admin/data/admin_repository.dart';
import 'package:framegrab/features/admin/presentation/admin_bulk_delete_bar.dart';
import 'package:framegrab/features/admin/presentation/admin_edit_sheet.dart';
import 'package:framegrab/features/admin/presentation/admin_page.dart';
import 'package:framegrab/features/admin/presentation/storage_cleanup_sheet.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_formatters.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:framegrab/shared/presentation/data_request_failure_message.dart';
import 'package:framegrab/shared/presentation/list_query.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:video_server_api/video_server_api.dart';

final class AdminStorageScreen extends ConsumerStatefulWidget {
  const AdminStorageScreen({super.key});
  @override
  ConsumerState<AdminStorageScreen> createState() => _AdminStorageScreenState();
}

final class _AdminStorageScreenState extends ConsumerState<AdminStorageScreen> {
  bool _busy = false;
  static String _fileKey(StoredFileResponse file) =>
      '${file.category.name}:${file.id}';

  Future<void> _cleanup() async {
    final l = AppLocalizations.of(context);
    StorageCleanupResponse? result;
    setState(() => _busy = true);
    try {
      final saved = await showShadSheet<bool>(
        context: context,
        isDismissible: false,
        builder: (_) => ShadSheet(
          draggable: false,
          closeIcon: const SizedBox.shrink(),
          isScrollControlled: true,
          child: Builder(
            builder: (_) => StorageCleanupSheet(
              onCleanup: (days) async {
                result = await ref
                    .read(adminRepositoryProvider)
                    .cleanupFiles(days);
              },
            ),
          ),
        ),
      );
      if (saved != true || result == null || !mounted) return;
      ref.read(adminFileSelectionProvider.notifier).clear();
      ref.read(fileListQueryProvider.notifier).page(1);
      ref.invalidate(adminFilesProvider);
      ShadSonner.of(context).show(
        ShadToast(
          description: Text(
            l.adminCleanupComplete(
              result!.removedResources,
              formatByteCount(result!.freedBytes),
            ),
          ),
        ),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _delete(
    List<StoredFileResponse> files, [
    StoredFileResponse? item,
  ]) async {
    final l = AppLocalizations.of(context);
    if (!await confirmAdminDelete(
          context,
          title: item == null ? l.adminDeleteSelectionTitle : l.deleteAction,
          description: l.adminDeleteFileDescription,
        ) ||
        !mounted) {
      return;
    }
    final controller = ref.read(adminFileSelectionProvider.notifier);
    if (item != null) controller.selectPage([_fileKey(item)], true);
    final query = ref.read(fileListQueryProvider);
    final total = ref.read(adminFilesProvider).value?.total ?? 0;
    final requestedCount = ref.read(adminFileSelectionProvider).selected.length;
    final indexed = {for (final file in files) _fileKey(file): file};
    final current = await controller.deleteSelected(
      (id) => ref.read(adminRepositoryProvider).deleteFile(indexed[id]!),
    );
    if (!current || !mounted) return;
    final removed =
        requestedCount - ref.read(adminFileSelectionProvider).selected.length;
    final lastPage = ((total - removed) / query.pageSize).ceil().clamp(
      1,
      1000000,
    );
    if (query.page > lastPage) {
      ref.read(fileListQueryProvider.notifier).page(lastPage);
    }
    ref.invalidate(adminFilesProvider);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final result = ref.watch(adminFilesProvider);
    final query = ref.watch(fileListQueryProvider);
    final selection = ref.watch(adminFileSelectionProvider);
    final controller = ref.read(adminFileSelectionProvider.notifier);
    ref.listen(fileListQueryProvider, (_, _) => controller.clear());
    return AdminPage(
      title: l.adminFilesTitle,
      description: l.adminFilesDescription,
      refreshLabel: l.refreshAction,
      onRefresh: () => ref.refresh(adminFilesProvider.future).then((_) {}),
      children: [
        ShadButton.destructive(
          enabled: !_busy && !selection.busy,
          onPressed: _busy || selection.busy ? null : _cleanup,
          child: Text(l.adminCleanupAction),
        ),
        const SizedBox(height: AppSpacing.medium),
        ...result.when(
          data: (data) => [
            if (data.items.isEmpty)
              DataStateMessage(
                title: l.adminFilesEmpty,
                description: l.adminFilesEmptyDescription,
              ),
            if (data.items.isNotEmpty)
              AdminBulkDeleteBar(
                disabled: _busy,
                state: selection,
                eligibleIds: [for (final file in data.items) _fileKey(file)],
                onSelectPage: (v) =>
                    controller.selectPage(data.items.map(_fileKey), v),
                onDelete: () => _delete(data.items.toList()),
              ),
            for (final file in data.items)
              AdminSelectionRow(
                key: ValueKey('admin-file-${_fileKey(file)}'),
                selected: selection.selected.contains(_fileKey(file)),
                enabled: !selection.busy && !_busy,
                label: file.name,
                onChanged: (v) => controller.toggle(_fileKey(file), v),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSpacing.medium,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        file.name,
                        style: ShadTheme.of(context).textTheme.large,
                      ),
                      const SizedBox(height: AppSpacing.xSmall),
                      Text(
                        '${file.category.name == 'video'
                            ? l.videoFile
                            : file.category.name == 'screenplay'
                            ? l.screenplayDocumentsNavigation
                            : l.analysisReport} · ${formatByteCount(file.sizeBytes)} · ${l.adminObjectCount}: ${file.objectCount}\n${formatDataTime(context, file.createdAt)}',
                        style: ShadTheme.of(context).textTheme.muted,
                      ),
                      ShadButton.ghost(
                        enabled: !selection.busy && !_busy,
                        onPressed: selection.busy || _busy
                            ? null
                            : () => _delete(data.items.toList(), file),
                        child: Text(l.deleteAction),
                      ),
                    ],
                  ),
                ),
              ),
            if (data.total > 0)
              ListPagination(
                page: query.page,
                pageSize: query.pageSize,
                total: data.total,
                busy: selection.busy || _busy,
                onPage: ref.read(fileListQueryProvider.notifier).page,
                onPageSize: ref.read(fileListQueryProvider.notifier).pageSize,
              ),
          ],
          error: (error, _) => adminError(
            action: l.retryAction,
            title: l.loadFailedTitle,
            description: dataRequestFailureMessage(l, error),
            retry: () => ref.invalidate(adminFilesProvider),
          ),
          loading: () => adminLoading(l.loadingData),
        ),
      ],
    );
  }
}
