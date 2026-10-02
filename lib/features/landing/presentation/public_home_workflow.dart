import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

typedef PublicHomeWorkflowItem = ({String description, String title});

final class PublicHomeWorkflow extends StatelessWidget {
  const PublicHomeWorkflow({
    required this.items,
    required this.title,
    required this.eyebrow,
    required this.description,
    super.key,
  });

  final List<PublicHomeWorkflowItem> items;
  final String title;
  final String eyebrow;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      key: const Key('public-home-workflow'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShadBadge.secondary(child: Text(eyebrow)),
        const SizedBox(height: 16),
        Semantics(
          header: true,
          child: Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 1.375,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 32),
        for (final (index, item) in items.indexed)
          Padding(
            padding: EdgeInsets.fromLTRB(
              12,
              10,
              12,
              index == items.length - 1 ? 10 : 18,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 30,
                  child: Text(
                    '${index + 1}'.padLeft(2, '0'),
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontSize: 14,
                      fontFeatures: const [FontFeature.tabularFigures()],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.description,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
