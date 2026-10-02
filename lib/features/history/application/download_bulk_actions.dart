import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/history/application/bulk_parse_download.dart';
import 'package:framegrab/features/history/application/download_retry.dart';
import 'package:framegrab/features/history/data/download_history_repository.dart';
import 'package:framegrab/features/media/data/media_repository.dart';
import 'package:url_launcher/url_launcher.dart';

enum DownloadBulkAction { download, retry, delete }

final downloadBulkActionsProvider = Provider.autoDispose<DownloadBulkActions>((
  ref,
) {
  final session = ref.read(authSessionProvider.notifier);
  return DownloadBulkActions(
    repository: ref.watch(downloadHistoryRepositoryProvider),
    media: ref.watch(mediaRepositoryProvider),
    sessionGeneration: () => session.sessionGeneration,
    openFile: (uri) => launchUrl(uri, mode: LaunchMode.externalApplication),
  );
});

final class DownloadBulkActions {
  DownloadBulkActions({
    required this.repository,
    required this.media,
    required this.sessionGeneration,
    required this.openFile,
  });
  final DownloadHistoryRepository repository;
  final MediaRepository media;
  final int Function() sessionGeneration;
  final Future<bool> Function(Uri) openFile;
  final Map<String, DownloadRetry> _retries = {};
  Future<BulkOperationResult>? _pending;

  Future<BulkOperationResult> run(
    List<String> ids,
    DownloadBulkAction action, {
    void Function(int completed, int total)? onProgress,
  }) {
    if (_pending case final pending?) return pending;
    final pending = _execute(ids, action, sessionGeneration(), onProgress);
    _pending = pending;
    return pending.whenComplete(() {
      if (identical(_pending, pending)) _pending = null;
    });
  }

  Future<BulkOperationResult> _execute(
    List<String> ids,
    DownloadBulkAction action,
    int generation,
    void Function(int, int)? onProgress,
  ) async {
    final completed = <String>[];
    final errors = <String, Object>{};
    for (var index = 0; index < ids.length; index++) {
      if (generation != sessionGeneration()) break;
      final id = ids[index];
      try {
        switch (action) {
          case DownloadBulkAction.delete:
            await repository.delete(id);
          case DownloadBulkAction.retry:
            final retry = _retries.putIfAbsent(
              id,
              () => DownloadRetry(
                execute: (key) => repository.retry(id, idempotencyKey: key),
                sessionGeneration: sessionGeneration,
              ),
            );
            await retry.run();
          case DownloadBulkAction.download:
            final uri = await media.issueDownloadUrl(id);
            if (generation != sessionGeneration()) break;
            if (!await openFile(uri)) {
              throw const DataRequestFailure(DataRequestFailureKind.unknown);
            }
        }
        if (generation != sessionGeneration()) break;
        completed.add(id);
      } catch (error) {
        if (generation != sessionGeneration()) break;
        errors[id] = error;
      } finally {
        if (generation == sessionGeneration()) {
          onProgress?.call(index + 1, ids.length);
        }
      }
    }
    return BulkOperationResult(
      completed: List.unmodifiable(completed),
      errors: Map.unmodifiable(errors),
      current: generation == sessionGeneration(),
    );
  }
}
