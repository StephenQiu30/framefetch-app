import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../support/shad_test_app.dart';

void main() {
  testWidgets('uses the global compact page inset below navigation', (
    tester,
  ) async {
    await pumpShadWidget(
      tester,
      ShadTestApp(
        home: Scaffold(
          body: DataPageView(
            title: '标题',
            refreshLabel: '刷新',
            onRefresh: () async {},
            children: const [Text('内容')],
          ),
        ),
      ),
    );
    await tester.pump();

    final list = tester.widget<ListView>(find.byType(ListView));
    expect(
      list.padding,
      const EdgeInsets.fromLTRB(
        AppSpacing.pageHorizontal,
        AppSpacing.pageTop,
        AppSpacing.pageHorizontal,
        AppSpacing.pageBottom,
      ),
    );
    expect(find.byKey(const Key('page-description')), findsNothing);
    expect(
      tester.getTopLeft(find.text('内容')).dy -
          tester.getBottomLeft(find.text('标题')).dy,
      closeTo(AppSpacing.xLarge, .01),
      reason: '无副标题时不应留下描述行或额外占位间距。',
    );
  });

  testWidgets(
    'centers metrics and recovery visuals while keeping prose left aligned',
    (tester) async {
      var retries = 0;
      const description = '网络请求未能完成，请检查网络连接后重试。已经创建的任务会保留，刷新页面后可以继续查看。';
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = const Size(390, 844);
      addTearDown(tester.view.reset);
      await pumpShadWidget(
        tester,
        ShadTestApp(
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: const TextScaler.linear(2)),
            child: child!,
          ),
          home: Scaffold(
            body: Column(
              children: [
                const DataMetricGrid(
                  keyPrefix: 'summary',
                  metrics: [
                    DataMetricValue(key: 'total', label: '全部', value: '81'),
                  ],
                ),
                DataStateMessage(
                  title: '暂时无法读取数据',
                  description: description,
                  actionLabel: '重试',
                  onAction: () => retries++,
                ),
              ],
            ),
          ),
        ),
      );

      expect(tester.widget<Text>(find.text('81')).textAlign, TextAlign.center);
      expect(tester.widget<Text>(find.text('全部')).textAlign, TextAlign.center);
      expect(
        tester.widget<Text>(find.text(description)).textAlign,
        TextAlign.start,
      );
      final stateColumn = tester.widget<Column>(
        find
            .ancestor(of: find.text('暂时无法读取数据'), matching: find.byType(Column))
            .first,
      );
      expect(stateColumn.crossAxisAlignment, CrossAxisAlignment.center);
      expect(
        tester.widget<Text>(find.text('暂时无法读取数据')).textAlign,
        TextAlign.center,
      );
      final state = find.byType(DataStateMessage);
      final stateRect = tester.getRect(state);
      final icon = find
          .descendant(of: state, matching: find.byType(Icon))
          .first;
      final action = find.descendant(
        of: state,
        matching: find.byType(ShadButton),
      );
      for (final visual in [icon, find.text('暂时无法读取数据'), action]) {
        expect(tester.getCenter(visual).dx, closeTo(stateRect.center.dx, .01));
      }
      expect(
        tester.getTopLeft(find.text(description)).dx,
        closeTo(stateRect.left, .01),
      );
      await tester.tap(find.text('重试'));
      await tester.pump();
      expect(retries, 1);
      expect(tester.takeException(), isNull);
    },
  );
}
