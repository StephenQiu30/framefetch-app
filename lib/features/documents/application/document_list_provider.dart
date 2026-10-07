import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framefetch/features/documents/data/document_repository.dart';
import 'package:framefetch/shared/presentation/list_query.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

final documentListProvider = FutureProvider.autoDispose<DocumentPageResponse>(
  (ref) => ref
      .watch(documentRepositoryProvider)
      .fetchPage(
        page: ref.watch(documentListQueryProvider).page,
        pageSize: ref.watch(documentListQueryProvider).pageSize,
      ),
  retry: (_, _) => null,
);

final documentListQueryProvider =
    NotifierProvider.autoDispose<ListQueryController, ListQuery>(
      ListQueryController.new,
    );
