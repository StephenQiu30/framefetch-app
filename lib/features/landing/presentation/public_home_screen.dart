import 'package:flutter/material.dart';
import 'package:framegrab/features/landing/domain/public_home_links.dart';
import 'package:framegrab/features/landing/presentation/public_home_content_sections.dart';
import 'package:framegrab/features/landing/presentation/public_home_hero.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_navigation_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:url_launcher/url_launcher.dart';

final class PublicHomeScreen extends StatelessWidget {
  const PublicHomeScreen({super.key});

  Future<void> _openExternal(
    BuildContext context,
    Uri uri,
    String errorMessage,
  ) async {
    try {
      final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (opened) return;
    } catch (_) {
      // Rejected and unavailable links share the localized failure feedback.
    }
    if (context.mounted) {
      ShadSonner.of(context).show(ShadToast(description: Text(errorMessage)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final width = MediaQuery.sizeOf(context).width;
    final horizontal = width >= 1024 ? 32.0 : (width >= 640 ? 24.0 : 16.0);
    final heroTop = width >= 1024 ? 56.0 : (width >= 640 ? 48.0 : 40.0);
    return Scaffold(
      key: const Key('public-home-screen'),
      appBar: AppNavigationBar(
        actions: [
          ShadButton.ghost(
            key: const Key('public-home-login'),
            onPressed: () => context.push('/auth/login'),
            height: 0,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Flexible(child: Text(l10n.loginAction)),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Center(
                child: ConstrainedBox(
                  key: const Key('public-home-content-shell'),
                  constraints: const BoxConstraints(maxWidth: 1280),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontal),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: heroTop,
                            bottom: width >= 1024 ? 64 : 48,
                          ),
                          child: PublicHomeHero(
                            onOpenSource: () => _openExternal(
                              context,
                              PublicHomeLinks.repository,
                              l10n.publicExternalLinkError,
                            ),
                          ),
                        ),
                        PublicHomeContentSections(
                          onOpenDeployment: () => _openExternal(
                            context,
                            PublicHomeLinks.quickStart,
                            l10n.publicExternalLinkError,
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
