import 'dart:math';

import 'package:flutter/material.dart';
import 'package:framefetch/core/theme/app_spacing.dart';
import 'package:framefetch/features/analysis/presentation/analysis_report_preview.dart';
import 'package:framefetch/features/analysis/presentation/analysis_result_details.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch/shared/presentation/list_query.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class ScreenplayReviewSection extends StatefulWidget {
  const ScreenplayReviewSection({
    required this.result,
    required this.section,
    this.reportMarkdown,
    super.key,
  });
  final ScreenplayAnalysisResultResponse result;
  final String section;
  final String? reportMarkdown;

  @override
  State<ScreenplayReviewSection> createState() =>
      _ScreenplayReviewSectionState();
}

final class _ScreenplayReviewSectionState
    extends State<ScreenplayReviewSection> {
  int _page = 1;
  int _pageSize = 10;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final result = widget.result;
    final pages = max(1, (result.scenes.length / _pageSize).ceil());
    final page = min(_page, pages);
    final children = switch (widget.section) {
      'structure' => <Widget>[
        AnalysisLabeledText(
          label: l10n.analysisPacing,
          value: result.structure.pacingSummary,
        ),
        AnalysisFindingList(
          title: l10n.analysisStructure,
          items: result.structure.acts,
        ),
        const SizedBox(height: AppSpacing.xLarge),
        AnalysisFindingList(
          title: l10n.analysisTurningPoints,
          items: result.structure.turningPoints,
        ),
      ],
      'characters' => <Widget>[
        for (final character in result.characters) ...[
          Text(character.name, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.medium),
          AnalysisLabeledText(label: l10n.analysisGoal, value: character.goal),
          AnalysisLabeledText(
            label: l10n.analysisConflict,
            value: character.conflict,
          ),
          AnalysisLabeledText(
            label: l10n.analysisCharacterArc,
            value: character.arc,
          ),
        ],
      ],
      'dialogue' => <Widget>[
        AnalysisFindingList(
          title: l10n.analysisDialogue,
          items: result.dialogueFindings,
        ),
      ],
      'scenes' => <Widget>[
        ShadAccordion<String>(
          children: [
            for (final scene
                in result.scenes.skip((page - 1) * _pageSize).take(_pageSize))
              ShadAccordionItem(
                value: scene.id,
                title: Text(scene.purpose),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AnalysisLabeledText(
                      label: l10n.analysisConflict,
                      value: scene.conflict,
                    ),
                    AnalysisLabeledText(
                      label: l10n.analysisTurn,
                      value: scene.turn,
                    ),
                    AnalysisLabeledText(
                      label: l10n.analysisPacing,
                      value: scene.pacing,
                    ),
                    for (final finding in scene.findings)
                      SelectableText('• $finding'),
                  ],
                ),
              ),
          ],
        ),
        ListPagination(
          page: page,
          total: result.scenes.length,
          pageSize: _pageSize,
          onPage: (value) => setState(() => _page = value),
          onPageSize: (value) => setState(() {
            _pageSize = value;
            _page = 1;
          }),
        ),
      ],
      'report' => <Widget>[
        if (widget.reportMarkdown != null)
          AnalysisReportPreview(markdown: widget.reportMarkdown!),
      ],
      _ => <Widget>[],
    };
    return Column(
      key: Key('screenplay-section-${widget.section}'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children.isEmpty ? [Text(l10n.analysisEmptySection)] : children,
    );
  }
}
