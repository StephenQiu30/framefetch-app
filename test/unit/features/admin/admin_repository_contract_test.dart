import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/admin/data/admin_repository.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:video_server_api/video_server_api.dart';
import '../../../support/admin_fixtures.dart';

void main() {
  test(
    'admin repositories use the generated analytics, logs, and deletion contract',
    () async {
      final client = VideoServerApi();
      final sent = <RequestOptions>[];
      client.dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            sent.add(options);
            if (options.method == 'DELETE') {
              handler.resolve(
                Response(requestOptions: options, statusCode: 204),
              );
              return;
            }
            final Object? data = switch (options.path) {
              '/api/admin/analyses/analytics' =>
                client.serializers.serializeWith(
                  AnalysisAnalyticsResponse.serializer,
                  adminAnalysisAnalyticsFixture(),
                ),
              '/api/admin/operation-logs' => client.serializers.serializeWith(
                OperationLogPageResponse.serializer,
                adminOperationLogsFixture(),
              ),
              '/api/admin/files' => {
                'items': <Object>[],
                'page': 1,
                'page_size': options.queryParameters['page_size'],
                'total': 0,
              },
              _ => throw StateError('Unexpected synthetic route'),
            };
            handler.resolve(
              Response(
                requestOptions: options,
                statusCode: 200,
                data: {'code': 'ok', 'message': 'ok', 'data': data},
              ),
            );
          },
        ),
      );
      final request = AuthenticatedRequest(
        client: client,
        accessToken: () => 'synthetic-access',
        sessionGeneration: () => 0,
        expireSession: () async {},
        refreshSession: () async => false,
      );
      final repository = GeneratedAdminRepository(request);
      expect((await repository.fetchAnalysisAnalytics(7)).summary.total, 12);
      expect(sent.last.queryParameters, {'days': 7});
      final from = DateTime.utc(2026, 10, 1);
      final to = DateTime.utc(2026, 10, 2);
      await repository.fetchOperationLogs(
        page: 2,
        pageSize: 50,
        query: 'admin',
        outcome: 'succeeded',
        source: 'task',
        adminOnly: true,
        createdFrom: from,
        createdTo: to,
      );
      expect(sent.last.queryParameters['page'], 2);
      expect(sent.last.queryParameters['page_size'], 50);
      expect(sent.last.queryParameters['q'], 'admin');
      expect(sent.last.queryParameters['source'], 'task');
      expect(sent.last.queryParameters['admin_only'], true);
      expect(sent.last.queryParameters['created_from'], from.toIso8601String());
      expect(sent.last.queryParameters['created_to'], to.toIso8601String());
      for (final size in [10, 20, 50]) {
        await repository.fetchFiles(pageSize: size);
        expect(sent.last.queryParameters['page_size'], size);
      }
      await repository.deleteUser('synthetic-user');
      expect(sent.last.path, '/api/admin/users/synthetic-user');
      final file = StoredFileResponse(
        (b) => b
          ..id = 'synthetic-report'
          ..name = 'synthetic.md'
          ..category = StoredFileCategory.analysisReport
          ..sizeBytes = 12
          ..objectCount = 1
          ..createdAt = DateTime.utc(2026, 10, 1),
      );
      await repository.deleteFile(file);
      expect(
        sent.last.path,
        '/api/admin/files/analysis_report/synthetic-report',
      );
    },
  );
}
