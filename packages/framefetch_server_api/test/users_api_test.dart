import 'package:test/test.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

/// tests for UsersApi
void main() {
  final instance = FramefetchServerApi().getUsersApi();

  group(UsersApi, () {
    // 移除当前用户头像
    //
    //Future<ApiResponseUserResponse> deleteCurrentUserAvatar() async
    test('test deleteCurrentUserAvatar', () async {
      // TODO
    });

    // 读取当前用户头像
    //
    //Future<Uint8List> getCurrentUserAvatar() async
    test('test getCurrentUserAvatar', () async {
      // TODO
    });

    // 更新当前用户资料
    //
    //Future<ApiResponseUserResponse> updateCurrentUser(UpdateProfileRequest updateProfileRequest) async
    test('test updateCurrentUser', () async {
      // TODO
    });

    // 上传当前用户头像
    //
    //Future<ApiResponseUserResponse> uploadCurrentUserAvatar(MultipartFile body) async
    test('test uploadCurrentUserAvatar', () async {
      // TODO
    });
  });
}
