import 'package:test/test.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

/// tests for AppAuthApi
void main() {
  final instance = FramefetchServerApi().getAppAuthApi();

  group(AppAuthApi, () {
    // 查询原生应用当前用户
    //
    //Future<UserResponse> getNativeCurrentUser() async
    test('test getNativeCurrentUser', () async {
      // TODO
    });

    // 登录原生应用
    //
    //Future<NativeSessionResponse> loginNativeUser(EmailPasswordRequest emailPasswordRequest) async
    test('test loginNativeUser', () async {
      // TODO
    });

    // 退出原生应用
    //
    //Future logoutNativeSession(NativeLogoutRequest nativeLogoutRequest) async
    test('test logoutNativeSession', () async {
      // TODO
    });

    // 轮换原生应用会话
    //
    //Future<NativeSessionResponse> refreshNativeSession(NativeRefreshRequest nativeRefreshRequest) async
    test('test refreshNativeSession', () async {
      // TODO
    });

    // 注册原生应用用户
    //
    //Future<NativeSessionResponse> registerNativeUser(RegisterRequest registerRequest) async
    test('test registerNativeUser', () async {
      // TODO
    });

    // 发送注册邮箱验证码
    //
    //Future<RegistrationCodeResponse> sendNativeRegistrationCode(RegistrationCodeRequest registrationCodeRequest) async
    test('test sendNativeRegistrationCode', () async {
      // TODO
    });

    // 验证注册邮箱验证码
    //
    //Future<RegistrationCodeVerificationResponse> verifyNativeRegistrationCode(RegistrationCodeVerificationRequest registrationCodeVerificationRequest) async
    test('test verifyNativeRegistrationCode', () async {
      // TODO
    });
  });
}
