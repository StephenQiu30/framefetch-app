import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/admin/application/admin_mutation_controller.dart';
import 'package:framegrab/features/admin/application/admin_providers.dart';
import 'package:framegrab/features/admin/data/admin_repository.dart';
import 'package:framegrab/features/admin/presentation/admin_edit_sheet.dart';
import 'package:framegrab/features/admin/presentation/admin_page.dart';
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
  static String _fileKey(StoredFileResponse file) =>
      '${file.category.name}:${file.id}';

  Future<void> _delete(StoredFileResponse file) async {
    final l = AppLocalizations.of(context);
    if (!await confirmAdminDelete(
          context,
          title: l.deleteAction,
          description: l.adminDeleteFileDescription,
        ) ||
        !mounted) {
      return;
    }
    final query = ref.read(fileListQueryProvider);
    final total = ref.read(adminFilesProvider).value?.total ?? 0;
    final result = await ref
        .read(adminFileMutationProvider.notifier)
        .run(() => ref.read(adminRepositoryProvider).deleteFile(file));
    if (!mounted || result == AdminMutationResult.stale) return;
    if (result == AdminMutationResult.failed) {
      ShadSonner.of(
        context,
      ).show(ShadToast(description: Text(l.adminActionFailed)));
      return;
    }
    final lastPage = ((total - 1) / query.pageSize).ceil().clamp(1, 1000000);
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
    final busy = ref.watch(adminFileMutationProvider);
    return AdminPage(
      title: l.adminFilesTitle,
      description: l.adminFilesDescription,
      refreshLabel: l.refreshAction,
      onRefresh: () => ref.refresh(adminFilesProvider.future).then((_) {}),
      children: [
        ...result.when(
          data: (data) => [
            if (data.items.isEmpty)
              DataStateMessage(
                title: l.adminFilesEmpty,
                description: l.adminFilesEmptyDescription,
              ),
            for (final file in data.items)
              Padding(
                key: ValueKey('admin-file-${_fileKey(file)}'),
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
                      enabled: !busy,
                      onPressed: busy ? null : () => _delete(file),
                      child: Text(l.deleteAction),
                    ),
                  ],
                ),
              ),
            if (data.total > 0)
              ListPagination(
                page: query.page,
                pageSize: query.pageSize,
                total: data.total,
                busy: busy,
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
