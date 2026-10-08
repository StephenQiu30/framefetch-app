import 'package:flutter/material.dart';
import 'package:framefetch/core/theme/app_spacing.dart';
import 'package:framefetch/features/analysis/presentation/analysis_report_preview.dart';
import 'package:framefetch/features/analysis/presentation/editorial_review_view.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch/shared/presentation/data_formatters.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class VideoArticleResultView extends StatelessWidget {
  const VideoArticleResultView({
    required this.reportMarkdown,
    required this.result,
    this.analysisId,
    super.key,
  });

  final String? reportMarkdown;
  final String? analysisId;
  final VideoArticleResultResponse result;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      key: const Key('video-article-result'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnalysisReportPreview(
          markdown:
              reportMarkdown ??
              [
                '# ${result.title}',
                if (result.lead.isNotEmpty) result.lead,
                for (final section in result.sections)
                  '${section.title.isEmpty ? '' : '## ${section.title}\n\n'}${section.body}',
                if (result.closing.isNotEmpty) result.closing,
              ].join('\n\n'),
          scrollable: false,
        ),
        EditorialReviewView(
          reviews: result.reviewHistory ?? const [],
          status: result.reviewStatus?.name,
        ),
        const SizedBox(height: AppSpacing.large),
        ShadAccordion<String>(
          children: [
            ShadAccordionItem(
              value: 'sources',
              title: Text(l10n.contentSourceTitle),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (final section in result.sections)
                    for (final evidence in section.evidence)
                      Text(_evidence(evidence)),
                  for (final limitation in result.limitations) Text(limitation),
                ],
              ),
            ),
          ],
        ),
        if (reportMarkdown case final report?)
          AnalysisReportLauncher(
            analysisId: analysisId,
            markdown: report,
            title: result.title,
          ),
      ],
    );
  }
}

String _evidence(VideoArticleEvidenceResponse value) =>
    '${formatDurationClock(value.startMs ~/ 1000)}–'
    '${formatDurationClock(value.endMs ~/ 1000)} · ${value.note}';
