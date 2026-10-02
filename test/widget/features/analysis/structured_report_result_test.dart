import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/analysis/presentation/analysis_result_view.dart';
import 'package:framegrab/l10n/app_localizations.dart';

import '../../../support/shad_test_app.dart';
import '../../../support/workspace_parity_fixtures.dart';

void main() {
  testWidgets(
    'structured report union renders chapters, timecoded evidence and limitations',
    (tester) async {
      await pumpShadWidget(
        tester,
        ShadTestApp(
          locale: const Locale('zh'),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: Scaffold(
            body: SingleChildScrollView(
              child: AnalysisResultView(job: structuredReportFixture()),
            ),
          ),
        ),
      );
      expect(find.byKey(const Key('structured-report-result')), findsOneWidget);
      expect(find.text('开场判断'), findsOneWidget);
      expect(find.textContaining('人物目标首次显现'), findsOneWidget);
      expect(find.textContaining('片外信息需另行核验'), findsOneWidget);
      expect(find.text('分析结果格式不受支持'), findsNothing);
      expect(tester.takeException(), isNull);
    },
  );
}
