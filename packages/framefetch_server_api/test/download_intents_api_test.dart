import 'package:test/test.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

/// tests for DownloadIntentsApi
void main() {
  final instance = FramefetchServerApi().getDownloadIntentsApi();

  group(DownloadIntentsApi, () {
    // 取消当前用户的解析意图
    //
    //Future<ApiResponseIntentResponse> cancelDownloadIntent(String intentId) async
    test('test cancelDownloadIntent', () async {
      // TODO
    });

    // 提交持久解析意图
    //
    //Future<ApiResponseIntentResponse> createDownloadIntent(String idempotencyKey, IntentRequest intentRequest) async
    test('test createDownloadIntent', () async {
      // TODO
    });

    // 按幂等键找回当前用户已提交的解析意图
    //
    //Future<ApiResponseIntentResponse> findDownloadIntent(String idempotencyKey) async
    test('test findDownloadIntent', () async {
      // TODO
    });

    // 查询当前用户的解析意图
    //
    //Future<ApiResponseIntentResponse> getDownloadIntent(String intentId) async
    test('test getDownloadIntent', () async {
      // TODO
    });

    // 分页查询当前用户的解析记录
    //
    //Future<ApiResponseIntentHistoryResponse> listDownloadIntents({ String before, int limit }) async
    test('test listDownloadIntents', () async {
      // TODO
    });

    // 分页查询链接、视频 AI、剧本基础解析与剧本 AI 记录
    //
    //Future<ApiResponseHistoryRecordPageResponse> listHistoryRecords({ DateTime beforeCreatedAt, BuiltList<HistoryRecordKind> recordType, HistoryStatusGroup statusGroup, DateTime createdFrom, DateTime createdTo, String q, String skillId, AnalysisResultContract resultContract, String documentId, String downloadId, HistoryRecordKind beforeRecordType, String beforeId, int limit }) async
    test('test listHistoryRecords', () async {
      // TODO
    });

    // 在原意图中重新解析并确认过期结果
    //
    //Future<ApiResponseIntentResponse> refreshDownloadIntent(String intentId) async
    test('test refreshDownloadIntent', () async {
      // TODO
    });
  });
}
