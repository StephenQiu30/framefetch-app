import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:video_server_api/video_server_api.dart';

final class AnalysisLabeledText extends StatelessWidget {
  const AnalysisLabeledText({
    required this.label,
    required this.value,
    super.key,
  });
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: AppSpacing.large),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: AppSpacing.xSmall),
        SelectableText(value, style: Theme.of(context).textTheme.bodyMedium),
      ],
    ),
  );
}

final class AnalysisFindingList extends StatelessWidget {
  const AnalysisFindingList({
    required this.title,
    required this.items,
    super.key,
  });
  final String title;
  final Iterable<ScreenplayFindingResponse> items;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(title, style: Theme.of(context).textTheme.titleMedium),
      const SizedBox(height: AppSpacing.medium),
      if (items.isEmpty)
        Text(AppLocalizations.of(context).analysisEmptySection),
      for (final item in items)
        AnalysisLabeledText(label: item.title, value: item.description),
    ],
  );
}

final class AnalysisStringList extends StatelessWidget {
  const AnalysisStringList({
    required this.title,
    required this.items,
    super.key,
  });
  final String title;
  final Iterable<String> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    return AnalysisLabeledText(
      label: title,
      value: items.map((value) => '• $value').join('\n'),
    );
  }
}
