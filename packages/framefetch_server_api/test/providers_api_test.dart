import 'package:test/test.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

/// tests for ProvidersApi
void main() {
  final instance = FramefetchServerApi().getProvidersApi();

  group(ProvidersApi, () {
    // 查询平台能力状态
    //
    // 返回 Registry 声明的能力与身份要求。
    //
    //Future<ApiResponseProviderListResponse> listProviders() async
    test('test listProviders', () async {
      // TODO
    });
  });
}
