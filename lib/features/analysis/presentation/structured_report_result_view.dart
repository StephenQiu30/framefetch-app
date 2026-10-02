import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/analysis/presentation/analysis_report_preview.dart';
import 'package:framegrab/features/analysis/presentation/analysis_result_details.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_formatters.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:video_server_api/video_server_api.dart';

final class StructuredReportResultView extends StatelessWidget {
  const StructuredReportResultView({
    required this.result,
    this.reportMarkdown,
    this.analysisId,
    super.key,
  });
  final StructuredReportResultResponse result;
  final String? reportMarkdown;
  final String? analysisId;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      key: const Key('structured-report-result'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(result.title, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: AppSpacing.xLarge),
        DataMetricGrid(
          keyPrefix: 'structured-report',
          metrics: [
            DataMetricValue(
              key: 'sections',
              label: l10n.analysisReportSections,
              value: '${result.sections.length}',
            ),
            DataMetricValue(
              key: 'duration',
              label: l10n.durationLabel,
              value: formatDurationClock(result.media.durationMs ~/ 1000),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xLarge),
        AnalysisLabeledText(
          label: l10n.visualSummaryTitle,
          value: result.summary,
        ),
        for (final section in result.sections) ...[
          const SizedBox(height: AppSpacing.large),
          AnalysisLabeledText(label: section.heading, value: section.body),
          for (final item in section.items) SelectableText('• $item'),
          if (section.evidence.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.medium),
            AnalysisLabeledText(
              label: l10n.articleEvidenceLabel,
              value: section.evidence
                  .map(
                    (e) =>
                        '${formatDurationClock(e.startMs ~/ 1000)}–${formatDurationClock(e.endMs ~/ 1000)} · ${e.note}',
                  )
                  .join('\n'),
            ),
          ],
        ],
        const SizedBox(height: AppSpacing.xLarge),
        AnalysisStringList(
          title: l10n.articleLimitationsTitle,
          items: result.limitations,
        ),
        if (reportMarkdown?.trim().isNotEmpty ?? false)
          AnalysisReportLauncher(
            analysisId: analysisId,
            markdown: reportMarkdown!,
            title: result.title,
          ),
      ],
    );
  }
}
