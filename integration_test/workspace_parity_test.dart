import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/analysis/data/analysis_repository.dart';
import 'package:framegrab/features/analysis/presentation/analysis_result_view.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:framegrab/features/auth/data/refresh_credential_store.dart';
import 'package:framegrab/features/download/application/download_intake_controller.dart';
import 'package:framegrab/features/download/presentation/inspection_workspace.dart';
import 'package:framegrab/features/history/data/activity_history_repository.dart';
import 'package:framegrab/features/history/presentation/activity_history_screen.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:integration_test/integration_test.dart';

import '../test/support/analysis_fakes.dart';
import '../test/support/auth_fakes.dart';
import '../test/support/intake_fakes.dart';
import '../test/support/shad_test_app.dart';
import '../test/support/workspace_parity_fixtures.dart';

// Native UI snapshots with synthetic data; no Provider or AI execution runs.
void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Widget app(Widget home) => ProviderScope(
    overrides: [
      nativeAuthGatewayProvider.overrideWithValue(FakeAuthGateway()),
      refreshCredentialStoreProvider.overrideWithValue(MemoryCredentialStore()),
      analysisRepositoryProvider.overrideWithValue(FakeAnalysisRepository()),
      activityHistoryRepositoryProvider.overrideWithValue(
        FakeActivityHistoryRepository(),
      ),
    ],
    child: ShadTestApp(
      locale: const Locale('zh'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: home,
    ),
  );

  testWidgets(
    'inspection, history and structured report match native workspace states',
    (tester) async {
      final inspection = inspectionFixture().rebuild(
        (b) => b..thumbnailUrl = null,
      );
      await pumpShadWidget(
        tester,
        app(
          Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: InspectionWorkspace(
                  state: DownloadIntakeState(
                    inspection: inspection,
                    selectedFormatId: inspection.formats.first.id,
                  ),
                  onCreate: () {},
                  onSelectFormat: (_) {},
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      await binding.takeScreenshot('workspace-inspection-mobile');
      await tester.ensureVisible(
        find.byKey(const Key('create-download-button')),
      );
      await tester.pumpAndSettle();
      await binding.takeScreenshot('workspace-inspection-selection');
      await pumpShadWidget(tester, app(const ActivityHistoryScreen()));
      await tester.pumpAndSettle();
      await tester.ensureVisible(
        find.byKey(Key('activity-record-${parseHistoryFixture().id}')),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      await binding.takeScreenshot('workspace-unified-history');
      await pumpShadWidget(
        tester,
        app(
          Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: AnalysisResultView(job: structuredReportFixture()),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      await binding.takeScreenshot('workspace-structured-report');
    },
  );
}
