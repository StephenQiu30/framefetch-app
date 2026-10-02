import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';

final class AppPageIntro extends StatelessWidget {
  const AppPageIntro({
    this.compactTitle = false,
    this.large = false,
    required this.description,
    required this.title,
    super.key,
  });

  final bool compactTitle;
  final bool large;
  final String description;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Semantics(
      container: true,
      explicitChildNodes: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Semantics(
            key: const Key('page-title-heading'),
            container: true,
            header: true,
            label: title,
            child: ExcludeSemantics(
              child: Text(
                title,
                maxLines: compactTitle ? 3 : null,
                overflow: compactTitle ? TextOverflow.ellipsis : null,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontSize: MediaQuery.sizeOf(context).width >= 640
                      ? (large ? 36 : 30)
                      : (large ? 30 : 24),
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                  letterSpacing: -.5,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xSmall),
          Semantics(
            key: const Key('page-description'),
            container: true,
            label: description,
            child: ExcludeSemantics(
              child: Text(
                description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: large ? 16 : 14,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
