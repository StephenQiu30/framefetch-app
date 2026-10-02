import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:video_server_api/video_server_api.dart';

import 'openapi_parity_fixtures.dart';

void main() {
  test(
    'decodes all four unified history record kinds and preserves cursor',
    () {
      final value = standardSerializers.deserializeWith(
        ApiResponseHistoryRecordPageResponse.serializer,
        envelope({
          'items': historyRecords,
          'next_cursor': {
            'created_at': fixtureDate,
            'record_type': 'document_parse',
            'id': fixtureId,
          },
        }),
      )!;
      final items = value.data.items.map((item) => item.oneOf.value).toList();
      expect(items[0], isA<ParseHistoryRecordResponse>());
      expect(items[1], isA<DocumentParseHistoryRecordResponse>());
      expect(items[2], isA<VideoAnalysisHistoryRecordResponse>());
      expect(items[3], isA<ScreenplayAnalysisHistoryRecordResponse>());
      expect(
        value.data.nextCursor?.recordType,
        HistoryRecordKind.documentParse,
      );
      final wire =
          standardSerializers.serializeWith(
                ApiResponseHistoryRecordPageResponse.serializer,
                value,
              )!
              as Map<String, dynamic>;
      final data = wire['data'] as Map<String, dynamic>;
      expect(
        (data['items'] as List<dynamic>).cast<Map<String, dynamic>>().map(
          (item) => item['record_type'],
        ),
        ['parse', 'document_parse', 'video_analysis', 'screenplay_analysis'],
      );
    },
  );

  test('decodes each single analysis history record without ambiguous union', () {
    for (final item in historyRecords.skip(2)) {
      final value = standardSerializers.deserializeWith(
        ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponse
            .serializer,
        envelope(item),
      )!;
      final wire =
          standardSerializers.serializeWith(
                ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponse
                    .serializer,
                value,
              )!
              as Map<String, dynamic>;
      expect(
        (wire['data'] as Map<String, dynamic>)['record_type'],
        item['record_type'],
      );
    }
  });

  test(
    'sends repeated record type filters and omits unused nullable queries',
    () async {
      final dio = Dio();
      addTearDown(() => dio.close(force: true));
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            expect(options.path, '/api/download-intents/history/records');
            expect(options.uri.queryParametersAll['record_type'], [
              'parse',
              'document_parse',
            ]);
            expect(options.queryParameters, isNot(contains('before_id')));
            expect(options.queryParameters, isNot(contains('created_from')));
            handler.resolve(
              Response<Map<String, Object?>>(
                requestOptions: options,
                statusCode: 200,
                data: envelope({'items': <Object?>[], 'next_cursor': null}),
              ),
            );
          },
        ),
      );
      final result = await VideoServerApi(dio: dio)
          .getDownloadIntentsApi()
          .listHistoryRecords(
            recordType: BuiltList([
              HistoryRecordKind.parse,
              HistoryRecordKind.documentParse,
            ]),
            statusGroup: HistoryStatusGroup.completed,
          );
      expect(result.data?.data.items, isEmpty);
    },
  );

  test(
    'uploads avatar as raw bytes and reads the WebP response as bytes',
    () async {
      final dio = Dio();
      addTearDown(() => dio.close(force: true));
      final bytes = Uint8List.fromList([82, 73, 70, 70]);
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            expect(options.path, '/api/users/me/avatar');
            if (options.method == 'PUT') {
              expect(options.contentType, 'application/octet-stream');
              expect(
                await (options.data as Stream<List<int>>)
                    .expand((chunk) => chunk)
                    .toList(),
                bytes,
              );
              handler.resolve(
                Response<Map<String, Object?>>(
                  requestOptions: options,
                  statusCode: 200,
                  data: envelope(userResponse),
                ),
              );
            } else {
              expect(options.responseType, ResponseType.bytes);
              handler.resolve(
                Response<Uint8List>(
                  requestOptions: options,
                  statusCode: 200,
                  data: bytes,
                ),
              );
            }
          },
        ),
      );
      final api = VideoServerApi(dio: dio).getUsersApi();
      final uploaded = await api.uploadCurrentUserAvatar(
        body: MultipartFile.fromBytes(bytes),
      );
      expect(uploaded.data?.data.avatarVersion, fixtureId);
      expect((await api.getCurrentUserAvatar()).data, bytes);
    },
  );

  test(
    'retains a missing analytics average and typed operation log metadata',
    () {
      final analytics = standardSerializers.deserializeWith(
        ApiResponseAnalysisAnalyticsResponse.serializer,
        envelope({
          'period_days': 30,
          'start': fixtureDate,
          'end': fixtureDate,
          'summary': {
            'total': 1,
            'succeeded': 0,
            'failed': 0,
            'cancelled': 0,
            'active': 1,
            'average_duration_seconds': null,
            'completed_duration_count': 0,
          },
          'daily': <Object?>[],
          'inputs': <Object?>[],
        }),
      )!;
      expect(analytics.data.summary.averageDurationSeconds, isNull);
      final log = standardSerializers
          .deserializeWith(OperationLogResponse.serializer, {
            'id': fixtureId,
            'created_at': fixtureDate,
            'finished_at': null,
            'actor_id': null,
            'actor_name': null,
            'operation': 'createAnalysis',
            'description': '创建分析',
            'method': 'POST',
            'route': '/api/downloads/{download_id}/analyses',
            'resource_id': null,
            'resource_key': null,
            'outcome': 'started',
            'source': 'task',
            'task_state': 'running',
            'status_code': null,
            'error_code': null,
          })!;
      expect(log.source_, OperationLogResponseSource_Enum.task);
      expect(log.outcome, OperationLogResponseOutcomeEnum.started);
      expect(log.taskState, 'running');
    },
  );
}
