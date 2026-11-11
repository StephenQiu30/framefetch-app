import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/features/admin/application/admin_providers.dart';
import 'package:framefetch/features/admin/presentation/admin_ai_providers_screen.dart';
import 'package:framefetch/features/auth/application/auth_session_controller.dart';
import 'package:framefetch/features/auth/data/native_auth_gateway.dart';
import 'package:framefetch/features/auth/data/refresh_credential_store.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

import '../../../support/auth_fakes.dart';
import '../../../support/shad_test_app.dart';

AiProviderProfileListResponse
_threeServicesFixture() => AiProviderProfileListResponse(
  (b) => b
    ..agentAvailable = true
    ..items.replace([
      AiProviderProfileResponse(
        (v) => v
          ..engine = AiProviderEngine.volcengine
          ..displayName = '火山引擎方舟'
          ..credentialConfigured = false
          ..isActive = false
          ..presetId = 'volcengine-ark-v3'
          ..baseUrl = 'https://ark.cn-beijing.volces.com/api/v3'
          ..model = 'doubao-seed-2-0-lite'
          ..supportsVision = true
          ..supportsModelsEndpoint = true
          ..structuredOutputMode =
              AiProviderProfileResponseStructuredOutputModeEnum.jsonSchema
          ..presets.replace([
            AiProviderPresetResponse(
              (p) => p
                ..id = 'volcengine-ark-v3'
                ..engine = AiProviderEngine.volcengine
                ..displayName = '按量付费 V3'
                ..baseUrl = 'https://ark.cn-beijing.volces.com/api/v3'
                ..defaultModel = 'doubao-seed-2-0-lite'
                ..suggestedModels.replace([
                  AiProviderSuggestedModelResponse(
                    (m) => m
                      ..id = 'doubao-seed-2-0-lite'
                      ..label = 'Doubao Seed 2.0 Lite'
                      ..supportsVision = true,
                  ),
                ])
                ..supportsVision = true
                ..supportsModelsEndpoint = true
                ..structuredOutputMode =
                    AiProviderPresetResponseStructuredOutputModeEnum.jsonSchema
                ..endpointKind = 'payg'
                ..supportsCustomModelId = true
                ..keyIsolationNotice = '仅使用方舟按量 API Key。',
            ),
            AiProviderPresetResponse(
              (p) => p
                ..id = 'volcengine-coding-v3'
                ..engine = AiProviderEngine.volcengine
                ..displayName = 'Coding Plan V3'
                ..baseUrl = 'https://ark.cn-beijing.volces.com/api/coding/v3'
                ..defaultModel = 'ark-code-latest'
                ..suggestedModels.replace([
                  AiProviderSuggestedModelResponse(
                    (m) => m
                      ..id = 'ark-code-latest'
                      ..label = 'Ark Code Latest'
                      ..supportsVision = false,
                  ),
                ])
                ..supportsVision = false
                ..supportsModelsEndpoint = false
                ..structuredOutputMode =
                    AiProviderPresetResponseStructuredOutputModeEnum.jsonSchema
                ..endpointKind = 'coding_plan'
                ..supportsCustomModelId = true
                ..keyIsolationNotice = '仅使用 Coding Plan 专属 API Key。',
            ),
          ]),
      ),
      AiProviderProfileResponse(
        (d) => d
          ..engine = AiProviderEngine.deepseek
          ..displayName = 'DeepSeek'
          ..credentialConfigured = true
          ..isActive = false
          ..presetId = 'deepseek-official'
          ..baseUrl = 'https://api.deepseek.com'
          ..model = 'deepseek-chat'
          ..supportsVision = false
          ..supportsModelsEndpoint = true
          ..structuredOutputMode =
              AiProviderProfileResponseStructuredOutputModeEnum.jsonObject
          ..presets.replace([
            AiProviderPresetResponse(
              (p) => p
                ..id = 'deepseek-official'
                ..engine = AiProviderEngine.deepseek
                ..displayName = '官方直连'
                ..baseUrl = 'https://api.deepseek.com'
                ..defaultModel = 'deepseek-chat'
                ..supportsVision = false
                ..supportsModelsEndpoint = true
                ..structuredOutputMode =
                    AiProviderPresetResponseStructuredOutputModeEnum.jsonObject
                ..endpointKind = 'official'
                ..supportsCustomModelId = false
                ..keyIsolationNotice = '仅支持文本文档类 Skill。',
            ),
          ]),
      ),
    ]),
);

void main() {
  testWidgets(
    'AdminAiProvidersScreen activates configured services and tests built-in presets',
    (tester) async {
      final client = FramefetchServerApi();
      addTearDown(client.dio.close);
      final requests = <RequestOptions>[];
      client.dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (request, handler) {
            requests.add(request);
            if (request.path == '/api/admin/ai-providers/test') {
              handler.resolve(
                Response(
                  requestOptions: request,
                  statusCode: 200,
                  data: {
                    'code': 'ok',
                    'message': 'ok',
                    'data': {
                      'ok': true,
                      'status': 'ok',
                      'http_status': 200,
                      'preset_id': 'volcengine-ark-v3',
                      'supports_vision': true,
                      'structured_output_mode': 'json_schema',
                      'models_endpoint_supported': true,
                      'chat_endpoint_reachable': true,
                      'discovered_models': ['doubao-seed-2-0-lite'],
                      'latency_ms': 42,
                      'vision_notice': '支持多模态视频帧分析',
                      'capability_notice': '支持严格 JSON Schema',
                      'message': '官方连通测试通过',
                    },
                  },
                ),
              );
              return;
            }
            handler.resolve(
              Response(
                requestOptions: request,
                statusCode: 200,
                data: <String, Object?>{},
              ),
            );
          },
        ),
      );
      final container = ProviderContainer(
        overrides: [
          framefetchServerApiProvider.overrideWithValue(client),
          nativeAuthGatewayProvider.overrideWithValue(
            FakeAuthGateway(session: testSession(role: UserRole.admin)),
          ),
          refreshCredentialStoreProvider.overrideWithValue(
            MemoryCredentialStore('synthetic-refresh'),
          ),
          adminAiProvidersProvider.overrideWith(
            (ref) async => _threeServicesFixture(),
          ),
        ],
      );
      addTearDown(container.dispose);
      await container.read(authSessionProvider.notifier).restore();

      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = const Size(390, 844);
      addTearDown(tester.view.reset);

      await pumpShadWidget(
        tester,
        UncontrolledProviderScope(
          container: container,
          child: ShadTestApp(
            locale: const Locale('zh'),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const AdminAiProvidersScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('容器化分析 Worker 在线。'), findsOneWidget);
      await tester.tap(find.text('设为当前'));
      await tester.pumpAndSettle();
      expect(
        requests.map((r) => '${r.method} ${r.path}'),
        contains('POST /api/admin/ai-providers/deepseek/activate'),
      );

      final editButton = find.descendant(
        of: find.byKey(const ValueKey('ai-volcengine')),
        matching: find.text('编辑'),
      );
      await tester.tap(editButton);
      await tester.pumpAndSettle();
      expect(find.text('仅使用方舟按量 API Key。'), findsOneWidget);

      final testButton = find.text('测试连接');
      await Scrollable.ensureVisible(
        tester.element(testButton),
        alignment: 0.5,
      );
      await tester.pumpAndSettle();
      await tester.tap(testButton);
      await tester.pumpAndSettle();

      expect(
        requests.map((r) => '${r.method} ${r.path}'),
        contains('POST /api/admin/ai-providers/test'),
      );
      expect(find.textContaining('官方连通测试通过'), findsOneWidget);
      expect(find.textContaining('耗时 42 ms'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );
}
