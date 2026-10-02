import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/admin/application/admin_selection_controller.dart';
import 'package:framegrab/features/admin/data/admin_repository.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:framegrab/features/auth/data/refresh_credential_store.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/auth_fakes.dart';

void main() {
  late VideoServerApi client;
  late FakeAuthGateway gateway;
  late ProviderContainer container;
  setUp(() async {
    client = VideoServerApi();
    gateway = FakeAuthGateway(
      session: testSession(role: UserRole.admin, suffix: 'admin-a'),
    );
    container = ProviderContainer(
      overrides: [
        videoServerApiProvider.overrideWithValue(client),
        nativeAuthGatewayProvider.overrideWithValue(gateway),
        refreshCredentialStoreProvider.overrideWithValue(
          MemoryCredentialStore('synthetic-refresh'),
        ),
      ],
    );
    await container.read(authSessionProvider.notifier).restore();
  });
  tearDown(() {
    container.dispose();
    client.dio.close();
  });

  test(
    'a batch cannot continue with a new administrator or overwrite its selection',
    () async {
      final subscription = container.listen(
        adminUserSelectionProvider,
        (_, _) {},
      );
      addTearDown(subscription.close);
      final controller = container.read(adminUserSelectionProvider.notifier);
      controller.selectPage(['old-target-one', 'old-target-two'], true);
      final entered = Completer<void>();
      final release = Completer<void>();
      final sent = <RequestOptions>[];
      client.dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            sent.add(options);
            if (!entered.isCompleted) entered.complete();
            await release.future;
            handler.resolve(Response(requestOptions: options, statusCode: 204));
          },
        ),
      );
      final batch = controller.deleteSelected(
        container.read(adminRepositoryProvider).deleteUser,
      );
      await entered.future;
      final session = container.read(authSessionProvider.notifier);
      await session.logout();
      gateway.session = testSession(
        role: UserRole.admin,
        suffix: 'admin-b',
        userId: '00000000-0000-0000-0000-000000000002',
      );
      await session.login(
        email: 'new-admin@example.com',
        password: 'synthetic',
      );
      expect(container.read(adminUserSelectionProvider).selected, isEmpty);
      expect(container.read(adminUserSelectionProvider).busy, isFalse);
      container
          .read(adminUserSelectionProvider.notifier)
          .toggle('new-target', true);
      release.complete();
      expect(await batch, isFalse);
      expect(sent.map((request) => request.path), [
        '/api/admin/users/old-target-one',
      ]);
      expect(sent.single.headers['Authorization'], 'Bearer access-admin-a');
      final current = container.read(adminUserSelectionProvider);
      expect(current.selected, {'new-target'});
      expect(current.busy, isFalse);
      expect(current.hasFailure, isFalse);
    },
  );

  test(
    'disposing the selection provider stops after its pending request',
    () async {
      final subscription = container.listen(
        adminCatalogSelectionProvider,
        (_, _) {},
      );
      final controller = container.read(adminCatalogSelectionProvider.notifier);
      controller.selectPage(['one', 'two'], true);
      final entered = Completer<void>();
      final release = Completer<void>();
      final called = <String>[];
      final batch = controller.deleteSelected((id) async {
        called.add(id);
        if (!entered.isCompleted) entered.complete();
        await release.future;
      });
      await entered.future;
      subscription.close();
      await container.pump();
      release.complete();
      expect(await batch, isFalse);
      expect(called, ['one']);
      final next = container.listen(adminCatalogSelectionProvider, (_, _) {});
      addTearDown(next.close);
      expect(container.read(adminCatalogSelectionProvider).selected, isEmpty);
      expect(container.read(adminCatalogSelectionProvider).busy, isFalse);
    },
  );

  test('session changes clear all four kinds of admin selection', () async {
    final providers = [
      adminUserSelectionProvider,
      adminFileSelectionProvider,
      adminCatalogSelectionProvider,
      adminAiSelectionProvider,
    ];
    for (final provider in providers) {
      final subscription = container.listen(provider, (_, _) {});
      addTearDown(subscription.close);
      container.read(provider.notifier).toggle('old-target', true);
    }
    await container.read(authSessionProvider.notifier).logout();
    for (final provider in providers) {
      expect(container.read(provider).selected, isEmpty);
      expect(container.read(provider).busy, isFalse);
    }
  });

  test(
    'a permission change invalidates the old batch even if admin is restored',
    () async {
      final subscription = container.listen(
        adminAiSelectionProvider,
        (_, _) {},
      );
      addTearDown(subscription.close);
      final controller = container.read(adminAiSelectionProvider.notifier);
      controller.selectPage(['one', 'two'], true);
      final release = Completer<void>();
      final called = <String>[];
      final batch = controller.deleteSelected((id) async {
        called.add(id);
        await release.future;
      });
      final session = container.read(authSessionProvider.notifier);
      final user = container.read(authSessionProvider).user!;
      session.acceptUpdatedProfile(
        user.rebuild((b) => b.role = UserRole.user),
        session.sessionGeneration,
      );
      session.acceptUpdatedProfile(user, session.sessionGeneration);
      expect(container.read(adminAiSelectionProvider).selected, isEmpty);
      controller.toggle('new-target', true);
      release.complete();
      expect(await batch, isFalse);
      expect(called, ['one']);
      expect(container.read(adminAiSelectionProvider).selected, {'new-target'});
      expect(container.read(adminAiSelectionProvider).hasFailure, isFalse);
    },
  );
}
