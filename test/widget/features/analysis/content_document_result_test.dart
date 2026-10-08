import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/features/analysis/presentation/content_document_result_view.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

import '../../../support/shad_test_app.dart';

void main() {
  testWidgets(
    'short post stays reader content while source and review expand separately',
    (tester) async {
      final result = standardSerializers.deserializeWith(
        ContentDocumentResult.serializer,
        {
          'kind': 'content_document',
          'document_type': 'post',
          'language': 'zh-CN',
          'title': null,
          'source_set_ref': 'a' * 64,
          'review_status': 'needs_material',
          'blocks': [
            {'id': 'opening', 'type': 'paragraph', 'text': '旋紧杯盖后，短暂倒置没有看到水滴。'},
          ],
          'evidence_index': [
            {
              'block_id': 'opening',
              'material_id': 'notes',
              'segment_id': 'segment-000',
              'quote': '桌面未见水滴',
            },
          ],
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
      )!;
      expect(result.blocks.single.oneOf.value, isA<ParagraphBlock>());
      await pumpShadWidget(
        tester,
        ShadTestApp(
          locale: const Locale('zh'),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: Scaffold(
            body: SingleChildScrollView(
              child: ContentDocumentResultView(
                result: result,
                reportMarkdown: null,
                analysisId: 'task',
              ),
            ),
          ),
        ),
      );
      expect(find.text('旋紧杯盖后，短暂倒置没有看到水滴。'), findsOneWidget);
      expect(find.text('没有携带测试\n补充实际携带记录'), findsNothing);
      expect(find.textContaining('材料不足以支持'), findsOneWidget);
      await tester.tap(find.text('查看审校记录'));
      await tester.pumpAndSettle();
      expect(find.text('没有携带测试\n补充实际携带记录'), findsOneWidget);
      expect(find.text('桌面未见水滴\nnotes'), findsNothing);
      await tester.tap(find.text('查看材料引用'));
      await tester.pumpAndSettle();
      expect(find.text('桌面未见水滴\nnotes'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );
  for (final historical in [false, true]) {
    testWidgets(
      'passing prose and historical draft stay read-only: $historical',
      (tester) async {
        final result = standardSerializers.deserializeWith(
          ContentDocumentResult.serializer,
          {
            'kind': 'content_document',
            'document_type': 'post',
            'language': 'zh-CN',
            'title': null,
            'source_set_ref': 'a' * 64,
            'review_status': 'passed',
            'blocks': [
              {'id': 'opening', 'type': 'paragraph', 'text': '可直接阅读的正文。'},
            ],
            'evidence_index': <Object?>[],
            'review_history': [
              {'needs_material': false, 'findings': <Object?>[]},
            ],
          },
        )!;
        await pumpShadWidget(
          tester,
          ShadTestApp(
            locale: const Locale('zh'),
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            home: Scaffold(
              body: ContentDocumentResultView(
                result: result,
                reportMarkdown: null,
                analysisId: 'task',
                historicalEdit: historical,
              ),
            ),
          ),
        );
        expect(find.text('可直接阅读的正文。'), findsOneWidget);
        expect(find.text('查看审校记录'), findsNothing);
        expect(find.byType(TextField), findsNothing);
        expect(find.text('修改正文'), findsNothing);
        expect(
          find.textContaining('历史人工稿'),
          historical ? findsOneWidget : findsNothing,
        );
        expect(tester.takeException(), isNull);
      },
    );
  }
}
