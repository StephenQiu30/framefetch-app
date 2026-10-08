import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/features/analysis/data/analysis_repository.dart';
import 'package:framefetch/features/analysis/presentation/analysis_configurator.dart';
import 'package:framefetch/features/analysis/presentation/analysis_panel.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

import '../../../support/analysis_fakes.dart';
import '../../../support/shad_test_app.dart';

void main() {
  testWidgets(
    'new task loads current methods without deleting the old report',
    (tester) async {
      final repository = FakeAnalysisRepository(
        latest: analysisJobFixture(status: AnalysisStatus.succeeded),
        skills: [
          AnalysisSkillResponse(
            (b) => b
              ..id = 'video-to-article'
              ..displayName = '视频写作'
              ..description = '选择读者问题写成文章'
              ..defaultPrompt = '按材料自然展开'
              ..inputKinds.replace([AnalysisInputKind.video])
              ..resultContract = AnalysisResultContract.videoArticle,
          ),
        ],
      );
      await pumpShadWidget(
        tester,
        ProviderScope(
          overrides: [analysisRepositoryProvider.overrideWithValue(repository)],
          child: ShadTestApp(
            locale: const Locale('zh'),
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            home: Scaffold(
              body: SingleChildScrollView(
                child: AnalysisPanel(downloadId: 'download-1'),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(AnalysisConfigurator), findsNothing);
      expect(find.text('舞台表演视觉分析'), findsOneWidget);
      await tester.tap(find.text('新建创作任务'));
      await tester.pumpAndSettle();
      expect(find.byType(AnalysisConfigurator), findsOneWidget);
      expect(find.text('视频写作'), findsOneWidget);
      expect(find.text('舞台表演视觉分析'), findsOneWidget);
      expect(repository.deleteCalls, 0);
      expect(repository.retryKeys, isEmpty);
      expect(tester.takeException(), isNull);
    },
  );
}
