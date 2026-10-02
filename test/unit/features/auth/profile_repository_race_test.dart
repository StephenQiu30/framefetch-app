import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:framegrab/features/auth/data/profile_repository.dart';
import 'package:framegrab/features/auth/data/refresh_credential_store.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/auth_fakes.dart';

void main() {
  late VideoServerApi client;
  late ProviderContainer container;
  late ProfileRepository repository;
  setUp(() async {
    client = VideoServerApi();
    final grant = testSession(role: UserRole.admin, suffix: 'race');
    final user = grant.user.rebuild((b) => b.avatarVersion = 'avatar-old');
    container = ProviderContainer(
      overrides: [
        videoServerApiProvider.overrideWithValue(client),
        nativeAuthGatewayProvider.overrideWithValue(
          FakeAuthGateway(session: grant.rebuild((b) => b.user.replace(user))),
        ),
        refreshCredentialStoreProvider.overrideWithValue(
          MemoryCredentialStore('synthetic-refresh'),
        ),
      ],
    );
    await container.read(authSessionProvider.notifier).restore();
    repository = container.read(profileRepositoryProvider);
  });
  tearDown(() {
    container.dispose();
    client.dio.close();
  });

  Future<void> reverseResponses({
    required String delayedMethod,
    required Future<void> Function() first,
    required Future<void> Function() second,
    required Map<String, Object?> delayedData,
    required Map<String, Object?> immediateData,
  }) async {
    final entered = Completer<void>();
    final release = Completer<void>();
    client.dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final delayed = options.method == delayedMethod;
          if (delayed) {
            entered.complete();
            await release.future;
          }
          handler.resolve(
            Response(
              requestOptions: options,
              statusCode: 200,
              data: delayed ? delayedData : immediateData,
            ),
          );
        },
      ),
    );
    final pending = first();
    await entered.future;
    await second();
    release.complete();
    await pending;
  }

  test('a delayed upload preserves the newer username', () async {
    await reverseResponses(
      delayedMethod: 'PUT',
      first: () => repository.uploadAvatar(Uint8List.fromList([255, 216, 255])),
      second: () => repository.update('renamed'),
      delayedData: _profile(avatar: 'avatar-new', seconds: 1),
      immediateData: _profile(
        username: 'renamed',
        avatar: 'avatar-new',
        seconds: 2,
      ),
    );
    final user = container.read(authSessionProvider).user!;
    expect(user.username, 'renamed');
    expect(user.avatarVersion, 'avatar-new');
    expect(user.updatedAt, DateTime.utc(2026, 10, 2, 0, 0, 2));
  });

  test(
    'a delayed username response preserves the newer avatar removal',
    () async {
      await reverseResponses(
        delayedMethod: 'PATCH',
        first: () => repository.update('renamed'),
        second: repository.removeAvatar,
        delayedData: _profile(
          username: 'renamed',
          avatar: 'avatar-old',
          seconds: 1,
        ),
        immediateData: _profile(username: 'renamed', avatar: null, seconds: 2),
      );
      final user = container.read(authSessionProvider).user!;
      expect(user.username, 'renamed');
      expect(user.avatarVersion, isNull);
      expect(user.updatedAt, DateTime.utc(2026, 10, 2, 0, 0, 2));
    },
  );

  test(
    'a delayed avatar removal cannot restore a demoted admin role',
    () async {
      final access = _profile(role: 'user', avatar: null, seconds: 2);
      (access['data']! as Map<String, Object?>).addAll({
        'is_active': true,
        'quota': {'exempt': false},
      });
      await reverseResponses(
        delayedMethod: 'DELETE',
        first: repository.removeAvatar,
        second: () => repository.updateRole(UserRole.user),
        delayedData: _profile(avatar: null, seconds: 1),
        immediateData: access,
      );
      final user = container.read(authSessionProvider).user!;
      expect(user.role, UserRole.user);
      expect(user.avatarVersion, isNull);
      expect(user.updatedAt, DateTime.utc(2026, 10, 2, 0, 0, 2));
    },
  );
}

Map<String, Object?> _profile({
  String username = 'member',
  String role = 'admin',
  required String? avatar,
  required int seconds,
}) => {
  'code': 'ok',
  'message': 'ok',
  'data': <String, Object?>{
    'id': '00000000-0000-0000-0000-000000000001',
    'username': username,
    'email': 'member@example.com',
    'role': role,
    'avatar_version': avatar,
    'created_at': '2026-08-30T00:00:00Z',
    'updated_at': DateTime.utc(2026, 10, 2, 0, 0, seconds).toIso8601String(),
  },
};
