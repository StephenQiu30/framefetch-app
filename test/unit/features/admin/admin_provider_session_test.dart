import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/features/admin/application/admin_providers.dart';
import 'package:framefetch/features/auth/application/auth_session_controller.dart';
import 'package:framefetch/features/auth/data/native_auth_gateway.dart';
import 'package:framefetch/features/auth/data/refresh_credential_store.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

import '../../../support/auth_fakes.dart';

void main() {
  test(
    'an old administrator response cannot replace the new account query',
    () async {
      final client = FramefetchServerApi();
      addTearDown(client.dio.close);
      final gateway = FakeAuthGateway(
        session: testSession(role: UserRole.admin, suffix: 'admin-a'),
      );
      final container = ProviderContainer(
        overrides: [
          framefetchServerApiProvider.overrideWithValue(client),
          nativeAuthGatewayProvider.overrideWithValue(gateway),
          refreshCredentialStoreProvider.overrideWithValue(
            MemoryCredentialStore('synthetic-refresh'),
          ),
        ],
      );
      addTearDown(container.dispose);
      final session = container.read(authSessionProvider.notifier);
      await session.restore();
      final oldEntered = Completer<void>();
      final releaseOld = Completer<void>();
      final tokens = <Object?>[];
      client.dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            final token = options.headers['Authorization'];
            tokens.add(token);
            final old = token == 'Bearer access-admin-a';
            if (old) {
              oldEntered.complete();
              await releaseOld.future;
            }
            handler.resolve(
              Response(
                requestOptions: options,
                statusCode: 200,
                data: _users(old ? 'old-account-view' : 'new-account-view'),
              ),
            );
          },
        ),
      );
      final subscription = container.listen(adminUsersProvider, (_, _) {});
      addTearDown(subscription.close);
      await oldEntered.future;
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
      final current = await container.read(adminUsersProvider.future);
      expect(current.items.single.username, 'new-account-view');
      releaseOld.complete();
      await Future<void>.delayed(Duration.zero);
      await container.pump();
      expect(
        container.read(adminUsersProvider).value?.items.single.username,
        'new-account-view',
      );
      expect(tokens, ['Bearer access-admin-a', 'Bearer access-admin-b']);
    },
  );
}

Map<String, Object?> _users(String username) => {
  'code': 'ok',
  'message': 'ok',
  'data': {
    'page': 1,
    'page_size': 10,
    'total': 1,
    'items': [
      {
        'id': '00000000-0000-0000-0000-000000000100',
        'username': username,
        'email': 'synthetic@example.com',
        'role': 'user',
        'is_active': true,
        'quota': {'exempt': false},
        'created_at': '2026-10-02T00:00:00Z',
        'updated_at': '2026-10-02T00:00:00Z',
      },
    ],
  },
};
