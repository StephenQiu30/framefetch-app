import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class AdminAnalyticsMetrics extends StatelessWidget {
  const AdminAnalyticsMetrics({required this.metrics, super.key});
  final List<(String, String, String)> metrics;
  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final columns = constraints.maxWidth >= 600 ? 4 : 2;
      final width =
          (constraints.maxWidth - AppSpacing.large * (columns - 1)) / columns;
      return Wrap(
        spacing: AppSpacing.large,
        runSpacing: AppSpacing.xLarge,
        children: [
          for (final metric in metrics)
            SizedBox(
              width: width,
              child: Semantics(
                label: '${metric.$1}: ${metric.$2}. ${metric.$3}',
                child: ExcludeSemantics(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        metric.$1,
                        style: ShadTheme.of(context).textTheme.small,
                      ),
                      const SizedBox(height: AppSpacing.small),
                      Text(
                        metric.$2,
                        style: ShadTheme.of(context).textTheme.h3,
                      ),
                      const SizedBox(height: AppSpacing.small),
                      Text(
                        metric.$3,
                        style: ShadTheme.of(context).textTheme.muted,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      );
    },
  );
}
