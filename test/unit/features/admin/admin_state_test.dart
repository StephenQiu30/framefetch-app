import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/admin/application/admin_selection_controller.dart';
import 'package:framegrab/features/admin/application/ai_provider_protocol.dart';
import 'package:framegrab/features/admin/application/operation_log_query.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:framegrab/features/auth/data/refresh_credential_store.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/auth_fakes.dart';

void main() {
  test(
    'batch deletion removes successes and keeps only failed IDs for retry',
    () async {
      final container = await _adminContainer();
      addTearDown(container.dispose);
      final subscription = container.listen(
        adminUserSelectionProvider,
        (_, _) {},
      );
      addTearDown(subscription.close);
      final controller = container.read(adminUserSelectionProvider.notifier);
      controller.selectPage(['one', 'two', 'three'], true);
      final called = <String>[];
      await controller.deleteSelected((id) async {
        called.add(id);
        if (id == 'two') throw StateError('synthetic failure');
      });
      expect(called, ['one', 'two', 'three']);
      expect(container.read(adminUserSelectionProvider).selected, {'two'});
      expect(container.read(adminUserSelectionProvider).hasFailure, isTrue);
      await controller.deleteSelected((id) async {});
      expect(container.read(adminUserSelectionProvider).selected, isEmpty);
      expect(container.read(adminUserSelectionProvider).hasFailure, isFalse);
    },
  );

  test('pending deletion cannot repeat and selection remains frozen', () async {
    final container = await _adminContainer();
    addTearDown(container.dispose);
    final subscription = container.listen(
      adminFileSelectionProvider,
      (_, _) {},
    );
    addTearDown(subscription.close);
    final controller = container.read(adminFileSelectionProvider.notifier);
    controller.toggle('one', true);
    final pending = Completer<void>();
    var calls = 0;
    final request = controller.deleteSelected((_) {
      calls++;
      return pending.future;
    });
    controller.clear();
    controller.toggle('two', true);
    await controller.deleteSelected((_) async {
      calls++;
    });
    expect(calls, 1);
    expect(container.read(adminFileSelectionProvider).selected, {'one'});
    pending.complete();
    await request;
    expect(container.read(adminFileSelectionProvider).busy, isFalse);
  });

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

Future<ProviderContainer> _adminContainer() async {
  final container = ProviderContainer(
    overrides: [
      nativeAuthGatewayProvider.overrideWithValue(
        FakeAuthGateway(session: testSession(role: UserRole.admin)),
      ),
      refreshCredentialStoreProvider.overrideWithValue(
        MemoryCredentialStore('synthetic-refresh'),
      ),
    ],
  );
  await container.read(authSessionProvider.notifier).restore();
  return container;
}
