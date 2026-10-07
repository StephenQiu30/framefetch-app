import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/core/theme/app_theme.dart';
import 'package:framefetch/features/history/application/download_retry.dart';
import 'package:framefetch/features/history/presentation/download_history_item.dart';
import 'package:framefetch/features/history/presentation/download_task_actions.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

import '../../../support/data_fakes.dart';
import '../../../support/shad_test_app.dart';

void main() {
  testWidgets('context changes require new inspection instead of retry', (
    tester,
  ) async {
    final job = downloadDetailFixture().rebuild(
      (b) => b
        ..status = DownloadStatus.failed
        ..errorCode = DownloadErrorCode.contextChanged
        ..fileAvailable = false,
    );
    final item = downloadHistoryFixture().items.first.rebuild(
      (b) => b
        ..status = DownloadStatus.failed
        ..errorCode = DownloadErrorCode.contextChanged
        ..fileAvailable = false,
    );
    var calls = 0;
    await _pumpRecovery(tester, job, item, () => calls++);
    expect(find.text('重新下载'), findsNothing);
    expect(find.byKey(Key('retry-download-${job.id}')), findsNothing);
    await tester.drag(
      find.byKey(Key('download-history-item-${item.id}')),
      const Offset(-600, 0),
    );
    await tester.pumpAndSettle();
    expect(find.byKey(Key('reparse-download-${job.id}')), findsOneWidget);
    expect(find.text('重新解析'), findsWidgets);
    expect(calls, 0);
    expect(tester.takeException(), isNull);
  });

  for (final status in [
    DownloadStatus.failed,
    DownloadStatus.cancelled,
    DownloadStatus.succeeded,
  ]) {
    testWidgets('local $status detail and list never offer remote retry', (
      tester,
    ) async {
      final job = downloadDetailFixture().rebuild(
        (b) => b
          ..status = status
          ..sourceKind = DownloadSourceKind.browserImport
          ..fileAvailable = false,
      );
      final item = downloadHistoryFixture().items.first.rebuild(
        (b) => b
          ..status = status
          ..sourceKind = DownloadSourceKind.browserImport
          ..fileAvailable = false,
      );
      var calls = 0;
      await _pumpRecovery(tester, job, item, () => calls++);
      expect(find.text('重新下载'), findsNothing);
      expect(find.byKey(Key('retry-download-${job.id}')), findsNothing);
      expect(find.text('返回首页重新导入'), findsWidgets);
      expect(calls, 0);
      expect(tester.takeException(), isNull);
    });
  }
}

Future<void> _pumpRecovery(
  WidgetTester tester,
  DownloadResponse job,
  DownloadHistoryItemResponse item,
  VoidCallback onRetry,
) async {
  await pumpShadWidget(
    tester,
    ProviderScope(
      overrides: [
        downloadRetryProvider(job.id).overrideWithValue(
          DownloadRetry(
            execute: (_) async {
              onRetry();
              return job;
            },
            sessionGeneration: () => 0,
          ),
        ),
      ],
      child: ShadTestApp(
        locale: const Locale('zh'),
        theme: AppTheme.light,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Scaffold(
          body: Column(
            children: [
              DownloadTaskActions(job: job),
              DownloadHistoryItem(item: item, onTap: () {}),
            ],
          ),
        ),
      ),
    ),
  );
  await tester.pump();
  await tester.pumpAndSettle();
}
