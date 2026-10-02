import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/admin/presentation/admin_analytics_metrics.dart';
import 'package:framegrab/features/documents/presentation/document_detail_summary.dart';
import 'package:framegrab/l10n/app_localizations.dart';

import '../../support/data_fakes.dart';
import '../../support/shad_test_app.dart';

void main() {
  for (final width in [390.0, 1280.0]) {
    for (final scale in [1.0, 2.0]) {
      testWidgets('detail values center at $width width and ${scale}x text', (
        tester,
      ) async {
        tester.view
          ..devicePixelRatio = 1
          ..physicalSize = Size(width, 1200);
        addTearDown(tester.view.reset);
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
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: DocumentDetailSummary(
                    document: documentDetailFixture(),
                  ),
                ),
              ),
            ),
          ),
        );
        // Check real rendered centers within each metadata cell, including
        // wrapped dates and parsing counts, rather than only TextAlign flags.
        final texts = find.descendant(
          of: find.byType(DocumentDetailSummary),
          matching: find.byType(Text),
        );
        var checked = 0;
        for (final element in texts.evaluate()) {
          final text = element.widget as Text;
          if (text.textAlign != TextAlign.center) continue;
          final finder = find.byWidget(text);
          final cell = find
              .ancestor(of: finder, matching: find.byType(Column))
              .first;
          expect(
            tester.getCenter(finder).dx,
            closeTo(tester.getCenter(cell).dx, .01),
          );
          checked++;
        }
        expect(checked, 28); // Four metric pairs and ten metadata pairs.
        expect(tester.takeException(), isNull);
      });
    }
  }

  testWidgets('analytics labels and values center while explanations start', (
    tester,
  ) async {
    const description = '统计来自已保存的任务记录，长说明仍从左侧开始阅读。';
    await pumpShadWidget(
      tester,
      const ShadTestApp(
        home: Scaffold(
          body: AdminAnalyticsMetrics(metrics: [('已完成', '128', description)]),
        ),
      ),
    );
    final metrics = find.byType(AdminAnalyticsMetrics);
    final cell = find
        .descendant(of: metrics, matching: find.byType(SizedBox))
        .first;
    for (final text in ['已完成', '128']) {
      expect(
        tester.getCenter(find.text(text)).dx,
        closeTo(tester.getCenter(cell).dx, .01),
      );
    }
    expect(
      tester.widget<Text>(find.text(description)).textAlign,
      TextAlign.start,
    );
    expect(
      tester.getTopLeft(find.text(description)).dx,
      closeTo(tester.getTopLeft(cell).dx, .01),
    );
    expect(tester.takeException(), isNull);
  });
}
