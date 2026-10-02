import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/download/application/download_intake_controller.dart';
import 'package:framegrab/features/download/presentation/inspection_workspace.dart';
import 'package:framegrab/l10n/app_localizations.dart';

import '../../../support/intake_fakes.dart';
import '../../../support/shad_test_app.dart';

void main() {
  for (final width in [390.0, 1280.0]) {
    testWidgets(
      'inspection exposes the selected server preset at width $width',
      (tester) async {
        tester.view.physicalSize = Size(width, 1000);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        final inspection = inspectionFixture().rebuild(
          (b) => b..thumbnailUrl = null,
        );
        await pumpShadWidget(
          tester,
          ProviderScope(
            child: ShadTestApp(
              locale: const Locale('zh'),
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              home: Scaffold(
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
          ),
        );
        expect(
          find.byKey(const Key('inspection-split-layout')),
          width >= 900 ? findsOneWidget : findsNothing,
        );
        expect(find.text('音频编码'), findsOneWidget);
        expect(find.text('容器'), findsOneWidget);
        await tester.ensureVisible(
          find.byKey(const Key('create-download-button')),
        );
        await tester.pump();
        expect(tester.takeException(), isNull);
      },
    );
  }
}
