import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:framegrab/features/auth/data/profile_repository.dart';
import 'package:framegrab/features/auth/data/refresh_credential_store.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/auth_fakes.dart';

void main() {
  late VideoServerApi client;
  late ProviderContainer container;
  setUp(() async {
    client = VideoServerApi();
    container = ProviderContainer(
      overrides: [
        videoServerApiProvider.overrideWithValue(client),
        nativeAuthGatewayProvider.overrideWithValue(FakeAuthGateway()),
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
    'avatar upload updates the session from the authenticated server response',
    () async {
      RequestOptions? sent;
      client.dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            sent = options;
            handler.resolve(
              Response(
                requestOptions: options,
                statusCode: 200,
                data: _profile('avatar-new'),
              ),
            );
          },
        ),
      );
      await container
          .read(profileRepositoryProvider)
          .uploadAvatar(Uint8List.fromList([255, 216, 255]));
      expect(sent?.method, 'PUT');
      expect(sent?.headers['Authorization'], 'Bearer access-refresh');
      expect(
        container.read(authSessionProvider).user?.avatarVersion,
        'avatar-new',
      );
    },
  );

  test(
    'avatar completion after logout cannot repopulate the account',
    () async {
      final pending = Completer<void>();
      final entered = Completer<void>();
      client.dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            entered.complete();
            await pending.future;
            handler.resolve(
              Response(
                requestOptions: options,
                statusCode: 200,
                data: _profile('stale-avatar'),
              ),
            );
          },
        ),
      );
      final upload = container
          .read(profileRepositoryProvider)
          .uploadAvatar(Uint8List.fromList([255, 216, 255]));
      final rejected = expectLater(upload, throwsA(isA<DataRequestFailure>()));
      await entered.future;
      await container.read(authSessionProvider.notifier).logout();
      pending.complete();
      await rejected;
      expect(container.read(authSessionProvider).user, isNull);
    },
  );
}

Map<String, Object?> _profile(String avatar) => {
  'code': 'ok',
  'message': 'ok',
  'data': {
    'id': '00000000-0000-0000-0000-000000000001',
    'username': 'member',
    'email': 'member@example.com',
    'role': 'user',
    'avatar_version': avatar,
    'created_at': '2026-10-02T00:00:00Z',
    'updated_at': '2026-10-02T00:00:00Z',
  },
};
