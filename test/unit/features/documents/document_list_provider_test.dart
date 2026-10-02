import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/documents/application/document_list_provider.dart';
import 'package:framegrab/features/documents/data/document_repository.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/data_fakes.dart';

void main() {
  test('document paging keeps 10, 20 and 50 without selection state', () async {
    final repository = _Repository();
    final container = ProviderContainer(
      overrides: [documentRepositoryProvider.overrideWithValue(repository)],
    );
    addTearDown(container.dispose);
    final subscription = container.listen(documentListProvider, (_, _) {});
    addTearDown(subscription.close);

    await container.read(documentListProvider.future);
    container.read(documentListQueryProvider.notifier).page(2);
    await container.read(documentListProvider.future);
    container.read(documentListQueryProvider.notifier).pageSize(20);
    await container.read(documentListProvider.future);
    container.read(documentListQueryProvider.notifier).page(3);
    await container.read(documentListProvider.future);
    container.read(documentListQueryProvider.notifier).pageSize(50);
    await container.read(documentListProvider.future);

    expect(repository.queries, [
      (page: 1, pageSize: 10),
      (page: 2, pageSize: 10),
      (page: 1, pageSize: 20),
      (page: 3, pageSize: 20),
      (page: 1, pageSize: 50),
    ]);
  });
}

final class _Repository implements DocumentRepository {
  final queries = <({int page, int pageSize})>[];

  @override
  Future<DocumentPageResponse> fetchPage({
    int page = 1,
    int pageSize = 20,
  }) async {
    queries.add((page: page, pageSize: pageSize));
    return emptyDocuments().rebuild(
      (builder) => builder
        ..page = page
        ..pageSize = pageSize,
    );
  }

  @override
  Future<DocumentDetailResponse> fetchDetail(String documentId) =>
      throw UnimplementedError();

  @override
  Future<void> delete(String documentId) => throw UnimplementedError();
}
