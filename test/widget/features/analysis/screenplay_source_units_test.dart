import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/features/analysis/presentation/screenplay_analysis_result_view.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch/shared/presentation/app_dropdown_field.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

import '../../../support/analysis_fakes.dart';
import '../../../support/shad_test_app.dart';

void main() {
  for (final sourceId in ['unit-1', 'scene-1']) {
    testWidgets('coverage labels reflect source type: $sourceId', (
      tester,
    ) async {
      final original =
          screenplayAnalysisJobFixture().result!.oneOf.value
              as ScreenplayAnalysisResultResponse;
      final result = original.rebuild(
        (b) => b.scenes.replace([
          original.scenes.single.rebuild((s) => s.sourceSceneId = sourceId),
        ]),
      );
      await pumpShadWidget(
        tester,
        ShadTestApp(
          locale: const Locale('zh'),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: Scaffold(
            body: SingleChildScrollView(
              child: ScreenplayAnalysisResultView(
                reportMarkdown: null,
                result: result,
              ),
            ),
          ),
        ),
      );
      final field = tester.widget<AppDropdownField<String>>(
        find.byKey(const Key('screenplay-result-section')),
      );
      expect(
        field.options.singleWhere((o) => o.value == 'scenes').label,
        sourceId.startsWith('unit-') ? '文本单元' : '场景',
      );
      expect(
        find.text(sourceId.startsWith('unit-') ? '文本单元' : '逐场景覆盖'),
        findsWidgets,
      );
      expect(tester.takeException(), isNull);
    });
  }
}
