import 'package:built_collection/built_collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:framegrab/features/history/application/activity_history_query.dart';
import 'package:video_server_api/video_server_api.dart';

final activityHistoryRepositoryProvider = Provider<ActivityHistoryRepository>(
  (ref) => GeneratedActivityHistoryRepository(
    ref.watch(authenticatedRequestProvider),
  ),
);

abstract interface class ActivityHistoryRepository {
  Future<HistoryRecordPageResponse> fetch(ActivityHistoryQuery query);
}

final class GeneratedActivityHistoryRepository
    implements ActivityHistoryRepository {
  const GeneratedActivityHistoryRepository(this._request);
  final AuthenticatedRequest _request;

  @override
  Future<HistoryRecordPageResponse> fetch(
    ActivityHistoryQuery query,
  ) => _request.execute((client) async {
    final response = await client.getDownloadIntentsApi().listHistoryRecords(
      recordType: query.recordTypes.isEmpty
          ? null
          : BuiltList(query.recordTypes),
      statusGroup: query.status,
      createdFrom: query.createdFrom,
      createdTo: query.createdTo,
      q: query.search.trim().isEmpty ? null : query.search.trim(),
      skillId: query.skillId,
      resultContract: query.resultContract,
      documentId: query.documentId,
      downloadId: query.downloadId,
      beforeCreatedAt: query.cursor?.createdAt,
      beforeRecordType: query.cursor?.recordType,
      beforeId: query.cursor?.id,
      limit: query.pageSize,
    );
    final data = response.data?.data;
    if (data == null) {
      throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
    }
    return data;
  });
}
