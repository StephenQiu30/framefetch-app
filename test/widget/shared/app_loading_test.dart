import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/theme/app_theme.dart';
import 'package:framegrab/shared/presentation/app_loading.dart';
import 'package:framegrab/shared/presentation/app_spinner.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../support/shad_test_app.dart';

void main() {
  for (final dark in [false, true]) {
    for (final scale in [1.0, 2.0]) {
      testWidgets(
        'loading centers in ${dark ? 'dark' : 'light'} at ${scale}x',
        (tester) async {
          tester.view
            ..devicePixelRatio = 1
            ..physicalSize = const Size(390, 844);
          addTearDown(tester.view.reset);
          final semantics = tester.ensureSemantics();
          await pumpShadWidget(
            tester,
            ShadTestApp(
              theme: dark ? AppTheme.dark : AppTheme.light,
              builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: TextScaler.linear(scale),
                  disableAnimations: true,
                ),
                child: child!,
              ),
              home: const Scaffold(body: AppLoading(label: '加载中')),
            ),
          );
          await tester.pumpAndSettle();
          expect(
            tester.getCenter(find.byType(AppSpinner)),
            const Offset(195, 422),
          );
          expect(tester.getSize(find.byType(AppSpinner)), const Size(20, 20));
          expect(find.byType(ShadProgress), findsNothing);
          expect(find.text('加载中'), findsNothing);
          expect(
            tester
                .getSemantics(find.byType(AppLoading))
                .getSemanticsData()
                .label,
            '加载中',
          );
          semantics.dispose();
          expect(tester.takeException(), isNull);
        },
      );
    }
  }
}
