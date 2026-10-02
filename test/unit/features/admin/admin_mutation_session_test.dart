import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/admin/application/admin_mutation_controller.dart';
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
    'old deletion completion cannot reset the new administrator operation',
    () async {
      final subscription = container.listen(
        adminUserMutationProvider,
        (_, _) {},
      );
      addTearDown(subscription.close);
      final controller = container.read(adminUserMutationProvider.notifier);
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
      final oldRequest = controller.run(
        () => container.read(adminRepositoryProvider).deleteUser('old-target'),
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
      expect(container.read(adminUserMutationProvider), isFalse);
      final nextPending = Completer<void>();
      final nextRequest = controller.run(() => nextPending.future);
      expect(container.read(adminUserMutationProvider), isTrue);
      release.complete();
      expect(await oldRequest, AdminMutationResult.stale);
      expect(sent.map((request) => request.path), [
        '/api/admin/users/old-target',
      ]);
      expect(sent.single.headers['Authorization'], 'Bearer access-admin-a');
      expect(container.read(adminUserMutationProvider), isTrue);
      nextPending.complete();
      expect(await nextRequest, AdminMutationResult.succeeded);
      expect(container.read(adminUserMutationProvider), isFalse);
    },
  );

  test(
    'a disposed single operation returns stale without touching new state',
    () async {
      final subscription = container.listen(
        adminCatalogMutationProvider,
        (_, _) {},
      );
      final controller = container.read(adminCatalogMutationProvider.notifier);
      final release = Completer<void>();
      final request = controller.run(() => release.future);
      subscription.close();
      await container.pump();
      release.complete();
      expect(await request, AdminMutationResult.stale);
      final next = container.listen(adminCatalogMutationProvider, (_, _) {});
      addTearDown(next.close);
      expect(container.read(adminCatalogMutationProvider), isFalse);
    },
  );

  test(
    'a role change invalidates the old operation even if admin is restored',
    () async {
      final subscription = container.listen(adminAiMutationProvider, (_, _) {});
      addTearDown(subscription.close);
      final controller = container.read(adminAiMutationProvider.notifier);
      final release = Completer<void>();
      final request = controller.run(() => release.future);
      final session = container.read(authSessionProvider.notifier);
      final user = container.read(authSessionProvider).user!;
      session.acceptUpdatedProfile(
        user.rebuild((b) => b.role = UserRole.user),
        session.sessionGeneration,
      );
      session.acceptUpdatedProfile(user, session.sessionGeneration);
      final nextPending = Completer<void>();
      final nextRequest = controller.run(() => nextPending.future);
      release.complete();
      expect(await request, AdminMutationResult.stale);
      expect(container.read(adminAiMutationProvider), isTrue);
      nextPending.complete();
      expect(await nextRequest, AdminMutationResult.succeeded);
    },
  );
}
