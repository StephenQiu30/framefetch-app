import 'package:flutter/material.dart';
import 'package:framegrab/l10n/app_localizations.dart';

final class MediaCoverFallback extends StatelessWidget {
  const MediaCoverFallback({
    this.compact = false,
    this.detail,
    this.eyebrow,
    this.pending = false,
    this.title,
    super.key,
  });

  final String? detail;
  final String? eyebrow;
  final bool compact;
  final bool pending;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final cardColor = colors.surfaceContainerHigh.withValues(alpha: .6);
    final foreground = colors.onSurface;
    final label = pending
        ? localizations.mediaCoverPending
        : localizations.mediaCoverUnavailable;
    final cleanEyebrow = _clean(eyebrow);
    final cleanTitle = _clean(title);
    final cleanDetail = _clean(detail);
    final compactMetadata = [
      if (cleanTitle != null) cleanEyebrow,
      cleanDetail,
    ].whereType<String>().join(' · ');
    final compactTitle = cleanTitle ?? cleanEyebrow;
    final labelStyle = theme.textTheme.labelSmall?.copyWith(
      color: foreground.withValues(alpha: 0.72),
      fontSize: compact ? 8 : null,
      fontWeight: FontWeight.w600,
      height: compact ? 1 : null,
      letterSpacing: compact ? 0.1 : 0.2,
    );
    final eyebrowStyle = theme.textTheme.labelSmall?.copyWith(
      color: foreground.withValues(alpha: 0.68),
      letterSpacing: 0.3,
    );
    final titleStyle = theme.textTheme.titleSmall?.copyWith(
      color: foreground,
      fontSize: compact ? 11 : null,
      fontWeight: FontWeight.w500,
      height: compact ? 1.05 : null,
    );
    final detailStyle = theme.textTheme.labelSmall?.copyWith(
      color: foreground.withValues(alpha: 0.72),
      fontSize: compact ? 8 : null,
      height: compact ? 1 : null,
    );
    final titleText = compact
        ? compactTitle ?? localizations.mediaCoverLabel
        : cleanTitle ?? localizations.mediaCoverLabel;
    final supportingText = compact ? compactMetadata : cleanDetail ?? '';

    return DecoratedBox(
      decoration: BoxDecoration(color: cardColor),
      child: Padding(
        padding: EdgeInsets.all(compact ? 6 : 12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: compact
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              compact ? label : cleanEyebrow ?? label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: compact ? labelStyle : eyebrowStyle,
            ),
            if (compact) const SizedBox(height: 2),
            Text(
              titleText,
              maxLines: compact ? 1 : 2,
              overflow: TextOverflow.ellipsis,
              style: titleStyle,
            ),
            if (!compact || supportingText.isNotEmpty) ...[
              if (compact) const SizedBox(height: 2),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (supportingText.isNotEmpty)
                    Text(
                      supportingText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: detailStyle,
                    ),
                  if (!compact && cleanEyebrow != null)
                    Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: labelStyle,
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

String? _clean(String? value) {
  final normalized = value?.trim();
  return normalized == null || normalized.isEmpty ? null : normalized;
}
