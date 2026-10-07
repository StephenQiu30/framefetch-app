import 'package:flutter/material.dart';
import 'package:framefetch/core/theme/app_spacing.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch/shared/presentation/app_spinner.dart';

/// One loading indicator for page requests and native pull-to-refresh.
final class AppLoading extends StatelessWidget {
  const AppLoading({this.label, this.compact = false, super.key});

  final String? label;
  final bool compact;

  @override
  Widget build(BuildContext context) => Semantics(
    container: true,
    liveRegion: true,
    label: label ?? AppLocalizations.of(context).loadingData,
    child: ExcludeSemantics(
      child: Center(
        child: Padding(
          padding: compact
              ? EdgeInsets.zero
              : const EdgeInsets.symmetric(vertical: AppSpacing.section),
          child: AppSpinner(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    ),
  );
}
