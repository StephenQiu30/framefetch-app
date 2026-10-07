import 'package:dio/dio.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

/// The single HTTP transport used by the generated API client.
///
/// Web uses Axios, while Flutter uses Dio. Keeping the transport configuration
/// here makes the observable request contract the same on both clients without
/// coupling the native app to a JavaScript runtime.
final class DioHttpClient {
  DioHttpClient({
    required String baseUrl,
    required Duration connectTimeout,
    required Duration receiveTimeout,
  }) : dio = Dio(
         BaseOptions(
           baseUrl: baseUrl,
           connectTimeout: connectTimeout,
           receiveTimeout: receiveTimeout,
           headers: const {
             'Accept': 'application/json',
             'X-Client-Platform': 'flutter',
           },
         ),
       ) {
    api = FramefetchServerApi(dio: dio);
  }

  final Dio dio;
  late final FramefetchServerApi api;

  void close() => dio.close(force: true);
}
