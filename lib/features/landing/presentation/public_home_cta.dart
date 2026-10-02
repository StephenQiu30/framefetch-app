import 'package:flutter/material.dart';
import 'package:framegrab/features/landing/presentation/public_home_layout.dart';
import 'package:framegrab/features/landing/presentation/public_home_section_intro.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class PublicHomeCta extends StatelessWidget {
  const PublicHomeCta({required this.onOpenDeployment, super.key});
  final VoidCallback onOpenDeployment;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final intro = PublicHomeSectionIntro(
      description: l.publicStartDescription,
      eyebrow: l.publicStartEyebrow,
      title: l.publicStartTitle,
    );
    final button = ShadButton.secondary(
      key: const Key('public-home-deployment'),
      onPressed: onOpenDeployment,
      trailing: const Icon(PhosphorIconsRegular.arrowUpRight, size: 18),
      height: 0,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Flexible(child: Text(l.publicDeploymentAction)),
    );
    return publicHomeUsesColumns(context, breakpoint: 640)
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: intro),
              const SizedBox(width: 32),
              button,
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [intro, const SizedBox(height: 32), button],
          );
  }
}
