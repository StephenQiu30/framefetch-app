import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/features/analysis/application/analysis_state.dart';
import 'package:framefetch/features/analysis/presentation/analysis_job_state.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

import '../../../support/analysis_fakes.dart';
import '../../../support/shad_test_app.dart';

void main() {
  for (final available in [false, true]) {
    testWidgets(
      'native exports require published artifact metadata: $available',
      (tester) async {
        final job = analysisJobFixture().rebuild((b) {
          b.result = null;
          b.report.replace(
            standardSerializers.deserializeWith(
              AnalysisReportResponse.serializer,
              {
                'id': '00000000-0000-0000-0000-000000000403',
                'status': available ? 'available' : 'publishing',
                'renderer_version': 'analysis-report',
                'content_sha256': 'a' * 64,
                'artifacts': [
                  for (final format in ['html', 'zip'])
                    {
                      'format': format,
                      'media_type': 'application/octet-stream',
                      'size_bytes': 4,
                      'sha256': 'b' * 64,
                    },
                ],
              },
            )!,
          );
        });
        await pumpShadWidget(
          tester,
          ProviderScope(
            child: ShadTestApp(
              locale: const Locale('zh'),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: Scaffold(
                body: SingleChildScrollView(
                  child: AnalysisJobState(
                    action: AnalysisAction.idle,
                    isScreenplay: false,
                    job: job,
                    onCancel: () async {},
                    onDelete: () async {},
                    onRefresh: () async {},
                    onRetry: () async {},
                  ),
                ),
              ),
            ),
          ),
        );
        for (final label in ['导出公众号 HTML', '下载原生拉片包']) {
          expect(find.text(label), available ? findsOneWidget : findsNothing);
        }
        expect(tester.takeException(), isNull);
      },
    );
  }
}
