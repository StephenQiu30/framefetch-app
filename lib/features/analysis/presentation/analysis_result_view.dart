import 'package:flutter/material.dart';
import 'package:framegrab/features/analysis/presentation/screenplay_analysis_result_view.dart';
import 'package:framegrab/features/analysis/presentation/structured_report_result_view.dart';
import 'package:framegrab/features/analysis/presentation/video_analysis_result_view.dart';
import 'package:framegrab/features/analysis/presentation/video_article_result_view.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:video_server_api/video_server_api.dart';

final class AnalysisResultView extends StatelessWidget {
  const AnalysisResultView({required this.job, super.key});

  final AnalysisResponse job;

  @override
  Widget build(BuildContext context) {
    final result = job.result?.oneOf.value;
    return switch (result) {
      final VideoAnalysisResultResponse visual => VideoAnalysisResultView(
        reportMarkdown: job.reportMarkdown,
        analysisId: job.id,
        result: visual,
      ),
      final VideoArticleResultResponse article => VideoArticleResultView(
        reportMarkdown: job.reportMarkdown,
        analysisId: job.id,
        result: article,
      ),
      final StructuredReportResultResponse report => StructuredReportResultView(
        reportMarkdown: job.reportMarkdown,
        analysisId: job.id,
        result: report,
      ),
      final ScreenplayAnalysisResultResponse screenplay =>
        ScreenplayAnalysisResultView(
          reportMarkdown: job.reportMarkdown,
          result: screenplay,
        ),
      final ScreenplayRewriteResultResponse rewrite =>
        ScreenplayRewriteResultView(
          reportMarkdown: job.reportMarkdown,
          result: rewrite,
        ),
      _ => Text(AppLocalizations.of(context).analysisInvalidResult),
    };
  }
}
