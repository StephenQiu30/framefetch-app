import 'package:flutter/material.dart';
import 'package:framefetch/core/theme/app_spacing.dart';
import 'package:framefetch/features/landing/presentation/public_guide_sections.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch/shared/presentation/app_navigation_bar.dart';
import 'package:framefetch/shared/presentation/app_page_intro.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:url_launcher/url_launcher.dart';

final class PublicGuideScreen extends StatelessWidget {
  const PublicGuideScreen({super.key});

  Future<void> _openExternal(BuildContext context, Uri uri) async {
    try {
      if (await launchUrl(uri, mode: LaunchMode.externalApplication)) return;
    } catch (_) {
      // Use the same localized feedback for unavailable external targets.
    }
    if (context.mounted) {
      final l10n = AppLocalizations.of(context);
      ShadSonner.of(
        context,
      ).show(ShadToast(description: Text(l10n.publicExternalLinkError)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      key: const Key('public-guide-screen'),
      appBar: const AppNavigationBar(backFallbackLocation: '/'),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.pageHorizontal,
            AppSpacing.pageTop,
            AppSpacing.pageHorizontal,
            AppSpacing.pageBottom,
          ),
          children: [
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1280),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppPageIntro(title: l10n.publicGuideTitle),
                    for (final section in publicGuideSections(l10n)) ...[
                      const SizedBox(height: AppSpacing.section),
                      Semantics(
                        header: true,
                        child: Text(
                          section.title,
                          style: theme.textTheme.headlineSmall,
                        ),
                      ),
                      for (final paragraph in section.paragraphs) ...[
                        const SizedBox(height: AppSpacing.medium),
                        Text(
                          paragraph,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                      const SizedBox(height: AppSpacing.medium),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ShadButton.link(
                          onPressed: () =>
                              _openExternal(context, section.source),
                          trailing: const Icon(
                            PhosphorIconsRegular.arrowSquareOut,
                            size: 18,
                          ),
                          child: Flexible(child: Text(section.sourceLabel)),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
