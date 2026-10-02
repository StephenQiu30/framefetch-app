import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/history/application/download_history_provider.dart';
import 'package:framegrab/features/history/presentation/download_history_content.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_spinner.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:framegrab/shared/presentation/data_request_failure_message.dart';
import 'package:framegrab/shared/presentation/list_filters.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:video_server_api/video_server_api.dart';

final class DownloadHistoryScreen extends ConsumerStatefulWidget {
  const DownloadHistoryScreen({this.onCreateDownload, super.key});

  final VoidCallback? onCreateDownload;

  @override
  ConsumerState<DownloadHistoryScreen> createState() =>
      _DownloadHistoryScreenState();
}

final class _DownloadHistoryScreenState
    extends ConsumerState<DownloadHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    ref.listen(downloadHistoryProvider, (_, next) {
      final data = next.value;
      final query = ref.read(downloadListQueryProvider);
      if (data == null ||
          data.page != query.page ||
          data.pageSize != query.pageSize) {
        return;
      }
      final last = (data.total / query.pageSize).ceil().clamp(1, 1000000);
      if (query.page > last) {
        unawaited(
          Future<void>.microtask(() {
            if (mounted) {
              ref.read(downloadListQueryProvider.notifier).page(last);
            }
          }),
        );
      }
    });
    final result = ref.watch(downloadHistoryProvider);
    return DataPageView(
      title: localizations.downloadHistoryNavigation,
      description: localizations.downloadHistoryDescription,
      refreshLabel: localizations.refreshAction,
      onRefresh: () => ref.refresh(downloadHistoryProvider.future).then((_) {}),
      children: [
        ListFilters(
          query: ref.watch(downloadListQueryProvider),
          searchLabel: localizations.searchDownloads,
          statuses: {
            for (final status in DownloadStatus.values.where(
              (v) => v != DownloadStatus.unknownDefaultOpenApi,
            ))
              status.name: _statusLabel(status, localizations),
          },
          onSearch: (value) => ref
              .read(downloadListQueryProvider.notifier)
              .filter(
                search: value,
                status: ref.read(downloadListQueryProvider).status,
              ),
          onStatus: (value) => ref
              .read(downloadListQueryProvider.notifier)
              .filter(status: value),
        ),
        ...result.when(
          data: (data) => _content(context, data),
          error: (error, _) => [
            DataStateMessage(
              icon: PhosphorIconsRegular.cloudSlash,
              title: localizations.loadFailedTitle,
              description: dataRequestFailureMessage(localizations, error),
              actionLabel: localizations.retryAction,
              onAction: () => ref.invalidate(downloadHistoryProvider),
            ),
          ],
          loading: () => [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 64),
              child: Align(
                alignment: Alignment.centerLeft,
                child: AppSpinner(),
              ),
            ),
            Text(localizations.loadingData),
          ],
        ),
      ],
    );
  }

  List<Widget> _content(BuildContext context, DownloadHistoryResponse data) => [
    DownloadHistoryContent(
      data: data,
      onCreateDownload: widget.onCreateDownload,
    ),
  ];
}

String _statusLabel(DownloadStatus status, AppLocalizations l) =>
    switch (status.name) {
      'queued' => l.downloadStatusQueued,
      'running' => l.downloadStatusRunning,
      'retryWait' => l.downloadStatusRetryWait,
      'succeeded' => l.downloadStatusSucceeded,
      'failed' => l.downloadStatusFailed,
      'cancelled' => l.downloadStatusCancelled,
      _ => status.name,
    };
