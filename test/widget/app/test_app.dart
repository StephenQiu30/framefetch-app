import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/app/app.dart';
import 'package:framefetch/core/theme/theme_preference_store.dart';
import 'package:framefetch/features/analysis/data/analysis_repository.dart';
import 'package:framefetch/features/auth/data/native_auth_gateway.dart';
import 'package:framefetch/features/auth/data/refresh_credential_store.dart';
import 'package:framefetch/features/documents/data/document_repository.dart';
import 'package:framefetch/features/download/data/download_intake_repository.dart';
import 'package:framefetch/features/download/data/download_intent_repository.dart';
import 'package:framefetch/features/history/data/activity_history_repository.dart';
import 'package:framefetch/features/history/data/download_history_repository.dart';
import 'package:framefetch/features/providers/data/provider_status_repository.dart';
import 'package:framefetch/features/upload/data/content_upload_repository.dart';
import 'package:framefetch/features/upload/data/local_content_picker.dart';

import '../../support/analysis_fakes.dart';
import '../../support/auth_fakes.dart';
import '../../support/data_fakes.dart';
import '../../support/intake_fakes.dart';
import '../../support/theme_fakes.dart';
import '../../support/upload_fakes.dart';

Future<void> pumpFramefetchApp(
  WidgetTester tester, {
  ActivityHistoryRepository? activityHistoryRepository,
  AnalysisRepository? analysisRepository,
  NativeAuthGateway? authGateway,
  RefreshCredentialStore? credentialStore,
  DocumentRepository? documentRepository,
  DownloadIntakeRepository? downloadIntakeRepository,
  DownloadIntentRepository? downloadIntentRepository,
  DownloadHistoryRepository? downloadHistoryRepository,
  ProviderStatusRepository? providerStatusRepository,
  ThemePreferenceStore? themePreferenceStore,
  ContentUploadRepository? uploadRepository,
  LocalContentPicker? localContentPicker,
  Locale locale = const Locale('zh'),
}) async {
  final intake = downloadIntakeRepository ?? FakeDownloadIntakeRepository();
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        if (activityHistoryRepository != null)
          activityHistoryRepositoryProvider.overrideWithValue(
            activityHistoryRepository,
          ),
        analysisRepositoryProvider.overrideWithValue(
          analysisRepository ?? FakeAnalysisRepository(),
        ),
        downloadIntakeRepositoryProvider.overrideWithValue(intake),
        downloadIntentRepositoryProvider.overrideWithValue(
          downloadIntentRepository ??
              FakeDownloadIntentRepository(
                intake as FakeDownloadIntakeRepository,
              ),
        ),
        nativeAuthGatewayProvider.overrideWithValue(
          authGateway ?? FakeAuthGateway(),
        ),
        refreshCredentialStoreProvider.overrideWithValue(
          credentialStore ?? MemoryCredentialStore('refresh-test'),
        ),
        documentRepositoryProvider.overrideWithValue(
          documentRepository ?? FakeDocumentRepository(),
        ),
        downloadHistoryRepositoryProvider.overrideWithValue(
          downloadHistoryRepository ?? FakeDownloadHistoryRepository(),
        ),
        providerStatusRepositoryProvider.overrideWithValue(
          providerStatusRepository ?? FakeProviderStatusRepository(),
        ),
        themePreferenceStoreProvider.overrideWithValue(
          themePreferenceStore ?? MemoryThemePreferenceStore(),
        ),
        contentUploadRepositoryProvider.overrideWithValue(
          uploadRepository ?? FakeContentUploadRepository(),
        ),
        localContentPickerProvider.overrideWithValue(
          localContentPicker ?? FakeLocalContentPicker(),
        ),
      ],
      child: FramefetchApp(locale: locale),
    ),
  );
  await tester.pumpAndSettle();
}

Future<void> setMobileViewport(WidgetTester tester) async {
  tester.view.devicePixelRatio = 1;
  tester.view.physicalSize = const Size(390, 844);
  addTearDown(tester.view.reset);
}

void setAccessibilityTextScale(WidgetTester tester) {
  tester.platformDispatcher.textScaleFactorTestValue = 2;
  addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
}
