import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/admin/presentation/admin_analytics_metrics.dart';
import 'package:framegrab/features/admin/presentation/admin_distribution_chart.dart';
import 'package:framegrab/features/admin/presentation/admin_trend_chart.dart';
import 'package:framegrab/features/admin/presentation/analytics_chart_point.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_formatters.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:video_server_api/video_server_api.dart';

final class AdminDownloadAnalyticsContent extends StatelessWidget {
  const AdminDownloadAnalyticsContent({required this.data, super.key});
  final DownloadAnalyticsResponse data;
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final summary = data.summary;
    final points = [
      for (final day in data.daily)
        AnalyticsChartPoint(
          date: '${day.date}',
          total: day.total,
          succeeded: day.succeeded,
          failed: day.failed,
          cancelled: day.cancelled,
          active: day.total - day.succeeded - day.failed - day.cancelled,
        ),
    ]..sort((a, b) => a.date.compareTo(b.date));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AdminTrendChart(points: points, title: l.adminDownloadTrendTitle),
        if (summary.total > 0) ...[
          const SizedBox(height: AppSpacing.section),
          AdminAnalyticsMetrics(
            metrics: [
              (
                l.totalLabel,
                '${summary.total}',
                '${l.succeededLabel} ${summary.succeeded} · ${l.activeLabel} ${summary.active}',
              ),
              (
                l.adminSuccessRate,
                '${summary.successRate.toStringAsFixed(1)}%',
                '${l.failedLabel} ${summary.failed} · ${l.cancelledLabel} ${summary.cancelled}',
              ),
              (l.uniqueUsers, '${summary.uniqueUsers}', ''),
              (
                l.adminDownloadedBytes,
                formatByteCount(summary.downloadedBytes),
                '${l.averageDuration}: ${formatDurationClock(summary.averageDurationSeconds.round())}',
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.section),
          AdminDistributionChart(
            title: l.adminStatusDistribution,
            values: [
              (l.succeededLabel, summary.succeeded),
              (l.activeLabel, summary.active),
              (l.failedLabel, summary.failed),
              (l.cancelledLabel, summary.cancelled),
            ],
          ),
          const SizedBox(height: AppSpacing.section),
          AdminTrendChart(
            points: points,
            title: l.adminCompletionTrend,
            percentage: true,
          ),
          const SizedBox(height: AppSpacing.section),
          Text(
            l.adminSourceBreakdown,
            style: ShadTheme.of(context).textTheme.h4,
          ),
          const SizedBox(height: AppSpacing.medium),
          for (final source in data.sources)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.small),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text(source.sourceName)),
                      Text(
                        '${source.total} · ${(source.total / summary.total * 100).toStringAsFixed(1)}%',
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xSmall),
                  ShadProgress(value: source.total / summary.total),
                ],
              ),
            ),
          const SizedBox(height: AppSpacing.section),
          Text(
            l.adminSourcePerformance,
            style: ShadTheme.of(context).textTheme.h4,
          ),
          const SizedBox(height: AppSpacing.medium),
          for (final source in data.sources)
            ShadAccordion<String>(
              children: [
                ShadAccordionItem(
                  value: source.sourceKey,
                  title: Row(
                    children: [
                      Expanded(child: Text(source.sourceName)),
                      Text('${source.successRate.toStringAsFixed(1)}%'),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        source.sourceKey,
                        style: ShadTheme.of(context).textTheme.muted,
                      ),
                      Text(
                        '${l.totalLabel}: ${source.total} · ${l.uniqueUsers}: ${source.uniqueUsers} · ${formatByteCount(source.downloadedBytes)}',
                      ),
                      Text(
                        '${l.succeededLabel}: ${source.succeeded} · ${l.failedLabel}: ${source.failed} · ${l.cancelledLabel}: ${source.cancelled} · ${l.activeLabel}: ${source.active}',
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ],
    );
  }
}
