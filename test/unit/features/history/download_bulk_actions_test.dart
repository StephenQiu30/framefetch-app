import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/history/application/download_bulk_actions.dart';
import 'package:framegrab/features/media/data/media_repository.dart';

import '../../../support/data_fakes.dart';

void main() {
  test('does not open a signed URL after the session changes', () async {
    var generation = 0;
    var launches = 0;
    final url = Completer<Uri>();
    final operation = DownloadBulkActions(
      repository: FakeDownloadHistoryRepository(),
      media: _Media(url.future),
      sessionGeneration: () => generation,
      openFile: (_) async {
        launches++;
        return true;
      },
    );
    final pending = operation.run(['one', 'two'], DownloadBulkAction.download);
    generation++;
    url.complete(Uri.parse('https://files.example/authorized'));
    expect((await pending).current, false);
    expect(launches, 0);
  });

  test('bulk file retrieval reports unsuccessful platform launches', () async {
    final repository = FakeDownloadHistoryRepository();
    final operation = DownloadBulkActions(
      repository: repository,
      media: _Media(
        Future.value(Uri.parse('https://files.example/authorized')),
      ),
      sessionGeneration: () => 0,
      openFile: (_) async => false,
    );
    final result = await operation.run(['one'], DownloadBulkAction.download);
    expect(result.completed, isEmpty);
    expect(result.errors.keys, ['one']);
    expect(repository.deleteCalls, isEmpty);
  });
}

final class _Media implements MediaRepository {
  const _Media(this.url);
  final Future<Uri> url;
  @override
  Future<Uri> issueDownloadUrl(String jobId) => url;
  @override
  Future<Uint8List> fetchThumbnail(String resourcePath) =>
      throw UnimplementedError();
}
