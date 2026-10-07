import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/features/admin/application/admin_providers.dart';
import 'package:framefetch/features/admin/application/operation_log_query.dart';
import 'package:framefetch/features/admin/presentation/admin_analytics_screen.dart';
import 'package:framefetch/features/admin/presentation/admin_operation_logs_screen.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../support/admin_fixtures.dart';
import '../../../support/shad_test_app.dart';

void main() {
  Future<void> pump(
    WidgetTester tester,
    Widget screen, {
    bool empty = false,
    bool fail = false,
    double scale = 1,
  }) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(390, 844);
    addTearDown(tester.view.reset);
    await pumpShadWidget(
      tester,
      ProviderScope(
        overrides: [
          adminAnalyticsProvider.overrideWith((ref, days) async {
            if (fail) throw StateError('synthetic');
            return adminDownloadAnalyticsFixture(empty: empty);
          }),
          adminAnalysisAnalyticsProvider.overrideWith((ref, days) async {
            if (fail) throw StateError('synthetic');
            return adminAnalysisAnalyticsFixture(
              empty: empty,
              noDuration: true,
            );
          }),
          adminOperationLogsProvider.overrideWith((ref) async {
            if (fail) throw StateError('synthetic');
            return adminOperationLogsFixture(empty: empty);
          }),
        ],
        child: ShadTestApp(
          locale: const Locale('zh'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: TextScaler.linear(scale)),
            child: child!,
          ),
          home: screen,
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  for (final scale in [1.0, 2.0]) {
    testWidgets(
      'download and AI chart data reflow at 390 width and ${scale}x text',
      (tester) async {
        await pump(tester, const AdminAnalyticsScreen(), scale: scale);
        expect(find.byKey(const Key('admin-trend-chart')), findsOneWidget);
        expect(tester.takeException(), isNull);
        await tester.tap(find.text('AI 分析'));
        await tester.pumpAndSettle();
        expect(find.text('每日分析趋势'), findsOneWidget);
        expect(tester.takeException(), isNull);
        await tester.drag(find.byType(ListView).first, const Offset(0, -600));
        await tester.pumpAndSettle();
        expect(find.text('—'), findsWidgets);
        expect(find.text('80.0%'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'operation logs display details at 390 width and ${scale}x text',
      (tester) async {
        await pump(tester, const AdminOperationLogsScreen(), scale: scale);
        final details = find
            .ancestor(
              of: find.text('操作详情').first,
              matching: find.byType(ShadButton),
            )
            .first;
        await tester.scrollUntilVisible(
          details,
          250,
          scrollable: find.byType(Scrollable).first,
        );
        await Scrollable.ensureVisible(tester.element(details), alignment: 0.5);
        await tester.pumpAndSettle();
        await tester.tap(details);
        await tester.pumpAndSettle();
        expect(find.text('admin.users.update'), findsOneWidget);
        expect(
          find.text('PATCH /api/admin/users/synthetic-account'),
          findsOneWidget,
        );
        expect(tester.takeException(), isNull);
      },
    );
  }

  testWidgets('AI and log empty results provide empty state', (tester) async {
    await pump(tester, const AdminAnalyticsScreen(), empty: true);
    await tester.tap(find.text('AI 分析'));
    await tester.pumpAndSettle();
    expect(find.text('当前周期还没有 AI 分析记录'), findsOneWidget);
    await pump(tester, const AdminOperationLogsScreen(), empty: true);
    expect(find.text('暂无操作日志'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('analytics and log failures offer retry', (tester) async {
    await pump(tester, const AdminAnalyticsScreen(), fail: true);
    expect(find.text('重新加载'), findsOneWidget);
    await pump(tester, const AdminOperationLogsScreen(), fail: true);
    expect(find.text('重新加载'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('invalid log dates suppress requests and show validation', (
    tester,
  ) async {
    await pump(tester, const AdminOperationLogsScreen());
    await tester.enterText(find.byType(ShadInput).last, '2026-02-30 10:00');
    await tester.pumpAndSettle();
    expect(find.text('结束时间不能早于开始时间，时间格式为 YYYY-MM-DD HH:mm。'), findsOneWidget);
    expect(find.byKey(const Key('admin-log-synthetic-log-1')), findsNothing);
  });
}
