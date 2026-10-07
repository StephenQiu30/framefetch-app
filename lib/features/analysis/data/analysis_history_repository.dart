import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framefetch/core/network/data_request_failure.dart';
import 'package:framefetch/features/auth/application/authenticated_request.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

final analysisHistoryRepositoryProvider = Provider<AnalysisHistoryRepository>(
  (ref) => GeneratedAnalysisHistoryRepository(
    ref.watch(authenticatedRequestProvider),
  ),
);

abstract interface class AnalysisHistoryRepository {
  Future<Object> fetchRecord(String id);
  Future<AnalysisRunHistoryPageResponse> fetchRuns(
    String id, {
    int? before,
    int pageSize = 10,
  });
}

final class GeneratedAnalysisHistoryRepository
    implements AnalysisHistoryRepository {
  const GeneratedAnalysisHistoryRepository(this._request);
  final AuthenticatedRequest _request;

  @override
  Future<Object> fetchRecord(String id) => _request.execute((client) async {
    final response = await client.getAnalysesApi().getAnalysisHistoryRecord(
      analysisId: id,
    );
    final record = response.data?.data.oneOf.value;
    if (record is! VideoAnalysisHistoryRecordResponse &&
        record is! ScreenplayAnalysisHistoryRecordResponse) {
      throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
    }
    return record!;
  });

  @override
  Future<AnalysisRunHistoryPageResponse> fetchRuns(
    String id, {
    int? before,
    int pageSize = 10,
  }) => _request.execute((client) async {
    final response = await client.getAnalysesApi().listAnalysisRuns(
      analysisId: id,
      beforeRunNo: before,
      limit: pageSize,
    );
    final data = response.data?.data;
    if (data == null) {
      throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
    }
    return data;
  });
}
