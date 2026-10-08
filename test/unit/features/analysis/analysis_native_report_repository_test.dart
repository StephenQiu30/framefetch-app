import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/features/analysis/data/analysis_native_report_repository.dart';
import 'package:framefetch/features/auth/application/authenticated_request.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

void main() {
  for (final format in ['html', 'zip']) {
    test('$format report uses authenticated generated binary API', () async {
      final client = FramefetchServerApi();
      RequestOptions? sent;
      client.dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            sent = options;
            handler.resolve(
              Response(
                requestOptions: options,
                statusCode: 200,
                data: Uint8List.fromList([80, 75, 3, 4]),
              ),
            );
          },
        ),
      );
      final repository = AnalysisNativeReportRepository(
        AuthenticatedRequest(
          client: client,
          accessToken: () => 'synthetic-access',
          sessionGeneration: () => 0,
          expireSession: () async {},
          refreshSession: () async => false,
        ),
      );
      expect(await repository.fetch('native-report', format: format), [
        80,
        75,
        3,
        4,
      ]);
      expect(sent!.path, '/api/analyses/native-report/report.$format');
      expect(sent!.headers['Authorization'], 'Bearer synthetic-access');
      expect(sent!.responseType, ResponseType.bytes);
    });
  }
}
