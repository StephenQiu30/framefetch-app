import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/data/profile_repository.dart';

final profileAvatarProvider = FutureProvider.autoDispose<Uint8List?>((
  ref,
) async {
  final identity = ref.watch(
    authSessionProvider.select(
      (session) => (session.user?.id, session.user?.avatarVersion),
    ),
  );
  if (identity.$1 == null || identity.$2 == null) return null;
  return ref.watch(profileRepositoryProvider).avatar();
});
