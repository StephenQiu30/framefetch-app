import 'package:flutter/material.dart';
import 'package:framefetch/core/theme/app_spacing.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class EditorialReviewView extends StatelessWidget {
  const EditorialReviewView({
    required this.reviews,
    required this.status,
    super.key,
  });
  final Iterable<ContentReview> reviews;
  final String? status;

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) return const SizedBox.shrink();
    final l = AppLocalizations.of(context);
    final findings = reviews.last.findings;
    if (findings.isEmpty && status == 'passed') return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (status == 'needsMaterial' || status == 'needsReview')
            Text(
              status == 'needsMaterial'
                  ? l.contentNeedsMaterial
                  : l.contentNeedsReview,
            ),
          if (findings.isNotEmpty)
            ShadAccordion<String>(
              children: [
                ShadAccordionItem(
                  value: 'editorial-review',
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
        ],
      ),
    );
  }
}
