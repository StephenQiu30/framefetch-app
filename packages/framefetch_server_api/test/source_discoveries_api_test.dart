import 'package:test/test.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

/// tests for SourceDiscoveriesApi
void main() {
  final instance = FramefetchServerApi().getSourceDiscoveriesApi();

  group(SourceDiscoveriesApi, () {
    // 发现微信公众号文章中的视频
    //
    //Future<ApiResponseSourceDiscoveryResponse> createSourceDiscovery(String idempotencyKey, SourceDiscoveryRequest sourceDiscoveryRequest) async
    test('test createSourceDiscovery', () async {
      // TODO
    });

    // 查询文章视频发现结果
    //
    //Future<ApiResponseSourceDiscoveryResponse> getSourceDiscovery(String discoveryId) async
    test('test getSourceDiscovery', () async {
      // TODO
    });
  });
}
