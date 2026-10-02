import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/analysis/application/analysis_operation_keys.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/download/data/download_intake_repository.dart';
import 'package:framegrab/features/download/data/download_intent_repository.dart';
import 'package:video_server_api/video_server_api.dart';

final bulkParseDownloadProvider = Provider.autoDispose<BulkParseDownload>((
  ref,
) {
  final intents = ref.watch(downloadIntentRepositoryProvider);
  final downloads = ref.watch(downloadIntakeRepositoryProvider);
  final session = ref.read(authSessionProvider.notifier);
  return BulkParseDownload(
    inspect: intents.inspection,
    create: downloads.createDownload,
    sessionGeneration: () => session.sessionGeneration,
  );
});

final class BulkOperationResult {
  const BulkOperationResult({
    required this.completed,
    required this.errors,
    required this.current,
  });
  final List<String> completed;
  final Map<String, Object> errors;
  final bool current;
}

/// Reads each authoritative inspection before using its first server preset.
final class BulkParseDownload {
  BulkParseDownload({
    required this.inspect,
    required this.create,
    required this.sessionGeneration,
    String Function()? newKey,
  }) : newKey = newKey ?? (() => AnalysisOperationKeys().value('bulk', ''));
  final Future<InspectionResponse> Function(String) inspect;
  final Future<DownloadResponse> Function({
    required String formatId,
    required String idempotencyKey,
    required String inspectionId,
  })
  create;
  final int Function() sessionGeneration;
  final String Function() newKey;
  final Map<String, String> _keys = {};
  int? _ownerGeneration;
  Future<BulkOperationResult>? _pending;

  Future<BulkOperationResult> run(
    List<ParseHistoryRecordResponse> items, {
    void Function(int completed, int total)? onProgress,
  }) {
    if (_pending case final pending?) return pending;
    final generation = sessionGeneration();
    if (_ownerGeneration != generation) {
      _ownerGeneration = generation;
      _keys.clear();
    }
    final pending = _execute(items, generation, onProgress);
    _pending = pending;
    return pending.whenComplete(() {
      if (identical(_pending, pending)) _pending = null;
    });
  }

  Future<BulkOperationResult> _execute(
    List<ParseHistoryRecordResponse> items,
    int generation,
    void Function(int, int)? onProgress,
  ) async {
    final done = <String>[];
    final errors = <String, Object>{};
    for (var index = 0; index < items.length; index++) {
      if (generation != sessionGeneration()) break;
      final item = items[index];
      try {
        final id = item.inspectionId;
        if (id == null) {
          throw const DataRequestFailure(DataRequestFailureKind.unknown);
        }
        final inspection = await inspect(id);
        if (generation != sessionGeneration()) break;
        if (!inspection.expiresAt.isAfter(DateTime.now())) {
          throw const DataRequestFailure(
            DataRequestFailureKind.unknown,
            code: 'resource_expired',
          );
        }
        if (inspection.accessDecision != AccessDecision.downloadable ||
            inspection.formats.isEmpty) {
          throw const DataRequestFailure(DataRequestFailureKind.unknown);
        }
        final formatId = inspection.formats.first.id;
        final payload = '${inspection.id}:$formatId';
        final key = _keys.putIfAbsent(payload, newKey);
        await create(
          formatId: formatId,
          inspectionId: inspection.id,
          idempotencyKey: key,
        );
        if (generation != sessionGeneration()) break;
        _keys.remove(payload);
        done.add(item.id);
      } catch (error) {
        if (generation != sessionGeneration()) break;
        errors[item.id] = error;
      } finally {
        if (generation == sessionGeneration()) {
          onProgress?.call(index + 1, items.length);
        }
      }
    }
    return BulkOperationResult(
      completed: List.unmodifiable(done),
      errors: Map.unmodifiable(errors),
      current: generation == sessionGeneration(),
    );
  }
}
