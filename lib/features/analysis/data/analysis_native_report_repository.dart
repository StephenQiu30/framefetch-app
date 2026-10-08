import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framefetch/core/network/data_request_failure.dart';
import 'package:framefetch/features/auth/application/authenticated_request.dart';

final analysisNativeReportRepositoryProvider = Provider(
  (ref) =>
      AnalysisNativeReportRepository(ref.watch(authenticatedRequestProvider)),
);

final class AnalysisNativeReportRepository {
  const AnalysisNativeReportRepository(this.request);
  final AuthenticatedRequest request;

  Future<Uint8List> fetch(String id, {required String format}) {
    if (format != 'html' && format != 'zip') {
      throw ArgumentError.value(format, 'format');
    }
    return request.execute((client) async {
      final response = await client.getAnalysesApi().exportAnalysisNativeReport(
        analysisId: id,
        reportFormat: format,
      );
      final bytes = response.data;
      if (bytes == null || bytes.isEmpty) {
        throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
      }
      return bytes;
    });
  }
}
