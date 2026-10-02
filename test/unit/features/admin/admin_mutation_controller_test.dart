import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/admin/application/admin_mutation_controller.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:framegrab/features/auth/data/refresh_credential_store.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/auth_fakes.dart';

void main() {
  test('one pending operation prevents a duplicate submission', () async {
    final container = await _container(UserRole.admin);
    addTearDown(container.dispose);
    final subscription = container.listen(adminFileMutationProvider, (_, _) {});
    addTearDown(subscription.close);
    final controller = container.read(adminFileMutationProvider.notifier);
    final pending = Completer<void>();
    var calls = 0;
    final request = controller.run(() {
      calls++;
      return pending.future;
    });
    expect(container.read(adminFileMutationProvider), isTrue);
    expect(
      await controller.run(() async {
        calls++;
      }),
      AdminMutationResult.stale,
    );
    expect(calls, 1);
    pending.complete();
    expect(await request, AdminMutationResult.succeeded);
    expect(container.read(adminFileMutationProvider), isFalse);
  });

  test('a failed single operation can be retried explicitly', () async {
    final container = await _container(UserRole.admin);
    addTearDown(container.dispose);
    final subscription = container.listen(adminAiMutationProvider, (_, _) {});
    addTearDown(subscription.close);
    final controller = container.read(adminAiMutationProvider.notifier);
    expect(
      await controller.run(() async {
        throw StateError('synthetic failure');
      }),
      AdminMutationResult.failed,
    );
    expect(container.read(adminAiMutationProvider), isFalse);
    var calls = 0;
    expect(
      await controller.run(() async {
        calls++;
      }),
      AdminMutationResult.succeeded,
    );
    expect(calls, 1);
  });

  test('an ordinary user cannot start any admin mutation', () async {
    final container = await _container(UserRole.user);
    addTearDown(container.dispose);
    var calls = 0;
    for (final provider in [
      adminUserMutationProvider,
      adminFileMutationProvider,
      adminCatalogMutationProvider,
      adminAiMutationProvider,
    ]) {
      final subscription = container.listen(provider, (_, _) {});
      addTearDown(subscription.close);
      expect(
        await container.read(provider.notifier).run(() async {
          calls++;
        }),
        AdminMutationResult.stale,
      );
      expect(container.read(provider), isFalse);
    }
    expect(calls, 0);
  });
}

Future<ProviderContainer> _container(UserRole role) async {
  final container = ProviderContainer(
    overrides: [
      nativeAuthGatewayProvider.overrideWithValue(
        FakeAuthGateway(session: testSession(role: role)),
      ),
      refreshCredentialStoreProvider.overrideWithValue(
        MemoryCredentialStore('synthetic-refresh'),
      ),
    ],
  );
  await container.read(authSessionProvider.notifier).restore();
  return container;
}
