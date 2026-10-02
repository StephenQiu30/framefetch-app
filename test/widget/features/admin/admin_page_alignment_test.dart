import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/admin/presentation/admin_page.dart';
import 'package:phosphor_icons/phosphor_icons.dart';

import '../../../support/shad_test_app.dart';

void main() {
  testWidgets('management entry multiline text renders from the leading edge', (
    tester,
  ) async {
    const title = '查看服务端的系统操作日志与任务结果';
    const description = '读取当前管理员可见的接口请求和系统任务，按时间与结果筛选。';
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(320, 844);
    addTearDown(tester.view.reset);
    var taps = 0;
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
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: AdminSectionLink(
              title: title,
              description: description,
              icon: PhosphorIconsRegular.list,
              onTap: () => taps++,
            ),
          ),
        ),
      ),
    );
    for (final value in [title, description]) {
      final paragraph = tester.renderObject<RenderParagraph>(find.text(value));
      expect(paragraph.textAlign, TextAlign.start);
    }
    expect(tester.takeException(), isNull);
    await tester.tap(find.text(title));
    await tester.pump();
    expect(taps, 1);
    expect(tester.takeException(), isNull);
  });
}
