import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:video_server_api/video_server_api.dart';

final adminUserSelectionProvider = NotifierProvider.autoDispose(
  AdminSelectionController.new,
);
final adminFileSelectionProvider = NotifierProvider.autoDispose(
  AdminSelectionController.new,
);
final adminCatalogSelectionProvider = NotifierProvider.autoDispose(
  AdminSelectionController.new,
);
final adminAiSelectionProvider = NotifierProvider.autoDispose(
  AdminSelectionController.new,
);

final class AdminSelectionState {
  const AdminSelectionState({
    this.selected = const {},
    this.busy = false,
    this.hasFailure = false,
  });
  final Set<String> selected;
  final bool busy;
  final bool hasFailure;
}

final class AdminSelectionController extends Notifier<AdminSelectionState> {
  int _ownerEpoch = 0;

  @override
  AdminSelectionState build() {
    _ownerEpoch++;
    ref.listen(
      authSessionProvider.select(
        (session) => (session.phase, session.user?.id, session.user?.role),
      ),
      (_, _) {
        _ownerEpoch++;
        state = const AdminSelectionState();
      },
    );
    return const AdminSelectionState();
  }

  void clear() {
    if (!state.busy) state = const AdminSelectionState();
  }

  void toggle(String id, bool selected) {
    if (state.busy) return;
    final ids = {...state.selected};
    selected ? ids.add(id) : ids.remove(id);
    state = AdminSelectionState(selected: Set.unmodifiable(ids));
  }

  void selectPage(Iterable<String> ids, bool selected) {
    if (state.busy) return;
    state = AdminSelectionState(
      selected: selected ? Set.unmodifiable(ids) : const {},
    );
  }

  Future<bool> deleteSelected(Future<void> Function(String id) delete) async {
    if (!ref.mounted || state.busy || state.selected.isEmpty) return false;
    final session = ref.read(authSessionProvider.notifier);
    final generation = session.sessionGeneration;
    final userId = ref.read(authSessionProvider).user?.id;
    final ownerEpoch = _ownerEpoch;
    if (!_isCurrent(session, generation, userId, ownerEpoch)) return false;
    final ids = [...state.selected];
    state = AdminSelectionState(selected: state.selected, busy: true);
    final failed = <String>{};
    for (final id in ids) {
      if (!_isCurrent(session, generation, userId, ownerEpoch)) return false;
      try {
        await delete(id);
      } catch (_) {
        failed.add(id);
      }
      if (!_isCurrent(session, generation, userId, ownerEpoch)) return false;
    }
    state = AdminSelectionState(
      selected: Set.unmodifiable(failed),
      hasFailure: failed.isNotEmpty,
    );
    return true;
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
