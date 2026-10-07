import 'package:test/test.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

/// tests for MediaImportsApi
void main() {
  final instance = FramefetchServerApi().getMediaImportsApi();

  group(MediaImportsApi, () {
    // 完成视频上传并触发验证
    //
    //Future<ApiResponseMediaImportResponse> completeMediaImport(String resourceId, CompleteMediaImportRequest completeMediaImportRequest) async
    test('test completeMediaImport', () async {
      // TODO
    });

    // 创建本地视频导入
    //
    // 创建只接受 MP4 的浏览器上传资源，不接收任意存储参数。
    //
    //Future<ApiResponseMediaImportResponse> createMediaImport(String idempotencyKey, MediaImportRequest mediaImportRequest) async
    test('test createMediaImport', () async {
      // TODO
    });

    // 创建或刷新视频上传会话
    //
    //Future<ApiResponseMediaUploadSessionResponse> createMediaUploadSession(String resourceId) async
    test('test createMediaUploadSession', () async {
      // TODO
    });

    // 查询本地视频导入
    //
    //Future<ApiResponseMediaImportResponse> getMediaImport(String resourceId) async
    test('test getMediaImport', () async {
      // TODO
    });
  });
}
