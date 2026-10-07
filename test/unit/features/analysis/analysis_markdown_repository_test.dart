import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/core/network/data_request_failure.dart';
import 'package:framefetch/features/analysis/data/analysis_markdown_repository.dart';
import 'package:framefetch/features/auth/application/authenticated_request.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

void main() {
  test(
    'fetches canonical Markdown through the generated authenticated binary API',
    () async {
      final dio = Dio();
      addTearDown(() => dio.close(force: true));
      final client = FramefetchServerApi(dio: dio);
      final content = '# 服务端报告\n\n唯一原文。\n';
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            expect(options.path, '/api/analyses/report-id/report.md');
            expect(options.responseType, ResponseType.bytes);
            expect(options.headers['Authorization'], 'Bearer synthetic-access');
            handler.resolve(
              Response<Uint8List>(
                requestOptions: options,
                statusCode: 200,
                data: Uint8List.fromList(utf8.encode(content)),
              ),
            );
          },
        ),
      );
      expect(await _repository(client).fetchText('report-id'), content);
    },
  );

  test(
    'rejects empty artifacts and invalid UTF-8 instead of exporting corrupt files',
    () async {
      for (final bytes in [
        <int>[],
        [255],
      ]) {
        final dio = Dio();
        addTearDown(() => dio.close(force: true));
        final client = FramefetchServerApi(dio: dio);
        dio.interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) {
              handler.resolve(
                Response<Uint8List>(
                  requestOptions: options,
                  statusCode: 200,
                  data: Uint8List.fromList(bytes),
                ),
              );
            },
          ),
        );
        await expectLater(
          _repository(client).fetchText('report-id'),
          throwsA(
            isA<DataRequestFailure>().having(
              (failure) => failure.kind,
              'kind',
              DataRequestFailureKind.invalidResponse,
            ),
          ),
        );
      }
    },
  );
}

AnalysisMarkdownRepository _repository(FramefetchServerApi client) =>
    AnalysisMarkdownRepository(
      AuthenticatedRequest(
        client: client,
        accessToken: () => 'synthetic-access',
        sessionGeneration: () => 0,
        expireSession: () async {},
        refreshSession: () async => false,
      ),
    );
