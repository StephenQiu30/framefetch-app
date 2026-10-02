import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/history/application/download_bulk_actions.dart';
import 'package:framegrab/features/history/application/download_history_provider.dart';
import 'package:framegrab/features/history/presentation/download_history_content.dart';
import 'package:framegrab/features/history/presentation/download_presentation_labels.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_spinner.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:framegrab/shared/presentation/data_request_failure_message.dart';
import 'package:framegrab/shared/presentation/destructive_confirmation.dart';
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
  final Set<String> _selected = {};
  bool _busy = false;
  int _completed = 0;
  int _total = 0;
  String? _message;

  Future<void> _bulk(
    List<DownloadHistoryItemResponse> items,
    DownloadBulkAction action,
  ) async {
    if (_busy || items.isEmpty) return;
    final l = AppLocalizations.of(context);
    final session = ref.read(authSessionProvider.notifier);
    final generation = session.sessionGeneration;
    if (action == DownloadBulkAction.delete) {
      final confirmed = await showDestructiveConfirmation(
        context: context,
        title: '${l.bulkDelete} (${items.length})',
        description: items.any((i) => isActiveDownloadStatus(i.status.name))
            ? l.deleteDownloadActiveDescription
            : l.deleteDownloadDescription,
        cancelLabel: l.keepDownloadAction,
        confirmLabel: l.confirmDeleteAction,
      );
      if (!confirmed || !mounted || generation != session.sessionGeneration) {
        return;
      }
    }
    setState(() {
      _busy = true;
      _message = null;
      _completed = 0;
      _total = items.length;
    });
    try {
      final result = await ref
          .read(downloadBulkActionsProvider)
          .run(
            items.map((i) => i.id).toList(),
            action,
            onProgress: (done, total) {
              if (mounted) {
                setState(() {
                  _completed = done;
                  _total = total;
                });
              }
            },
          );
      if (!mounted || !result.current) return;
      setState(() {
        _selected.removeAll(result.completed);
        _message =
            '${l.bulkActionSummary}: ${result.completed.length} · ${l.failedLabel}: ${result.errors.length}';
      });
      ref.invalidate(downloadHistoryProvider);
    } finally {
      if (mounted && generation == session.sessionGeneration) {
        setState(() => _busy = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    ref.watch(downloadBulkActionsProvider);
    ref.listen(downloadListQueryProvider, (_, _) {
      _selected.clear();
      _message = null;
    });
    ref.listen(authSessionProvider.select((s) => s.user?.id), (previous, next) {
      if (previous != next) {
        setState(() {
          _selected.clear();
          _message = null;
          _busy = false;
        });
      }
    });
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
      selected: Set.unmodifiable(_selected),
      busy: _busy,
      message: _message,
      completed: _completed,
      total: _total,
      onCreateDownload: widget.onCreateDownload,
      onBulk: _bulk,
      onSelectAll: () =>
          setState(() => _selected.addAll(data.items.map((i) => i.id))),
      onClear: () => setState(_selected.clear),
      onSelected: (id, value) => setState(() {
        if (value) {
          _selected.add(id);
        } else {
          _selected.remove(id);
        }
      }),
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
