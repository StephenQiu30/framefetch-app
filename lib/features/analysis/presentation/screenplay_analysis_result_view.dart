import 'package:flutter/material.dart';
import 'package:framefetch/core/theme/app_spacing.dart';
import 'package:framefetch/features/analysis/presentation/analysis_report_preview.dart';
import 'package:framefetch/features/analysis/presentation/analysis_result_details.dart';
import 'package:framefetch/features/analysis/presentation/screenplay_review_section.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch/shared/presentation/app_dropdown_field.dart';
import 'package:framefetch/shared/presentation/data_page_view.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

final class ScreenplayAnalysisResultView extends StatefulWidget {
  const ScreenplayAnalysisResultView({
    required this.reportMarkdown,
    required this.result,
    super.key,
  });
  final String? reportMarkdown;
  final ScreenplayAnalysisResultResponse result;

  @override
  State<ScreenplayAnalysisResultView> createState() =>
      _ScreenplayAnalysisResultViewState();
}

final class _ScreenplayAnalysisResultViewState
    extends State<ScreenplayAnalysisResultView> {
  String _section = 'structure';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final result = widget.result;
    final textUnits = result.scenes.any(
      (scene) => scene.sourceSceneId.startsWith('unit-'),
    );
    return Column(
      key: const Key('screenplay-analysis-result'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnalysisFindingList(
          title: l10n.analysisPriorityRevisions,
          items: result.priorityRevisions,
        ),
        const SizedBox(height: AppSpacing.xLarge),
        AnalysisFindingList(
          title: l10n.analysisStrengths,
          items: result.strengths,
        ),
        const SizedBox(height: AppSpacing.xLarge),
        DataMetricGrid(
          keyPrefix: 'screenplay-analysis',
          metrics: [
            DataMetricValue(
              key: 'scenes',
              label: textUnits
                  ? l10n.screenplayTextUnitLabel
                  : l10n.screenplaySceneCoverageLabel,
              value: '${result.scenes.length}',
            ),
            DataMetricValue(
              key: 'characters',
              label: l10n.screenplayMainCharactersLabel,
              value: '${result.characters.length}',
            ),
            DataMetricValue(
              key: 'language',
              label: l10n.languageLabel,
              value: result.language,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xLarge),
        AnalysisLabeledText(
          label: l10n.screenplayLoglineLabel,
          value: result.logline,
        ),
        AnalysisLabeledText(
          label: l10n.screenplaySynopsisLabel,
          value: result.synopsis,
        ),
        AppDropdownField<String>(
          key: const Key('screenplay-result-section'),
          value: _section,
          label: l10n.analysisResultSectionLabel,
          options: [
            AppDropdownOption(
              value: 'structure',
              label: l10n.screenplayStructuredResultTitle,
            ),
            AppDropdownOption(
              value: 'characters',
              label: l10n.analysisCharacters,
            ),
            AppDropdownOption(value: 'dialogue', label: l10n.analysisDialogue),
            AppDropdownOption(
              value: 'scenes',
              label: textUnits
                  ? l10n.screenplayTextUnitLabel
                  : l10n.analysisScenesTab,
            ),
            if (_report(widget.reportMarkdown) != null)
              AppDropdownOption(value: 'report', label: l10n.analysisReportTab),
          ],
          onSelected: (value) {
            if (value != null) setState(() => _section = value);
          },
        ),
        const SizedBox(height: AppSpacing.xLarge),
        ScreenplayReviewSection(
          key: ValueKey(_section),
          result: result,
          section: _section,
          reportMarkdown: widget.reportMarkdown,
        ),
      ],
    );
  }
}

final class ScreenplayRewriteResultView extends StatelessWidget {
  const ScreenplayRewriteResultView({
    required this.reportMarkdown,
    required this.result,
    super.key,
  });

  final String? reportMarkdown;
  final ScreenplayRewriteResultResponse result;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      key: const Key('screenplay-rewrite-result'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DataMetricGrid(
          keyPrefix: 'screenplay-rewrite',
          metrics: [
            DataMetricValue(
              key: 'source-scenes',
              label: l10n.screenplaySourceScenesLabel,
              value: '${result.sourceSceneCount}',
            ),
            DataMetricValue(
              key: 'output-scenes',
              label: l10n.screenplayOutputScenesLabel,
              value: '${result.outputSceneCount}',
            ),
            DataMetricValue(
              key: 'language',
              label: l10n.languageLabel,
              value: '${result.sourceLanguage} → ${result.targetLanguage}',
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.section),
        Text(
          l10n.screenplayGlossaryTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: AppSpacing.medium),
        for (final term in result.glossary)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.small),
            child: SelectableText(
              '${term.source_} → ${term.target} · ${term.category}',
            ),
          ),
        const SizedBox(height: AppSpacing.xLarge),
        Text(
          l10n.screenplayRewriteSummaryTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: AppSpacing.medium),
        for (final summary in result.changeSummary)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.small),
            child: SelectableText('• $summary'),
          ),
        if (_report(reportMarkdown) case final report?) ...[
          const SizedBox(height: AppSpacing.section),
          Text(
            l10n.screenplayFullReportTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: AppSpacing.large),
          AnalysisReportPreview(markdown: report),
        ],
      ],
    );
  }
}

String? _report(String? value) {
  final normalized = value?.trim();
  return normalized == null || normalized.isEmpty ? null : normalized;
}
