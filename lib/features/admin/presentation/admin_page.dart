import 'package:flutter/material.dart';
import 'package:framefetch/core/theme/app_spacing.dart';
import 'package:framefetch/shared/presentation/app_loading.dart';
import 'package:framefetch/shared/presentation/app_navigation_bar.dart';
import 'package:framefetch/shared/presentation/data_page_view.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class AdminPage extends StatelessWidget {
  const AdminPage({
    required this.children,
    this.description,
    required this.onRefresh,
    required this.refreshLabel,
    required this.title,
    this.backFallbackLocation = '/admin',
    super.key,
  });

  final String backFallbackLocation;
  final List<Widget> children;
  final String? description;
  final Future<void> Function() onRefresh;
  final String refreshLabel;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNavigationBar(backFallbackLocation: backFallbackLocation),
      body: DataPageView(
        compactTitle: true,
        title: title,
        description: description,
        refreshLabel: refreshLabel,
        onRefresh: onRefresh,
        children: children,
      ),
    );
  }
}

final class AdminSectionLink extends StatelessWidget {
  const AdminSectionLink({
    required this.icon,
    required this.onTap,
    required this.title,
    super.key,
  });

  final IconData icon;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ShadButton.ghost(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      height: 0,
      expands: true,
      mainAxisAlignment: MainAxisAlignment.start,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.large),
        child: Row(
          children: [
            Icon(icon, color: theme.colorScheme.onSurfaceVariant),
            const SizedBox(width: AppSpacing.medium),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.start,
                    style: theme.textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.small),
            const Icon(PhosphorIconsRegular.caretRight, size: 18),
          ],
        ),
      ),
    );
  }
}

List<Widget> adminLoading(String label) => [AppLoading(label: label)];

List<Widget> adminError({
  required String action,
  required String description,
  required VoidCallback retry,
  required String title,
}) => [
  DataStateMessage(
    icon: PhosphorIconsRegular.cloudSlash,
    title: title,
    description: description,
    actionLabel: action,
    onAction: retry,
  ),
];
