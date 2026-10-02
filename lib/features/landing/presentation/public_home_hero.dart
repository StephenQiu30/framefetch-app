import 'package:flutter/material.dart';
import 'package:framegrab/features/landing/presentation/public_home_layout.dart';
import 'package:framegrab/features/landing/presentation/public_home_section_intro.dart';
import 'package:framegrab/features/landing/presentation/public_home_workflow.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class PublicHomeHero extends StatelessWidget {
  const PublicHomeHero({required this.onOpenSource, super.key});
  final VoidCallback onOpenSource;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final compact = !publicHomeUsesColumns(context, breakpoint: 640);
    final titleJoin = switch (Localizations.localeOf(context).languageCode) {
      'zh' || 'ja' => '',
      _ => ' ',
    };
    return PublicHomeSplit(
      key: const Key('public-home-hero-layout'),
      primary: true,
      first: Column(
        key: const Key('public-home-hero'),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PublicHomeSectionIntro(
            description: l.publicHomeDescription,
            eyebrow: l.publicHomeEyebrow,
            prominent: true,
            title: compact
                ? l.publicHomeTitle
                : l.publicHomeTitle.replaceAll('\n', titleJoin),
            titleKey: const Key('public-home-title'),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ShadButton(
                key: const Key('public-home-register'),
                onPressed: () => context.push('/auth/register'),
                trailing: const Icon(PhosphorIconsRegular.arrowRight, size: 18),
                height: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Flexible(child: Text(l.publicRegisterAction)),
              ),
              ShadButton.secondary(
                key: const Key('public-home-source'),
                onPressed: onOpenSource,
                leading: const Icon(PhosphorIconsRegular.githubLogo, size: 18),
                trailing: const Icon(
                  PhosphorIconsRegular.arrowUpRight,
                  size: 18,
                ),
                height: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Flexible(child: Text(l.publicSourceAction)),
              ),
            ],
          ),
        ],
      ),
      second: PublicHomeWorkflow(
        title: l.publicWorkflowTitle,
        eyebrow: l.publicWorkflowEyebrow,
        description: l.publicWorkflowDescription,
        items: [
          (
            title: l.publicWorkflowInspectTitle,
            description: l.publicWorkflowInspectDescription,
          ),
          (
            title: l.publicWorkflowSelectTitle,
            description: l.publicWorkflowSelectDescription,
          ),
          (
            title: l.publicWorkflowExecuteTitle,
            description: l.publicWorkflowExecuteDescription,
          ),
          (
            title: l.publicWorkflowDeliverTitle,
            description: l.publicWorkflowDeliverDescription,
          ),
        ],
      ),
    );
  }
}
