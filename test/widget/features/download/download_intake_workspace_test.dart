import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/core/network/data_request_failure.dart';
import 'package:framefetch/features/download/application/download_intake_controller.dart';
import 'package:framefetch/features/download/presentation/download_intake_workspace.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

import '../../../support/intake_fakes.dart';
import '../../../support/shad_test_app.dart';

void main() {
  testWidgets('offers a read-only retry when a ready inspection GET fails', (
    tester,
  ) async {
    var retryCount = 0;
    await _pumpWorkspace(
      tester,
      DownloadIntakeState(
        intent: intentFixture(),
        error: const DataRequestFailure(DataRequestFailureKind.unavailable),
      ),
      onRetry: () => retryCount++,
    );

    expect(find.text('重新加载'), findsOneWidget);
    await tester.tap(find.text('重新加载'));
    expect(retryCount, 1);
  });

  testWidgets('explains a failed intent with its provider reason', (
    tester,
  ) async {
    await _pumpWorkspace(
      tester,
      DownloadIntakeState(
        intent: intentFixture(
          status: IntentStatus.failed,
          reasonCode: 'challenge',
        ),
      ),
    );

    expect(find.textContaining('平台要求验证'), findsOneWidget);
  });

  testWidgets(
    'shows the simplified failure class without retired session phases',
    (tester) async {
      final failure = IntentFailureResponse(
        (b) => b
          ..code = 'runtime_unavailable'
          ..failureClass = FailureClass.runtimeUnavailable
          ..layer = 'L1'
          ..stage = IntentFailureResponseStageEnum.resolve
          ..gate = IntentFailureResponseGateEnum.none
          ..evidence.replace({})
          ..summary = '解析执行环境暂不可用。',
      );
      final intent = intentFixture(
        status: IntentStatus.failed,
      ).rebuild((b) => b..failure.replace(failure));
      await _pumpWorkspace(tester, DownloadIntakeState(intent: intent));
      expect(find.textContaining('解析执行环境暂不可用'), findsOneWidget);
      expect(find.textContaining('系统正在恢复平台会话'), findsNothing);
    },
  );
}

Future<void> _pumpWorkspace(
  WidgetTester tester,
  DownloadIntakeState state, {
  VoidCallback? onRetry,
}) => pumpShadWidget(
  tester,
  ShadTestApp(
    locale: const Locale('zh'),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(
      body: SingleChildScrollView(
        child: DownloadIntakeWorkspace(
          onCancelIntent: () {},
          onCreate: () {},
          onOpenJob: (_) {},
          onRefreshIntent: () {},
          onRetryInspection: onRetry ?? () {},
          onSelectFormat: (_) {},
          onSelectItem: (_) {},
          state: state,
        ),
      ),
    ),
  ),
);
