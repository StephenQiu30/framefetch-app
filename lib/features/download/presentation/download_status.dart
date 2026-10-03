import 'package:flutter/material.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum DownloadNoticeTone { neutral, destructive }

final class DownloadInlineStatus extends StatelessWidget {
  const DownloadInlineStatus({
    required this.message,
    this.tone = DownloadNoticeTone.destructive,
    super.key,
  });

  final String message;
  final DownloadNoticeTone tone;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ShadTheme.of(context).colorScheme;
    final destructive = tone == DownloadNoticeTone.destructive;
    final foreground = destructive
        ? colorScheme.destructive
        : colorScheme.mutedForeground;
    final background = destructive
        ? colorScheme.destructive.withValues(alpha: .1)
        : colorScheme.muted;

    return Semantics(
      container: true,
      liveRegion: true,
      child: ShadAlert.raw(
        variant: destructive
            ? ShadAlertVariant.destructive
            : ShadAlertVariant.primary,
        icon: Icon(
          destructive
              ? PhosphorIconsRegular.warningCircle
              : PhosphorIconsRegular.info,
        ),
        iconColor: foreground,
        decoration: ShadDecoration(color: background, border: ShadBorder.none),
        descriptionStyle: ShadTheme.of(context).textTheme.p,
        description: Text(message),
      ),
    );
  }
}
