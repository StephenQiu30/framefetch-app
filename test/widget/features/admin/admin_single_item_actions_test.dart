import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/admin/application/admin_providers.dart';
import 'package:framegrab/features/admin/presentation/admin_ai_providers_screen.dart';
import 'package:framegrab/features/admin/presentation/admin_providers_screen.dart';
import 'package:framegrab/features/admin/presentation/admin_storage_screen.dart';
import 'package:framegrab/features/admin/presentation/admin_users_screen.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:framegrab/features/auth/data/refresh_credential_store.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/auth_fakes.dart';
import '../../../support/shad_test_app.dart';
import 'admin_single_item_fixtures.dart';

void main() {
  final cases = [
    (
      screen: const AdminUsersScreen(),
      rowKey: 'admin-user-synthetic-user',
      path: '/api/admin/users/synthetic-user',
    ),
    (
      screen: const AdminStorageScreen(),
      rowKey: 'admin-file-video:synthetic-file',
      path: '/api/admin/files/video/synthetic-file',
    ),
    (
      screen: const AdminProvidersScreen(),
      rowKey: 'catalog-synthetic-catalog',
      path: '/api/admin/providers/synthetic-catalog',
    ),
    (
      screen: const AdminAiProvidersScreen(),
      rowKey: 'ai-synthetic-ai',
      path: '/api/admin/ai-providers/synthetic-ai',
    ),
  ];
  for (final item in cases) {
    testWidgets('${item.rowKey} offers only confirmed single deletion', (
      tester,
    ) async {
      final client = VideoServerApi();
      addTearDown(client.dio.close);
      final sent = <RequestOptions>[];
      client.dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (request, handler) {
            sent.add(request);
            handler.resolve(Response(requestOptions: request, statusCode: 204));
          },
        ),
      );
      final container = ProviderContainer(
        overrides: [
          videoServerApiProvider.overrideWithValue(client),
          nativeAuthGatewayProvider.overrideWithValue(
            FakeAuthGateway(session: testSession(role: UserRole.admin)),
          ),
          refreshCredentialStoreProvider.overrideWithValue(
            MemoryCredentialStore('synthetic-refresh'),
          ),
          adminUsersProvider.overrideWith(
            (ref) async => adminSingleUserFixture(),
          ),
          adminFilesProvider.overrideWith(
            (ref) async => adminSingleFileFixture(),
          ),
          adminProviderCatalogProvider.overrideWith(
            (ref) async => adminSingleCatalogFixture(),
          ),
          adminAiProvidersProvider.overrideWith(
            (ref) async => adminSingleAiFixture(),
          ),
        ],
      );
      addTearDown(container.dispose);
      await container.read(authSessionProvider.notifier).restore();
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = const Size(390, 844);
      addTearDown(tester.view.reset);
      await pumpShadWidget(
        tester,
        UncontrolledProviderScope(
          container: container,
          child: ShadTestApp(
            locale: const Locale('zh'),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: item.screen,
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(ShadCheckbox), findsNothing);
      expect(find.text('全选'), findsNothing);
      expect(find.textContaining('删除选中'), findsNothing);
      expect(find.text('清理文件'), findsNothing);

      final delete = find.ancestor(
        of: find.descendant(
          of: find.byKey(ValueKey(item.rowKey)),
          matching: find.text('删除'),
        ),
        matching: find.byType(ShadButton),
      );
      await tester.scrollUntilVisible(
        delete,
        250,
        scrollable: find.byType(Scrollable).first,
      );
      await Scrollable.ensureVisible(tester.element(delete), alignment: 0.5);
      await tester.pumpAndSettle();
      await tester.tap(delete);
      await tester.pumpAndSettle();
      expect(sent, isEmpty);
      await tester.tap(find.text('取消'));
      await tester.pumpAndSettle();
      expect(sent, isEmpty);

      await tester.tap(delete);
      await tester.pumpAndSettle();
      final confirm = find.ancestor(
        of: find.descendant(
          of: find.byType(ShadDialog),
          matching: find.text('删除'),
        ),
        matching: find.byType(ShadButton),
      );
      await tester.tap(confirm);
      await tester.pumpAndSettle();
      expect(sent.map((request) => request.method), ['DELETE']);
      expect(sent.map((request) => request.path), [item.path]);
      expect(find.byType(ShadCheckbox), findsNothing);
      expect(tester.takeException(), isNull);
    });
  }
}
