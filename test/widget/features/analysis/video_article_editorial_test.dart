import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/features/analysis/presentation/video_article_result_view.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

import '../../../support/shad_test_app.dart';

void main() {
  for (final historical in [false, true]) {
    testWidgets('article body and review stay separate: $historical', (
      tester,
    ) async {
      final result = standardSerializers.deserializeWith(
        VideoArticleResultResponse.serializer,
        {
          'kind': 'video_article',
          'language': 'zh-CN',
          'title': '杯盖旋紧之后',
          'media': {
            'duration_ms': 12000,
            'container': 'mp4',
            'size_bytes': 1000,
          },
          'lead': '',
          'closing': '',
          'key_points': <String>[],
          'limitations': <String>[],
          'sections': [
            {
              'id': 'opening',
              'title': '',
              'body': '短暂倒置时，桌面没有出现水滴。',
              'evidence': <Object?>[],
            },
          ],
          if (!historical) ...{
            'review_status': 'needs_material',
            'review_history': [
              {
                'needs_material': true,
                'findings': [
                  {
                    'block_id': 'opening',
                    'severity': 'major',
                    'category': 'missing_material',
                    'problem': '没有携带测试',
                    'correction': '补充实际携带记录',
                  },
                ],
              },
            ],
          },
        },
      )!;
      await pumpShadWidget(
        tester,
        ShadTestApp(
          locale: const Locale('zh'),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: Scaffold(
            body: SingleChildScrollView(
              child: VideoArticleResultView(
                result: result,
                reportMarkdown: null,
              ),
            ),
          ),
        ),
      );
      expect(find.text('短暂倒置时，桌面没有出现水滴。'), findsOneWidget);
      expect(find.text('没有携带测试\n补充实际携带记录'), findsNothing);
      if (historical) {
        expect(find.text('查看审校记录'), findsNothing);
        expect(result.reviewStatus, isNull);
      } else {
        expect(find.textContaining('材料不足以支持'), findsOneWidget);
        await tester.tap(find.text('查看审校记录'));
        await tester.pumpAndSettle();
        expect(find.text('没有携带测试\n补充实际携带记录'), findsOneWidget);
      }
      expect(tester.takeException(), isNull);
    });
  }
}
