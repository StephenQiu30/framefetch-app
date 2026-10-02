import 'package:flutter/material.dart';
import 'package:framegrab/features/landing/presentation/public_home_layout.dart';
import 'package:framegrab/features/landing/presentation/public_home_section_intro.dart';

typedef PublicHomeQuestion = ({String answer, String question});

final class PublicHomeFaq extends StatelessWidget {
  const PublicHomeFaq({
    required this.description,
    required this.eyebrow,
    required this.items,
    required this.title,
    super.key,
  });

  final String description;
  final String eyebrow;
  final List<PublicHomeQuestion> items;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      key: const Key('public-home-faq'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PublicHomeSectionIntro(
          description: description,
          eyebrow: eyebrow,
          title: title,
        ),
        const SizedBox(height: 48),
        PublicHomeGrid(
          columns: 2,
          spacing: 80,
          children: [
            for (final (index, item) in items.indexed)
              Column(
                key: Key('public-home-question-$index'),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Semantics(
                    header: true,
                    child: Text(
                      item.question,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    item.answer,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}
