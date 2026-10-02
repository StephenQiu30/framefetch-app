import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/admin/application/ai_provider_protocol.dart';
import 'package:framegrab/features/admin/application/operation_log_query.dart';
import 'package:video_server_api/video_server_api.dart';

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

  test(
    'direct engines require API key and validate HTTPS or explicit loopback',
    () {
      for (final engine in [
        AiProviderEngine.openai,
        AiProviderEngine.openrouter,
        AiProviderEngine.deepseek,
      ]) {
        expect(isDirectAiEngine(engine), isTrue);
      }
      expect(isDirectAiEngine(AiProviderEngine.codex), isFalse);
      expect(isValidAiBaseUrl('http://localhost:8080/v1'), isTrue);
      expect(isValidAiBaseUrl('https://api.example.com/v1'), isTrue);
      expect(isValidAiBaseUrl('http://api.example.com/v1'), isFalse);
      expect(
        isValidAiBaseUrl('https://key:secret@api.example.com/v1'),
        isFalse,
      );
      expect(
        isValidAiBaseUrl('https://api.example.com/v1?key=secret'),
        isFalse,
      );
      expect(isValidAiBaseUrl('https://api.example.com/v1#fragment'), isFalse);
      expect(
        aiProviderBaseUrl(AiProviderEngine.openrouter),
        'https://openrouter.ai/api/v1',
      );
    },
  );
}
