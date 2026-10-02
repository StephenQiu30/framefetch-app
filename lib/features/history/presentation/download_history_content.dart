import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:framegrab/app/router/app_router.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/history/application/download_history_provider.dart';
import 'package:framegrab/features/history/presentation/download_history_item.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:framegrab/shared/presentation/list_query.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:video_server_api/video_server_api.dart';

final class DownloadHistoryContent extends ConsumerWidget {
  const DownloadHistoryContent({
    required this.data,
    this.onCreateDownload,
    super.key,
  });
  final DownloadHistoryResponse data;
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
          onPage: ref.read(downloadListQueryProvider.notifier).page,
        ),
        DataStateMessage(
          title: localizations.downloadHistoryEmptyTitle,
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
      SlidableAutoCloseBehavior(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final item in data.items)
              DownloadHistoryItem(
                item: item,
                onTap: () =>
                    DownloadDetailRoute(jobId: item.id).push<void>(context),
              ),
          ],
        ),
      ),
      ListPagination(
        page: ref.watch(downloadListQueryProvider).page,
        total: data.total,
        pageSize: ref.watch(downloadListQueryProvider).pageSize,
        onPageSize: ref.read(downloadListQueryProvider.notifier).pageSize,
        onPage: ref.read(downloadListQueryProvider.notifier).page,
      ),
    ];
  }
}
