import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/download/application/download_intent_history_controller.dart';
import 'package:framegrab/features/download/presentation/download_intent_history.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/shad_test_app.dart';

const _longTitle =
    '这是一条用于验证手机窄屏解析记录的完整中文视频标题：'
    '从城市清晨到山海日落的旅行纪实，包含摄影、访谈、幕后花絮和完整制作过程';
const _intentId = 'long-title-intent';

void main() {
  for (final width in [370.0, 320.0]) {
    for (final scale in [1.0, 2.0]) {
      testWidgets(
        'long Chinese history title fits ${width.toInt()}px at ${scale}x '
        'and resumes the original intent',
        (tester) async {
          final resumed = <String>[];
          tester.view.devicePixelRatio = 1;
          tester.view.physicalSize = Size(width, 844);
          addTearDown(tester.view.resetDevicePixelRatio);
          addTearDown(tester.view.resetPhysicalSize);

          await pumpShadWidget(
            tester,
            ShadTestApp(
              locale: const Locale('zh'),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              builder: (context, child) => MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: TextScaler.linear(scale)),
                child: child!,
              ),
              home: Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: DownloadIntentHistory(
                        busy: false,
                        onLoad: () {},
                        onMore: () {},
                        onResume: resumed.add,
                        state: DownloadIntentHistoryState(
                          loaded: true,
                          items: [
                            IntentHistoryItemResponse(
                              (builder) => builder
                                ..id = _intentId
                                ..version = 1
                                ..status = IntentStatus.ready
                                ..createdAt = DateTime.utc(2026, 10, 2)
                                ..deadline = DateTime.utc(2026, 10, 3)
                                ..title = _longTitle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );

          await tester.tap(find.text('解析记录'));
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull);

          final title = find.text(_longTitle);
          expect(title, findsOneWidget);
          final resumeButton = find.ancestor(
            of: title,
            matching: find.byType(ShadButton),
          );
          expect(resumeButton, findsOneWidget);
          await tester.ensureVisible(resumeButton);
          await tester.pumpAndSettle();

          final titleRect = tester.getRect(title);
          final buttonRect = tester.getRect(resumeButton);
          expect(titleRect.left, greaterThanOrEqualTo(buttonRect.left));
          expect(titleRect.right, lessThanOrEqualTo(buttonRect.right));
          expect(titleRect.top, greaterThanOrEqualTo(buttonRect.top));
          expect(titleRect.bottom, lessThanOrEqualTo(buttonRect.bottom));
          expect(buttonRect.left, greaterThanOrEqualTo(16));
          expect(buttonRect.right, lessThanOrEqualTo(width - 16));
          expect(tester.takeException(), isNull);
          expect(resumed, isEmpty);

          await tester.tap(title.hitTestable());
          await tester.pumpAndSettle();

          expect(resumed, [_intentId]);
          expect(find.text(_longTitle), findsOneWidget);
          expect(tester.takeException(), isNull);
        },
      );
    }
  }
}
