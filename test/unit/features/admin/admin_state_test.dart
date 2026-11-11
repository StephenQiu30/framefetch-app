import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/features/admin/application/ai_provider_protocol.dart';
import 'package:framefetch/features/admin/application/operation_log_query.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

void main() {
  test(
    'date ranges reject rollover and include the entire selected end minute',
    () {
      expect(parseOperationLogTime('2026-02-30 10:00'), isNull);
      expect(parseOperationLogTime('2026-10-01 25:00'), isNull);
      expect(parseOperationLogTime('2026-10-01 08:00'), isNotNull);
      final query = OperationLogQuery(
        from: '2026-10-01 08:00',
        to: '2026-10-01 08:00',
      );
      expect(query.hasValidDates, isTrue);
      expect(
        query.createdTo!.difference(query.createdFrom!),
        const Duration(milliseconds: 59999),
      );
      expect(
        const OperationLogQuery(
          from: '2026-10-02 08:00',
          to: '2026-10-01 08:00',
        ).hasValidDates,
        isFalse,
      );
    },
  );

  test('recognizes official engines, default URLs, and preset matching', () {
    for (final engine in [
      AiProviderEngine.volcengine,
      AiProviderEngine.deepseek,
      AiProviderEngine.openai,
    ]) {
      expect(isDirectAiEngine(engine), isTrue);
    }
    expect(isDirectAiEngine(AiProviderEngine.unknownDefaultOpenApi), isFalse);
    expect(
      aiProviderBaseUrl(AiProviderEngine.volcengine),
      'https://ark.cn-beijing.volces.com/api/v3',
    );
    expect(
      aiProviderBaseUrl(AiProviderEngine.deepseek),
      'https://api.deepseek.com',
    );
    expect(
      aiProviderBaseUrl(AiProviderEngine.openai),
      'https://api.openai.com/v1',
    );
    final payg = AiProviderPresetResponse(
      (b) => b
        ..id = 'volcengine-ark-v3'
        ..engine = AiProviderEngine.volcengine
        ..displayName = '按量付费 V3'
        ..baseUrl = 'https://ark.cn-beijing.volces.com/api/v3'
        ..defaultModel = 'doubao-seed-2-0-lite'
        ..supportsVision = true
        ..supportsModelsEndpoint = true
        ..structuredOutputMode =
            AiProviderPresetResponseStructuredOutputModeEnum.jsonSchema
        ..endpointKind = 'payg'
        ..supportsCustomModelId = true
        ..keyIsolationNotice = '按量 Key 专属',
    );
    final coding = AiProviderPresetResponse(
      (b) => b
        ..id = 'volcengine-coding-v3'
        ..engine = AiProviderEngine.volcengine
        ..displayName = 'Coding Plan V3'
        ..baseUrl = 'https://ark.cn-beijing.volces.com/api/coding/v3'
        ..defaultModel = 'ark-code-latest'
        ..supportsVision = false
        ..supportsModelsEndpoint = false
        ..structuredOutputMode =
            AiProviderPresetResponseStructuredOutputModeEnum.jsonSchema
        ..endpointKind = 'coding_plan'
        ..supportsCustomModelId = true
        ..keyIsolationNotice = 'Coding Plan Key 专属',
    );
    expect(
      matchAiProviderPreset(
        [payg, coding],
        AiProviderEngine.volcengine,
        'https://ark.cn-beijing.volces.com/api/coding/v3/',
      )?.id,
      'volcengine-coding-v3',
    );
    expect(
      matchAiProviderPreset(
        [payg, coding],
        AiProviderEngine.volcengine,
        '',
      )?.id,
      'volcengine-ark-v3',
    );
  });
}
