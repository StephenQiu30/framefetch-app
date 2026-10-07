import 'package:test/test.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

/// tests for InspectionsApi
void main() {
  final instance = FramefetchServerApi().getInspectionsApi();

  group(InspectionsApi, () {
    // 查询媒体解析结果
    //
    // 查询当前登录用户拥有的媒体解析结果。
    //
    //Future<ApiResponseInspectionResponse> getInspection(String inspectionId) async
    test('test getInspection', () async {
      // TODO
    });

    // 读取持久化媒体封面
    //
    // 读取当前用户拥有且存储在私有对象存储中的媒体封面。
    //
    //Future<Uint8List> getInspectionThumbnail(String inspectionId) async
    test('test getInspectionThumbnail', () async {
      // TODO
    });

    // 解析媒体信息
    //
    // 校验公开媒体地址并返回可供选择的语义下载格式。
    //
    //Future<ApiResponseInspectionResponse> inspectMedia(String idempotencyKey, InspectionRequest inspectionRequest) async
    test('test inspectMedia', () async {
      // TODO
    });
  });
}
