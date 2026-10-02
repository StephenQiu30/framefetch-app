import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/documents/data/document_repository.dart';

final documentBulkDeleteProvider = Provider.autoDispose<DocumentBulkDelete>((
  ref,
) {
  final session = ref.read(authSessionProvider.notifier);
  return DocumentBulkDelete(
    delete: ref.watch(documentRepositoryProvider).delete,
    sessionGeneration: () => session.sessionGeneration,
  );
});

typedef DocumentBulkDeleteResult = ({
  List<String> completed,
  Map<String, Object> errors,
  bool current,
});

final class DocumentBulkDelete {
  DocumentBulkDelete({required this.delete, required this.sessionGeneration});
  final Future<void> Function(String id) delete;
  final int Function() sessionGeneration;
  Future<DocumentBulkDeleteResult>? _pending;

  Future<DocumentBulkDeleteResult> run(List<String> ids) {
    if (_pending case final pending?) return pending;
    final pending = _execute(ids, sessionGeneration());
    _pending = pending;
    return pending.whenComplete(() {
      if (identical(_pending, pending)) _pending = null;
    });
  }

  Future<DocumentBulkDeleteResult> _execute(
    List<String> ids,
    int generation,
  ) async {
    final completed = <String>[];
    final errors = <String, Object>{};
    for (final id in ids) {
      if (generation != sessionGeneration()) break;
      try {
        await delete(id);
        if (generation != sessionGeneration()) break;
        completed.add(id);
      } catch (error) {
        if (generation != sessionGeneration()) break;
        errors[id] = error;
      }
    }
    return (
      completed: List<String>.unmodifiable(completed),
      errors: Map<String, Object>.unmodifiable(errors),
      current: generation == sessionGeneration(),
    );
  }
}
