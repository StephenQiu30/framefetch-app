import 'package:flutter/material.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Future<bool> confirmAnalysisRetry(BuildContext context) async {
  final l = AppLocalizations.of(context);
  return await showShadDialog<bool>(
        context: context,
        builder: (dialogContext) => ShadDialog.alert(
          title: Text(l.analysisRetryTitle),
          description: Text(l.analysisRetryDescription),
          actions: [
            ShadButton.ghost(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              height: 0,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Flexible(child: Text(l.cancelAction)),
            ),
            ShadButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              height: 0,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Flexible(child: Text(l.confirmRetryAnalysis)),
            ),
          ],
        ),
      ) ??
      false;
}
