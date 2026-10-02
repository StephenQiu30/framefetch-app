import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:framegrab/app/router/app_router.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/history/application/download_bulk_actions.dart';
import 'package:framegrab/features/history/application/download_history_provider.dart';
import 'package:framegrab/features/history/presentation/download_history_item.dart';
import 'package:framegrab/features/history/presentation/download_presentation_labels.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:framegrab/shared/presentation/list_query.dart';
import 'package:framegrab/shared/presentation/swipe_action_hint.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:video_server_api/video_server_api.dart';

final class DownloadHistoryContent extends ConsumerWidget {
  const DownloadHistoryContent({
    required this.data,
    required this.selected,
    required this.busy,
    required this.onSelected,
    required this.onSelectAll,
    required this.onClear,
    required this.onBulk,
    this.message,
    this.completed = 0,
    this.total = 0,
    this.onCreateDownload,
    super.key,
  });
  final DownloadHistoryResponse data;
  final Set<String> selected;
  final bool busy;
  final void Function(String, bool) onSelected;
  final VoidCallback onSelectAll;
  final VoidCallback onClear;
  final Future<void> Function(
    List<DownloadHistoryItemResponse>,
    DownloadBulkAction,
  )
  onBulk;
  final String? message;
  final int completed;
  final int total;
  final VoidCallback? onCreateDownload;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: _content(context, ref),
  );

  List<Widget> _content(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    if (data.items.isEmpty) {
      return [
        ListPagination(
          page: ref.watch(downloadListQueryProvider).page,
          total: data.total,
          pageSize: ref.watch(downloadListQueryProvider).pageSize,
          onPageSize: ref.read(downloadListQueryProvider.notifier).pageSize,
          busy: busy,
          onPage: ref.read(downloadListQueryProvider.notifier).page,
        ),
        DataStateMessage(
          title: localizations.downloadHistoryEmptyTitle,
          description: localizations.downloadHistoryEmptyDescription,
          actionLabel: onCreateDownload == null
              ? null
              : localizations.createDownloadFromHomeAction,
          actionIcon: PhosphorIconsRegular.caretRight,
          onAction: onCreateDownload,
        ),
      ];
    }
    final summary = data.summary;
    return [
      DataMetricGrid(
        keyPrefix: 'download-summary',
        metrics: [
          DataMetricValue(
            key: 'total',
            label: localizations.totalLabel,
            value: '${summary.total}',
          ),
          DataMetricValue(
            key: 'succeeded',
            label: localizations.succeededLabel,
            value: '${summary.succeeded}',
          ),
          DataMetricValue(
            key: 'active',
            label: localizations.activeLabel,
            value: '${summary.active}',
          ),
          DataMetricValue(
            key: 'failed',
            label: localizations.failedLabel,
            value: '${summary.failed}',
          ),
        ],
      ),
      const SizedBox(height: AppSpacing.xLarge),
      if (message != null) Text(message!),
      if (busy) Semantics(liveRegion: true, child: Text('$completed / $total')),
      Wrap(
        spacing: AppSpacing.small,
        runSpacing: AppSpacing.small,
        children: [
          ShadButton.ghost(
            onPressed: busy ? null : onSelectAll,
            child: Text(localizations.bulkSelectAll),
          ),
          ShadButton.ghost(
            onPressed: busy || selected.isEmpty ? null : onClear,
            child: Text(localizations.bulkClear),
          ),
          for (final action in DownloadBulkAction.values)
            if (_targets(data.items.toList(), action).isNotEmpty)
              ShadButton.outline(
                onPressed: busy
                    ? null
                    : () => unawaited(
                        onBulk(_targets(data.items.toList(), action), action),
                      ),
                child: Text(switch (action) {
                  DownloadBulkAction.download => localizations.bulkDownload,
                  DownloadBulkAction.retry => localizations.bulkRetry,
                  DownloadBulkAction.delete => localizations.bulkDelete,
                }),
              ),
        ],
      ),
      const SizedBox(height: AppSpacing.large),
      SwipeActionHint(label: localizations.downloadRowActionsHint),
      const SizedBox(height: AppSpacing.small),
      SlidableAutoCloseBehavior(
        child: Column(
          children: [
            for (final item in data.items)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ShadCheckbox(
                    checkboxPadding: const EdgeInsets.all(12),
                    key: Key('select-download-${item.id}'),
                    value: selected.contains(item.id),
                    enabled: !busy,
                    onChanged: (value) => onSelected(item.id, value),
                  ),
                  const SizedBox(width: AppSpacing.small),
                  Expanded(
                    child: AbsorbPointer(
                      absorbing: busy,
                      child: DownloadHistoryItem(
                        item: item,
                        onTap: () => DownloadDetailRoute(
                          jobId: item.id,
                        ).push<void>(context),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
      ListPagination(
        page: ref.watch(downloadListQueryProvider).page,
        total: data.total,
        pageSize: ref.watch(downloadListQueryProvider).pageSize,
        onPageSize: ref.read(downloadListQueryProvider.notifier).pageSize,
        busy: busy,
        onPage: ref.read(downloadListQueryProvider.notifier).page,
      ),
    ];
  }

  List<DownloadHistoryItemResponse> _targets(
    List<DownloadHistoryItemResponse> items,
    DownloadBulkAction action,
  ) => items
      .where(
        (item) =>
            selected.contains(item.id) &&
            switch (action) {
              DownloadBulkAction.delete => true,
              DownloadBulkAction.download =>
                item.status == DownloadStatus.succeeded && item.fileAvailable,
              DownloadBulkAction.retry =>
                downloadRecovery(
                      sourceKind: item.sourceKind,
                      status: item.status,
                      fileAvailable: item.fileAvailable,
                      errorCode: item.errorCode,
                    ) ==
                    DownloadRecovery.retry,
            },
      )
      .toList();
}
