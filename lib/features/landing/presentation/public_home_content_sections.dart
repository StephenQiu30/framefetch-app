import 'package:flutter/material.dart';
import 'package:framefetch/features/landing/presentation/public_home_cta.dart';
import 'package:framefetch/features/landing/presentation/public_home_details.dart';
import 'package:framefetch/features/landing/presentation/public_home_faq.dart';
import 'package:framefetch/features/landing/presentation/public_home_layout.dart';
import 'package:framefetch/features/landing/presentation/public_home_section_intro.dart';
import 'package:framefetch/l10n/app_localizations.dart';
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
              PublicHomeSectionIntro(title: l.publicHomeCapabilitiesTitle),
              const SizedBox(height: 48),
              PublicHomeCapabilities(
                items: [
                  (
                    title: l.publicVideoTitle,
                    description: l.publicVideoDescription,
                  ),
                  (
                    title: l.publicDocumentTitle,
                    description: l.publicDocumentDescription,
                  ),
                  (
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
              title: l.publicTrustEyebrow,
            ),
            second: PublicHomeSafeguards(
              items: [l.publicSafeguardAuthorization],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: vertical),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PublicHomeFaq(
                title: l.publicFaqEyebrow,
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
