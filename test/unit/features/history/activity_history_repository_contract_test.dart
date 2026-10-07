import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/features/auth/application/authenticated_request.dart';
import 'package:framefetch/features/history/application/activity_history_query.dart';
import 'package:framefetch/features/history/data/activity_history_repository.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

void main() {
  test(
    'sends typed unified-history filters and all three cursor fields',
    () async {
      final dio = Dio();
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            expect(options.path, '/api/download-intents/history/records');
            expect(options.uri.queryParametersAll['record_type'], [
              'screenplay_analysis',
            ]);
            expect(
              options.queryParameters['result_contract'],
              'screenplay-rewrite',
            );
            expect(options.queryParameters['q'], 'term');
            expect(options.queryParameters['limit'], 50);
            expect(
              options.queryParameters['before_record_type'],
              'document_parse',
            );
            expect(options.queryParameters['before_id'], 'cursor-id');
            expect(options.queryParameters['before_created_at'], isNotNull);
            handler.resolve(
              Response<Map<String, Object?>>(
                requestOptions: options,
                statusCode: 200,
                data: {
                  'code': 'ok',
                  'message': 'ok',
                  'data': {'items': <Object?>[], 'next_cursor': null},
                },
              ),
            );
          },
        ),
      );
      final request = AuthenticatedRequest(
        client: FramefetchServerApi(dio: dio),
        accessToken: () => 'test',
        sessionGeneration: () => 0,
        refreshSession: () async => false,
        expireSession: () async {},
      );
      final response = await GeneratedActivityHistoryRepository(request).fetch(
        ActivityHistoryQuery(
          category: ActivityCategory.screenplay,
          screenplayMode: ScreenplayHistoryMode.rewrite,
          search: ' term ',
          pageSize: 50,
          cursor: HistoryRecordCursorResponse(
            (b) => b
              ..id = 'cursor-id'
              ..recordType = HistoryRecordKind.documentParse
              ..createdAt = DateTime.utc(2026),
          ),
        ),
      );
      expect(response.items, isEmpty);
    },
  );
}
