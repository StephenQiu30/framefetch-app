import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:video_server_api/video_server_api.dart';

final adminUserMutationProvider = NotifierProvider.autoDispose(
  AdminMutationController.new,
);
final adminFileMutationProvider = NotifierProvider.autoDispose(
  AdminMutationController.new,
);
final adminCatalogMutationProvider = NotifierProvider.autoDispose(
  AdminMutationController.new,
);
final adminAiMutationProvider = NotifierProvider.autoDispose(
  AdminMutationController.new,
);

enum AdminMutationResult { succeeded, failed, stale }

final class AdminMutationController extends Notifier<bool> {
  int _ownerEpoch = 0;

  @override
  bool build() {
    _ownerEpoch++;
    ref.listen(
      authSessionProvider.select(
        (session) => (session.phase, session.user?.id, session.user?.role),
      ),
      (_, _) {
        _ownerEpoch++;
        state = false;
      },
    );
    return false;
  }

  Future<AdminMutationResult> run(Future<void> Function() operation) async {
    if (!ref.mounted || state) return AdminMutationResult.stale;
    final session = ref.read(authSessionProvider.notifier);
    final generation = session.sessionGeneration;
    final userId = ref.read(authSessionProvider).user?.id;
    final ownerEpoch = _ownerEpoch;
    if (!_isCurrent(session, generation, userId, ownerEpoch)) {
      return AdminMutationResult.stale;
    }
    state = true;
    var result = AdminMutationResult.succeeded;
    try {
      await operation();
    } catch (_) {
      result = AdminMutationResult.failed;
    }
    if (!_isCurrent(session, generation, userId, ownerEpoch)) {
      return AdminMutationResult.stale;
    }
    state = false;
    return result;
  }

  bool _isCurrent(
    AuthSessionController session,
    int generation,
    String? userId,
    int ownerEpoch,
  ) {
    if (!ref.mounted ||
        session.sessionGeneration != generation ||
        _ownerEpoch != ownerEpoch) {
      return false;
    }
    final current = ref.read(authSessionProvider);
    return current.isSignedIn &&
        current.user?.id == userId &&
        current.user?.role == UserRole.admin;
  }
}
