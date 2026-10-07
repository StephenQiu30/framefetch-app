import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:framefetch/core/theme/app_spacing.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch/shared/presentation/app_navigation_bar.dart';
import 'package:framefetch/shared/presentation/app_page_intro.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:url_launcher/url_launcher.dart';

enum ResourceInfo { about, selfHosting }

final class ResourceInfoScreen extends StatelessWidget {
  const ResourceInfoScreen({required this.resource, super.key});
  final ResourceInfo resource;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final about = resource == ResourceInfo.about;
    return Scaffold(
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
                    AppPageIntro(
                      title: about
                          ? l.aboutNavigation
                          : l.selfHostingNavigation,
                    ),
                    const SizedBox(height: AppSpacing.xxLarge),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 768),
                        child: MarkdownBody(
                          selectable: true,
                          data: about ? l.aboutContent : l.selfHostingContent,
                          onTapLink: (_, href, _) async {
                            final uri = Uri.tryParse(href ?? '');
                            if (uri == null ||
                                !{'https', 'http'}.contains(uri.scheme)) {
                              return;
                            }
                            try {
                              if (await launchUrl(
                                uri,
                                mode: LaunchMode.externalApplication,
                              )) {
                                return;
                              }
                            } catch (_) {
                              /* Surface localized feedback below. */
                            }
                            if (context.mounted) {
                              ShadSonner.of(context).show(
                                ShadToast(
                                  description: Text(l.publicExternalLinkError),
                                ),
                              );
                            }
                          },
                          styleSheet:
                              MarkdownStyleSheet.fromTheme(
                                Theme.of(context),
                              ).copyWith(
                                p: ShadTheme.of(context).textTheme.p,
                                h2: ShadTheme.of(context).textTheme.h4,
                                blockSpacing: AppSpacing.xLarge,
                                codeblockDecoration: BoxDecoration(
                                  color: ShadTheme.of(
                                    context,
                                  ).colorScheme.muted,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                        ),
                      ),
                    ),
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
