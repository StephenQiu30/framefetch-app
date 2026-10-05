import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/analysis/presentation/analysis_report_preview.dart';
import 'package:framegrab/features/analysis/presentation/structured_report_result_view.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/shad_test_app.dart';

void main() {
  for (final canonical in [null, '\n# 服务端原文\n\n末行  \n']) {
    testWidgets(
      'document report uses existing reader and actual body: $canonical',
      (tester) async {
        final result = standardSerializers.deserializeWith(
          StructuredReportResultResponse.serializer,
          {
            'kind': 'structured_report',
            'language': 'zh-CN',
            'title': '普通文章',
            'summary': '格式整理',
            'sections': [
              {
                'id': 'article',
                'heading': '正文',
                'body': '# 原有标题\n\n真实正文  \n',
                'items': <String>[],
                'evidence': <Object>[],
                'citations': [
                  {
                    'source_sha256': List.filled(64, 'a').join(),
                    'start': 0,
                    'end': 4,
                    'quote': '原有标题',
                  },
                ],
              },
            ],
            'limitations': <String>[],
            'media': null,
          },
        )!;
        expect(result.media, isNull);
        final wire =
            standardSerializers.serializeWith(
                  StructuredReportResultResponse.serializer,
                  result,
                )!
                as Map<String, Object?>;
        final sections = (wire['sections'] as List<Object?>)
            .cast<Map<String, Object?>>();
        final citations = (sections.single['citations'] as List<Object?>)
            .cast<Map<String, Object?>>();
        expect(citations.single['quote'], '原有标题');
        await pumpShadWidget(
          tester,
          ShadTestApp(
            locale: const Locale('zh'),
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            home: Scaffold(
              body: StructuredReportResultView(
                result: result,
                analysisId: 'owned-report',
                reportMarkdown: canonical,
              ),
            ),
          ),
        );
        final launcher = tester.widget<AnalysisReportLauncher>(
          find.byType(AnalysisReportLauncher),
        );
        expect(launcher.markdown, canonical ?? '# 原有标题\n\n真实正文  \n');
        expect(launcher.analysisId, 'owned-report');
        expect(
          find.byKey(const Key('structured-report-duration')),
          findsNothing,
        );
        expect(find.text('00:00'), findsNothing);
        expect(tester.takeException(), isNull);
      },
    );
  }
}
