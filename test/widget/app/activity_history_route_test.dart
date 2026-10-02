import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/app/app.dart';
import 'package:framegrab/app/router/app_router.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:framegrab/features/history/data/activity_history_repository.dart';
import 'package:framegrab/features/history/presentation/activity_history_screen.dart';
import 'package:video_server_api/video_server_api.dart';

import 'test_app.dart';

void main() {
  const documentId = '00000000-0000-0000-0000-000000000102';
  const downloadId = '00000000-0000-0000-0000-000000000103';

  for (final scope in [
    ('document_id', documentId),
    ('download_id', downloadId),
  ]) {
    testWidgets(
      'history navigation sends only the ${scope.$1} material scope',
      (tester) async {
        final requests = <Map<String, String>>[];
        await setMobileViewport(tester);
        await pumpFramegrabApp(
          tester,
          activityHistoryRepository: _repository(requests),
        );
        final router = ProviderScope.containerOf(
          tester.element(find.byType(FramegrabApp)),
        ).read(appRouterProvider);

        router.go('/history/activity?${scope.$1}=${scope.$2}');
        await tester.pumpAndSettle();

        expect(find.byType(ActivityHistoryScreen), findsOneWidget);
        expect(requests, [
          {scope.$1: scope.$2, 'limit': '10'},
        ]);
        expect(tester.takeException(), isNull);
      },
    );
  }

  testWidgets('changing history material replaces the previous request scope', (
    tester,
  ) async {
    final requests = <Map<String, String>>[];
    await setMobileViewport(tester);
    await pumpFramegrabApp(
      tester,
      activityHistoryRepository: _repository(requests),
    );
    final router = ProviderScope.containerOf(
      tester.element(find.byType(FramegrabApp)),
    ).read(appRouterProvider);

    router.go('/history/activity?document_id=$documentId');
    await tester.pumpAndSettle();
    router.go('/history/activity?download_id=$downloadId');
    await tester.pumpAndSettle();

    expect(find.byType(ActivityHistoryScreen), findsOneWidget);
    expect(requests, [
      {'document_id': documentId, 'limit': '10'},
      {'download_id': downloadId, 'limit': '10'},
    ]);
    expect(tester.takeException(), isNull);
  });
}

GeneratedActivityHistoryRepository _repository(
  List<Map<String, String>> requests,
) {
  final dio = Dio();
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        expect(options.method, 'GET');
        expect(options.path, '/api/download-intents/history/records');
        requests.add(Map.of(options.uri.queryParameters));
        handler.resolve(
          Response<Map<String, Object?>>(
            requestOptions: options,
            statusCode: 200,
            data: {
              'code': 'ok',
              'message': 'ok',
              'data': {'items': <Object?>[], 'next_cursor': null},
            },
          ),
        );
      },
    ),
  );
  return GeneratedActivityHistoryRepository(
    AuthenticatedRequest(
      client: VideoServerApi(dio: dio),
      accessToken: () => 'test',
      sessionGeneration: () => 0,
      refreshSession: () async => false,
      expireSession: () async {},
    ),
  );
}
