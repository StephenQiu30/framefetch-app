import 'package:flutter/material.dart';
import 'package:framegrab/features/landing/presentation/public_home_cta.dart';
import 'package:framegrab/features/landing/presentation/public_home_details.dart';
import 'package:framegrab/features/landing/presentation/public_home_faq.dart';
import 'package:framegrab/features/landing/presentation/public_home_layout.dart';
import 'package:framegrab/features/landing/presentation/public_home_section_intro.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class PublicHomeContentSections extends StatelessWidget {
  const PublicHomeContentSections({required this.onOpenDeployment, super.key});
  final VoidCallback onOpenDeployment;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final vertical = publicHomeUsesColumns(context) ? 64.0 : 48.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: vertical),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PublicHomeSectionIntro(
                description: l.publicHomeCapabilitiesDescription,
                eyebrow: l.publicCapabilitiesEyebrow,
                title: l.publicHomeCapabilitiesTitle,
              ),
              const SizedBox(height: 48),
              PublicHomeCapabilities(
                items: [
                  (
                    eyebrow: l.publicVideoEyebrow,
                    title: l.publicVideoTitle,
                    description: l.publicVideoDescription,
                  ),
                  (
                    eyebrow: l.publicDocumentEyebrow,
                    title: l.publicDocumentTitle,
                    description: l.publicDocumentDescription,
                  ),
                  (
                    eyebrow: l.publicAnalysisEyebrow,
                    title: l.publicAnalysisTitle,
                    description: l.publicAnalysisDescription,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: vertical),
          child: PublicHomeSplit(
            key: const Key('public-home-architecture-layout'),
            first: PublicHomeSectionIntro(
              description: l.publicTrustDescription,
              eyebrow: l.publicTrustEyebrow,
              title: l.publicTrustTitle,
            ),
            second: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: ShadBadge.secondary(
                    child: Text(l.publicSafetyEyebrow),
                  ),
                ),
                const SizedBox(height: 16),
                Semantics(
                  header: true,
                  child: Text(
                    l.publicSafetyTitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  l.publicSafetyDescription,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 32),
                PublicHomeSafeguards(
                  items: [
                    l.publicSafeguardSession,
                    l.publicSafeguardWorkers,
                    l.publicSafeguardArtifacts,
                    l.publicSafeguardAuthorization,
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: vertical),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PublicHomeFaq(
                description: l.publicFaqDescription,
                eyebrow: l.publicFaqEyebrow,
                title: l.publicFaqTitle,
                items: [
                  (
                    question: l.publicFaqWhatQuestion,
                    answer: l.publicFaqWhatAnswer,
                  ),
                  (
                    question: l.publicFaqReportsQuestion,
                    answer: l.publicFaqReportsAnswer,
                  ),
                  (
                    question: l.publicFaqImportQuestion,
                    answer: l.publicFaqImportAnswer,
                  ),
                  (
                    question: l.publicFaqCostQuestion,
                    answer: l.publicFaqCostAnswer,
                  ),
                  (
                    question: l.publicFaqPlatformsQuestion,
                    answer: l.publicFaqPlatformsAnswer,
                  ),
                  (
                    question: l.publicFaqMobileQuestion,
                    answer: l.publicFaqMobileAnswer,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: ShadButton.link(
                  key: const Key('public-home-guide'),
                  onPressed: () => context.push('/guide'),
                  height: 0,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Flexible(child: Text(l.publicGuideAction)),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: vertical),
          child: PublicHomeCta(onOpenDeployment: onOpenDeployment),
        ),
      ],
    );
  }
}
