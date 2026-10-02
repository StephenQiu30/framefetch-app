import 'package:flutter/material.dart';
import 'package:framegrab/l10n/app_localizations.dart';

final class AppBrand extends StatelessWidget {
  const AppBrand({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final iconSize = MediaQuery.sizeOf(context).width >= 640 ? 32.0 : 28.0;
    return Row(
      children: [
        ExcludeSemantics(
          child: Image.asset(
            'assets/brand/logo.png',
            width: iconSize,
            height: iconSize,
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            localizations.appTitle,
            key: const Key('app-brand-wordmark'),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.45,
            ),
          ),
        ),
      ],
    );
  }
}
