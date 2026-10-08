import 'package:flutter/material.dart';
import 'package:framefetch/core/theme/app_spacing.dart';
import 'package:framefetch/features/analysis/presentation/analysis_report_preview.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class ContentDocumentResultView extends StatelessWidget {
  const ContentDocumentResultView({
    required this.result,
    required this.reportMarkdown,
    required this.analysisId,
    this.historicalEdit = false,
    super.key,
  });
  final ContentDocumentResult result;
  final String? reportMarkdown;
  final String analysisId;
  final bool historicalEdit;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final Iterable<ContentFinding> findings = result.reviewHistory.isEmpty
        ? const []
        : result.reviewHistory.last.findings;
    return Column(
      key: const Key('content-document-result'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (historicalEdit ||
            result.reviewStatus != ContentDocumentResultReviewStatusEnum.passed)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.large),
            child: Text(
              historicalEdit
                  ? l.contentHistoricalDraft
                  : result.reviewStatus ==
                        ContentDocumentResultReviewStatusEnum.needsMaterial
                  ? l.contentNeedsMaterial
                  : l.contentNeedsReview,
            ),
          ),
        if (reportMarkdown case final markdown?)
          AnalysisReportPreview(markdown: markdown, scrollable: false)
        else ...[
          if (result.title case final title?)
            Text(title, style: Theme.of(context).textTheme.headlineMedium),
          for (final block in result.blocks)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.medium),
              child: switch (block.oneOf.value) {
                final ParagraphBlock p => SelectableText(p.text),
                final QuoteBlock q => SelectableText(q.text),
                final HeadingBlock h => Text(
                  h.text,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                final ListBlock items => SelectableText(
                  [
                    for (var i = 0; i < items.items.length; i++)
                      '${items.ordered ? '${i + 1}.' : '•'} ${items.items[i]}',
                  ].join('\n'),
                ),
                _ => const SizedBox.shrink(),
              },
            ),
        ],
        const SizedBox(height: AppSpacing.large),
        if (findings.isNotEmpty)
          ShadAccordion<String>(
            children: [
              ShadAccordionItem(
                value: 'review',
                title: Text(l.contentReviewTitle),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (final finding in findings)
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppSpacing.small,
                        ),
                        child: SelectableText(
                          '${finding.problem}\n${finding.correction}',
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ShadAccordion<String>(
          children: [
            ShadAccordionItem(
              value: 'review',
              title: Text(l.contentSourceTitle),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (final citation in result.evidenceIndex)
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.small),
                      child: SelectableText(
                        '${citation.quote}\n${citation.materialId}',
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        if (reportMarkdown case final markdown?)
          AnalysisReportLauncher(
            analysisId: analysisId,
            markdown: markdown,
            title: result.title ?? l.contentCreationTitle,
          ),
      ],
    );
  }
}
