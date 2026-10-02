import 'package:flutter/material.dart';
import 'package:framegrab/features/landing/presentation/public_home_layout.dart';

final class PublicHomeSectionIntro extends StatelessWidget {
  const PublicHomeSectionIntro({
    this.description,
    this.eyebrow,
    required this.title,
    this.prominent = false,
    this.titleKey,
    super.key,
  });

  final String? description;
  final String? eyebrow;
  final bool prominent;
  final String title;
  final Key? titleKey;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final wide = publicHomeUsesColumns(context, breakpoint: 640);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (eyebrow != null) ...[
          Text(
            eyebrow!,
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontFamily: 'monospace',
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
        ],
        Semantics(
          header: true,
          child: Text(
            title,
            key: titleKey,
            style: theme.textTheme.headlineLarge?.copyWith(
              fontSize: prominent ? (wide ? 48 : 40) : (wide ? 30 : 24),
              fontWeight: FontWeight.w600,
              height: 1.15,
              letterSpacing: -0.8,
            ),
          ),
        ),
        if (description != null) ...[
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 672),
            child: Text(
              description!,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontSize: 18,
                height: 28 / 18,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
