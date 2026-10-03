import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/shared/presentation/app_dropdown_field.dart';
import 'package:framegrab/shared/presentation/app_loading.dart';
import 'package:framegrab/shared/presentation/app_refresh_indicator.dart';
import 'package:framegrab/shared/presentation/app_spinner.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../support/shad_test_app.dart';

void main() {
  testWidgets(
    'nullable selection keeps its default label and disabled options cannot select',
    (tester) async {
      var changes = 0;
      await pumpShadWidget(
        tester,
        ShadTestApp(
          home: Scaffold(
            body: AppDropdownField<String?>(
              label: '策略',
              value: null,
              onSelected: (_) => changes++,
              options: const [
                AppDropdownOption(value: null, label: '自动选择'),
                AppDropdownOption(
                  value: 'disabled',
                  label: '不可用',
                  enabled: false,
                ),
              ],
            ),
          ),
        ),
      );
      expect(find.text('自动选择'), findsOneWidget);
      await tester.tap(find.byType(ShadSelect<String?>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('不可用'));
      await tester.pumpAndSettle();
      expect(changes, 0);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets(
    'native refresh shows a compact spinner and clears on completion',
    (tester) async {
      final done = Completer<void>();
      var calls = 0;
      await pumpShadWidget(
        tester,
        ShadTestApp(
          home: Scaffold(
            body: AppRefreshIndicator(
              label: '刷新',
              onRefresh: () {
                calls++;
                return done.future;
              },
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [SizedBox(height: 1200, child: Text('列表'))],
              ),
            ),
          ),
        ),
      );
      await tester.drag(find.byType(ListView), const Offset(0, 800));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      await tester.pump();
      expect(calls, 1);
      expect(find.byType(ShadProgress), findsNothing);
      expect(find.byType(AppLoading), findsOneWidget);
      expect(find.byType(AppSpinner), findsOneWidget);
      final loading = tester.getRect(find.byType(AppLoading));
      final page = tester.getRect(find.byType(Scaffold));
      expect(loading.width, page.width);
      expect(loading.height, 20);
      expect(
        tester.getCenter(find.byType(AppSpinner)).dx,
        closeTo(page.center.dx, .01),
      );
      expect(find.byType(CircularProgressIndicator), findsNothing);
      done.complete();
      await tester.pumpAndSettle();
      expect(find.byType(AppLoading), findsNothing);
      expect(
        tester.state<ScrollableState>(find.byType(Scrollable)).position.pixels,
        0,
      );
      expect(tester.takeException(), isNull);
    },
  );
}
