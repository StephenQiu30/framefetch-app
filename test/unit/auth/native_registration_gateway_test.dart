import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/features/auth/data/native_auth_gateway.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

void main() {
  test(
    'uses the native verification contract and requires server acceptance',
    () async {
      final dio = Dio();
      addTearDown(() => dio.close(force: true));
      var accepted = true;
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            expect(options.path, '/api/app/v1/auth/registration-code/verify');
            expect(options.method, 'POST');
            expect(options.data, {
              'email': 'member@example.com',
              'verification_code': '123456',
            });
            handler.resolve(
              Response<Map<String, Object?>>(
                requestOptions: options,
                statusCode: 200,
                data: {'verified': accepted},
              ),
            );
          },
        ),
      );
      final gateway = GeneratedNativeAuthGateway(FramefetchServerApi(dio: dio));
      await gateway.verifyRegistrationCode(
        email: 'member@example.com',
        verificationCode: '123456',
      );
      accepted = false;
      await expectLater(
        gateway.verifyRegistrationCode(
          email: 'member@example.com',
          verificationCode: '123456',
        ),
        throwsA(
          isA<AuthRequestFailure>().having(
            (failure) => failure.kind,
            'kind',
            AuthFailureKind.invalidVerificationCode,
          ),
        ),
      );
    },
  );

  for (final (code, status, kind) in [
    ('invalid_verification_code', 422, AuthFailureKind.invalidVerificationCode),
    ('operation_rate_limited', 429, AuthFailureKind.rateLimited),
  ]) {
    test('maps $code without creating a session', () async {
      final dio = Dio();
      addTearDown(() => dio.close(force: true));
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            handler.reject(
              DioException(
                requestOptions: options,
                type: DioExceptionType.badResponse,
                response: Response<Map<String, Object?>>(
                  requestOptions: options,
                  statusCode: status,
                  data: {'code': code},
                ),
              ),
            );
          },
        ),
      );
      await expectLater(
        GeneratedNativeAuthGateway(
          FramefetchServerApi(dio: dio),
        ).verifyRegistrationCode(
          email: 'member@example.com',
          verificationCode: '123456',
        ),
        throwsA(
          isA<AuthRequestFailure>().having(
            (failure) => failure.kind,
            'kind',
            kind,
          ),
        ),
      );
    });
  }
}
