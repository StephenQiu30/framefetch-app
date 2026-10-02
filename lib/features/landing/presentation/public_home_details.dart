import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_colors.dart';
import 'package:framegrab/features/landing/presentation/public_home_layout.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

typedef PublicHomeCapability = ({
  String description,
  String eyebrow,
  String title,
});

final class PublicHomeCapabilities extends StatelessWidget {
  const PublicHomeCapabilities({required this.items, super.key});

  final List<PublicHomeCapability> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PublicHomeGrid(
      key: const Key('public-home-capabilities'),
      columns: 3,
      runSpacing: 16,
      children: [
        for (final (index, item) in items.indexed)
          Column(
            key: Key('public-home-capability-$index'),
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShadBadge.secondary(
                    child: Text('${index + 1}'.padLeft(2, '0')),
                  ),
                  Expanded(
                    child: Text(
                      item.eyebrow,
                      textAlign: TextAlign.end,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Semantics(
                header: true,
                child: Text(
                  item.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                item.description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontSize: 14,
                  height: 24 / 14,
                ),
              ),
            ],
          ),
      ],
    );
  }
}

final class PublicHomeSafeguards extends StatelessWidget {
  const PublicHomeSafeguards({required this.items, super.key});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      key: const Key('public-home-safeguards'),
      children: [
        for (final item in items)
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 26),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Icon(
                    PhosphorIconsFill.checkCircle,
                    size: 16,
                    color: context.appColors.success,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
