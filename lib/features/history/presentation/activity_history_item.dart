import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/history/presentation/history_record_presentation.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_formatters.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class ActivityHistoryItem extends StatelessWidget {
  const ActivityHistoryItem({
    required this.record,
    required this.onOpen,
    super.key,
  });
  final Object record;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final item = presentHistoryRecord(record, l10n);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.medium),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ShadButton.ghost(
              key: Key('activity-record-${item.id}'),
              height: 0,
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.small),
              onPressed: onOpen,
              mainAxisAlignment: MainAxisAlignment.start,
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: AppSpacing.xSmall),
                    Text(
                      '${item.kind} · ${item.status}',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: AppSpacing.xSmall),
                    Text(
                      formatDataTime(context, item.createdAt),
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    if (item.sourceUnavailable) ...[
                      const SizedBox(height: AppSpacing.xSmall),
                      Text(
                        l10n.activitySourceUnavailable,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: AppSpacing.medium),
            child: Icon(PhosphorIconsRegular.caretRight, size: 18),
          ),
        ],
      ),
    );
  }
}
