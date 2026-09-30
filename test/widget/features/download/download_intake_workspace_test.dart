import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/download/application/download_intake_controller.dart';
import 'package:framegrab/features/download/presentation/download_intake_workspace.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:video_server_api/video_server_api.dart';

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
          reasonCode: 'provider_verification_failed',
        ),
      ),
    );

    expect(find.textContaining('平台要求当前系统无法自动完成的验证'), findsOneWidget);
  });

  testWidgets(
    'shows the actual token cause and media phase instead of a login instruction',
    (tester) async {
      final failure = IntentFailureResponse(
        (b) => b
          ..code = 'pot_provider_unavailable'
          ..phase = FailurePhase.prepareContext
          ..scope = FailureScope.dependency
          ..failureClass = FailureClass.tokenUnavailable
          ..evidenceKind = FailureEvidenceKind.runtime
          ..observedAt = DateTime.utc(2026, 9, 30),
      );
      final intent =
          intentFixture(
            status: IntentStatus.failed,
            reasonCode: 'provider_auth_required',
          ).rebuild(
            (b) => b
              ..phase = FailurePhase.prepareContext
              ..failure.replace(failure),
          );
      await _pumpWorkspace(tester, DownloadIntakeState(intent: intent));
      expect(find.textContaining('平台访问令牌尚不可用'), findsOneWidget);
      expect(find.textContaining('准备解析环境'), findsOneWidget);
      expect(find.textContaining('去登录'), findsNothing);
    },
  );

  testWidgets(
    'observes automatic source recovery and offers cancellation without manual login',
    (tester) async {
      final failure = IntentFailureResponse(
        (b) => b
          ..code = 'provider_session_not_ready'
          ..phase = FailurePhase.prepareContext
          ..scope = FailureScope.session
          ..failureClass = FailureClass.runtimeUnavailable
          ..evidenceKind = FailureEvidenceKind.runtime
          ..observedAt = DateTime.utc(2026, 9, 30),
      );
      final intent = intentFixture(status: IntentStatus.retryWait).rebuild(
        (b) => b
          ..phase = FailurePhase.prepareContext
          ..failure.replace(failure),
      );
      await _pumpWorkspace(tester, DownloadIntakeState(intent: intent));
      expect(find.textContaining('系统正在恢复平台会话'), findsOneWidget);
      expect(find.text('取消解析'), findsOneWidget);
      expect(find.textContaining('已处理'), findsNothing);
      expect(find.textContaining('平台登录'), findsNothing);
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
