import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/theme/app_theme.dart';
import 'package:framegrab/features/admin/application/admin_providers.dart';
import 'package:framegrab/features/admin/application/operation_log_query.dart';
import 'package:framegrab/features/admin/presentation/admin_analytics_screen.dart';
import 'package:framegrab/features/admin/presentation/admin_operation_logs_screen.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../test/support/admin_fixtures.dart';
import '../test/support/shad_test_app.dart';

// Native rendering and interaction only. Synthetic fixtures do not validate
// provider execution, authentication, admin mutations, or business data.
void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  Future<void> pump(
    WidgetTester tester,
    Widget screen, {
    bool empty = false,
    bool fail = false,
    bool dark = false,
    double scale = 1,
  }) async {
    await pumpShadWidget(
      tester,
      ProviderScope(
        key: UniqueKey(),
        overrides: [
          adminAnalyticsProvider.overrideWith((ref, days) async {
            if (fail) throw StateError('synthetic');
            return adminDownloadAnalyticsFixture(empty: empty);
          }),
          adminAnalysisAnalyticsProvider.overrideWith((ref, days) async {
            if (fail) throw StateError('synthetic');
            return adminAnalysisAnalyticsFixture(empty: empty);
          }),
          adminOperationLogsProvider.overrideWith((ref) async {
            if (fail) throw StateError('synthetic');
            return adminOperationLogsFixture(empty: empty);
          }),
        ],
        child: ShadTestApp(
          theme: dark ? AppTheme.dark : AppTheme.light,
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

  Future<void> capture(WidgetTester tester, String name) async {
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    await binding.takeScreenshot(name);
  }

  testWidgets(
    'native admin analytics and operation logs across themes and text sizes',
    (tester) async {
      await pump(tester, const AdminAnalyticsScreen());
      await capture(tester, 'admin-download-analytics-light');
      await tester.tap(find.text('AI 分析'));
      await tester.pumpAndSettle();
      await capture(tester, 'admin-ai-analytics-light');
      await tester.drag(find.byType(ListView).first, const Offset(0, -520));
      await capture(tester, 'admin-ai-analytics-metrics');
      await pump(tester, const AdminAnalyticsScreen(), dark: true);
      await tester.tap(find.text('AI 分析'));
      await capture(tester, 'admin-ai-analytics-dark');
      await pump(tester, const AdminAnalyticsScreen(), scale: 2);
      await tester.tap(find.text('AI 分析'));
      await capture(tester, 'admin-ai-analytics-text-2x');
      await pump(tester, const AdminOperationLogsScreen());
      await capture(tester, 'admin-operation-logs-light');
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
      await capture(tester, 'admin-operation-log-detail');
      await pump(
        tester,
        const AdminOperationLogsScreen(),
        dark: true,
        scale: 2,
      );
      await capture(tester, 'admin-operation-logs-dark-text-2x');
      await pump(tester, const AdminAnalyticsScreen(), empty: true);
      await tester.tap(find.text('AI 分析'));
      await capture(tester, 'admin-ai-analytics-empty');
      await pump(tester, const AdminOperationLogsScreen(), fail: true);
      await tester.drag(find.byType(ListView).first, const Offset(0, -500));
      await capture(tester, 'admin-operation-logs-failure');
    },
  );
}
