import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:video_server_api/video_server_api.dart';

final profileRepositoryProvider = Provider(
  (ref) => ProfileRepository(
    ref.watch(authenticatedRequestProvider),
    ref.read(authSessionProvider.notifier),
    () => ref.read(authSessionProvider).user,
  ),
);

final class ProfileRepository {
  const ProfileRepository(this.request, this.session, this.currentUser);
  final AuthenticatedRequest request;
  final AuthSessionController session;
  final UserResponse? Function() currentUser;
  Future<void> update(String username) async {
    final generation = request.sessionGeneration;
    final user = await request.execute((client) async {
      final response = await client.getUsersApi().updateCurrentUser(
        updateProfileRequest: UpdateProfileRequest(
          (b) => b..username = username,
        ),
      );
      final user = response.data?.data;
      if (user == null) {
        throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
      }
      return user;
    });
    _acceptFields(
      user.id,
      user.updatedAt,
      generation,
      (b) => b.username = user.username,
    );
  }

  Future<Uint8List> avatar() => request.execute((client) async {
    final response = await client.getUsersApi().getCurrentUserAvatar();
    final bytes = response.data;
    if (bytes == null || bytes.isEmpty) {
      throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
    }
    return bytes;
  });

  Future<void> uploadAvatar(Uint8List bytes) async {
    final generation = request.sessionGeneration;
    final user = await request.execute((client) async {
      final response = await client.getUsersApi().uploadCurrentUserAvatar(
        body: MultipartFile.fromBytes(bytes),
      );
      final user = response.data?.data;
      if (user == null) {
        throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
      }
      return user;
    });
    _acceptFields(
      user.id,
      user.updatedAt,
      generation,
      (b) => b.avatarVersion = user.avatarVersion,
    );
  }

  Future<void> removeAvatar() async {
    final generation = request.sessionGeneration;
    final user = await request.execute((client) async {
      final response = await client.getUsersApi().deleteCurrentUserAvatar();
      final user = response.data?.data;
      if (user == null) {
        throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
      }
      return user;
    });
    _acceptFields(
      user.id,
      user.updatedAt,
      generation,
      (b) => b.avatarVersion = user.avatarVersion,
    );
  }

  Future<void> updateRole(UserRole role) async {
    final generation = request.sessionGeneration;
    final current = currentUser();
    if (current == null) return;
    final access = await request.execute((client) async {
      final response = await client.getAdminApi().updateUserAccess(
        userId: current.id,
        updateUserAccessRequest: UpdateUserAccessRequest((b) => b..role = role),
      );
      final access = response.data?.data;
      if (access == null) {
        throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
      }
      return access;
    });
    _acceptFields(
      access.id,
      access.updatedAt,
      generation,
      (b) => b.role = access.role,
    );
  }

  // Independent profile sections may finish requests in a different order.
  // Merge only the mutation's fields into the latest account snapshot.
  void _acceptFields(
    String id,
    DateTime updatedAt,
    int generation,
    void Function(UserResponseBuilder) update,
  ) {
    final latest = currentUser();
    if (latest == null || latest.id != id) return;
    session.acceptUpdatedProfile(
      latest.rebuild((b) {
        update(b);
        b.updatedAt = updatedAt.isAfter(latest.updatedAt)
            ? updatedAt
            : latest.updatedAt;
      }),
      generation,
    );
  }
}
