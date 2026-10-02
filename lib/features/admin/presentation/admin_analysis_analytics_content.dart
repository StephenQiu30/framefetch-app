import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/admin/presentation/admin_analytics_metrics.dart';
import 'package:framegrab/features/admin/presentation/admin_distribution_chart.dart';
import 'package:framegrab/features/admin/presentation/admin_trend_chart.dart';
import 'package:framegrab/features/admin/presentation/analytics_chart_point.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:video_server_api/video_server_api.dart';

final class AdminAnalysisAnalyticsContent extends StatelessWidget {
  const AdminAnalysisAnalyticsContent({required this.data, super.key});
  final AnalysisAnalyticsResponse data;
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final summary = data.summary;
    if (summary.total == 0) {
      return DataStateMessage(
        title: l.adminAnalysisEmpty,
        description: l.adminAnalysisEmptyDescription,
      );
    }
    final decided = summary.succeeded + summary.failed;
    final points = [
      for (final day in data.daily)
        AnalyticsChartPoint(
          date: '${day.date}',
          total: day.total,
          succeeded: day.succeeded,
          failed: day.failed,
          cancelled: day.cancelled,
          active: day.active,
        ),
    ]..sort((a, b) => a.date.compareTo(b.date));
    final status = AdminDistributionChart(
      title: l.adminAnalysisStatus,
      values: [
        (l.succeededLabel, summary.succeeded),
        (l.activeLabel, summary.active),
        (l.failedLabel, summary.failed),
        (l.cancelledLabel, summary.cancelled),
      ],
    );
    final inputs = AdminDistributionChart(
      title: l.adminAnalysisInput,
      values: [
        for (final input in data.inputs)
          (
            input.inputKind == AnalysisInputKind.video
                ? l.videoFile
                : l.screenplayDocumentsNavigation,
            input.total,
          ),
      ],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l.adminAnalysisScopeHint,
          style: ShadTheme.of(context).textTheme.muted,
        ),
        const SizedBox(height: AppSpacing.medium),
        AdminTrendChart(points: points, title: l.adminAnalysisTrendTitle),
        const SizedBox(height: AppSpacing.section),
        AdminAnalyticsMetrics(
          metrics: [
            (
              l.adminAnalysisExecutions,
              '${summary.total}',
              '${l.succeededLabel} ${summary.succeeded} · ${l.failedLabel} ${summary.failed}',
            ),
            (
              l.adminSuccessRate,
              decided == 0
                  ? '—'
                  : '${(summary.succeeded / decided * 100).toStringAsFixed(1)}%',
              l.adminAnalysisRateFormula,
            ),
            (
              l.adminAnalysisDuration,
              summary.averageDurationSeconds == null
                  ? '—'
                  : '${summary.averageDurationSeconds!.toStringAsFixed(1)} s',
              '${summary.completedDurationCount} ${l.adminAnalysisDurationCount}',
            ),
            (l.activeLabel, '${summary.active}', ''),
          ],
        ),
        const SizedBox(height: AppSpacing.section),
        LayoutBuilder(
          builder: (context, constraints) => constraints.maxWidth >= 800
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: status),
                    const SizedBox(width: AppSpacing.xxLarge),
                    Expanded(child: inputs),
                  ],
                )
              : Column(
                  children: [
                    status,
                    const SizedBox(height: AppSpacing.section),
                    inputs,
                  ],
                ),
        ),
      ],
    );
  }
}
