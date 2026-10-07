import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/core/network/data_request_failure.dart';
import 'package:framefetch/features/auth/application/auth_session_controller.dart';
import 'package:framefetch/features/auth/data/native_auth_gateway.dart';
import 'package:framefetch/features/auth/data/refresh_credential_store.dart';
import 'package:framefetch/features/download/application/download_intake_controller.dart';
import 'package:framefetch/features/download/data/download_intake_repository.dart';
import 'package:framefetch/features/download/data/download_intent_repository.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

import '../../../support/auth_fakes.dart';
import '../../../support/intake_fakes.dart';

void main() {
  test('does not refresh a cancelled intent', () async {
    final container = _container(FakeDownloadIntakeRepository());
    addTearDown(container.dispose);
    final intents =
        container.read(downloadIntentRepositoryProvider)
            as FakeDownloadIntentRepository;
    intents.status = IntentStatus.cancelled;
    final controller = container.read(
      downloadIntakeControllerProvider.notifier,
    );
    await controller.inspect('https://media.example/cancelled');
    await controller.refreshIntent();
    expect(intents.refreshCount, 0);
    expect(
      container.read(downloadIntakeControllerProvider).intent?.status,
      IntentStatus.cancelled,
    );
  });

  testWidgets('waits for cancellation confirmation without new work', (
    tester,
  ) async {
    final container = _container(FakeDownloadIntakeRepository());
    addTearDown(container.dispose);
    final intents =
        container.read(downloadIntentRepositoryProvider)
            as FakeDownloadIntentRepository;
    intents.status = IntentStatus.cancelling;
    final controller = container.read(
      downloadIntakeControllerProvider.notifier,
    );
    await controller.inspect('https://media.example/cancelling');
    expect(container.read(downloadIntakeControllerProvider).cancelling, isTrue);
    await controller.inspect('https://media.example/replacement');
    await controller.refreshIntent();
    await controller.cancelIntent();
    controller.clearResult();
    expect(intents.inputs, hasLength(1));
    expect(intents.refreshCount, 0);
    expect(intents.cancelCount, 0);
    intents.status = IntentStatus.cancelled;
    await tester.pump(const Duration(seconds: 2));
    expect(
      container.read(downloadIntakeControllerProvider).intent?.status,
      IntentStatus.cancelled,
    );
    expect(
      container.read(downloadIntakeControllerProvider).cancelling,
      isFalse,
    );
  });

  testWidgets('reconciles a terminal write after the deadline using only GET', (
    tester,
  ) async {
    final container = _container(FakeDownloadIntakeRepository());
    addTearDown(container.dispose);
    final intents =
        container.read(downloadIntentRepositoryProvider)
            as FakeDownloadIntentRepository;
    final overdue = intentFixture(
      status: IntentStatus.resolving,
    ).rebuild((b) => b..deadline = DateTime.utc(2020));
    intents.pendingCreate = Future.value(overdue);
    final controller = container.read(
      downloadIntakeControllerProvider.notifier,
    );
    await controller.inspect('https://media.example/delayed-terminal');
    intents.status = IntentStatus.expired;
    await tester.pump(const Duration(seconds: 5));
    expect(
      container.read(downloadIntakeControllerProvider).intent?.status,
      IntentStatus.expired,
    );
    await tester.pump(const Duration(seconds: 10));
    expect(intents.inputs, hasLength(1));
    expect(intents.reads, [overdue.id]);
    expect(intents.refreshCount, 0);
  });

  testWidgets(
    'recovers a temporary GET error without a replacement admission',
    (tester) async {
      final container = _container(FakeDownloadIntakeRepository());
      addTearDown(container.dispose);
      final intents =
          container.read(downloadIntentRepositoryProvider)
              as FakeDownloadIntentRepository;
      intents.status = IntentStatus.resolving;
      final controller = container.read(
        downloadIntakeControllerProvider.notifier,
      );
      await controller.inspect('https://media.example/transient-read');
      intents.getError = const DataRequestFailure(
        DataRequestFailureKind.unavailable,
        statusCode: 503,
      );
      await tester.pump(const Duration(seconds: 2));
      intents.getError = null;
      intents.status = IntentStatus.cancelled;
      await tester.pump(const Duration(seconds: 5));
      expect(
        container.read(downloadIntakeControllerProvider).intent?.status,
        IntentStatus.cancelled,
      );
      await tester.pump(const Duration(seconds: 10));
      expect(intents.inputs, hasLength(1));
      expect(intents.reads, [intentFixture().id, intentFixture().id]);
      expect(intents.refreshCount, 0);
    },
  );

  test('inspects a public URL and selects the first real format', () async {
    final repository = FakeDownloadIntakeRepository();
    final container = _container(repository);
    addTearDown(container.dispose);

    await container
        .read(downloadIntakeControllerProvider.notifier)
        .inspect('https://media.example/video');
    final state = container.read(downloadIntakeControllerProvider);

    final intents =
        container.read(downloadIntentRepositoryProvider)
            as FakeDownloadIntentRepository;
    expect(intents.inputs, ['https://media.example/video']);
    expect(state.inspection?.title, '真实解析视频');
    expect(state.selectedFormatId, state.inspection?.formats.first.id);
    expect(state.error, isNull);
  });

  test('discovers a WeChat article and inspects the selected item', () async {
    final repository = FakeDownloadIntakeRepository();
    final container = _container(repository);
    addTearDown(container.dispose);
    final controller = container.read(
      downloadIntakeControllerProvider.notifier,
    );

    await controller.inspect('https://mp.weixin.qq.com/s/article');
    expect(repository.discoveryUrls, ['https://mp.weixin.qq.com/s/article']);
    expect(
      container.read(downloadIntakeControllerProvider).discovery,
      isNotNull,
    );

    await controller.inspectItem('00000000-0000-0000-0000-000000000312');
    expect(repository.selectedItems, ['00000000-0000-0000-0000-000000000312']);
    expect(
      container.read(downloadIntakeControllerProvider).inspection,
      isNotNull,
    );
  });

  test('creates a download with the selected format', () async {
    final repository = FakeDownloadIntakeRepository();
    final container = _container(repository);
    addTearDown(container.dispose);
    final controller = container.read(
      downloadIntakeControllerProvider.notifier,
    );
    await controller.inspect('https://media.example/video');
    controller.selectFormat('00000000-0000-0000-0000-000000000303');

    final job = await controller.createDownload();

    expect(job?.status, DownloadStatus.queued);
    expect(repository.createdFormats, ['00000000-0000-0000-0000-000000000303']);
    expect(repository.idempotencyKeys.every((key) => key.isNotEmpty), isTrue);
  });

  test('never creates a task for a non-downloadable decision', () async {
    final repository = FakeDownloadIntakeRepository(
      inspection: inspectionFixture(decision: AccessDecision.blocked),
    );
    final container = _container(repository);
    addTearDown(container.dispose);
    final controller = container.read(
      downloadIntakeControllerProvider.notifier,
    );
    await controller.inspect('https://media.example/restricted');

    final job = await controller.createDownload();

    expect(job, isNull);
    expect(repository.createdFormats, isEmpty);
  });

  test('recovers a lost admission response through read-only lookup', () async {
    final intake = FakeDownloadIntakeRepository();
    final container = _container(intake);
    addTearDown(container.dispose);
    final intents =
        container.read(downloadIntentRepositoryProvider)
            as FakeDownloadIntentRepository;
    intents.createError = const DataRequestFailure(
      DataRequestFailureKind.unavailable,
    );

    await container
        .read(downloadIntakeControllerProvider.notifier)
        .inspect('https://media.example/lost-response');

    expect(intents.inputs, hasLength(1));
    expect(intents.reads, ['key:${intents.keys.single}']);
    expect(
      container.read(downloadIntakeControllerProvider).intent?.status,
      IntentStatus.ready,
    );
  });

  test(
    '404 after a lost admission permits an explicit retry with the same key',
    () async {
      final intake = FakeDownloadIntakeRepository();
      final container = _container(intake);
      addTearDown(container.dispose);
      final intents =
          container.read(downloadIntentRepositoryProvider)
              as FakeDownloadIntentRepository;
      intents.createError = const DataRequestFailure(
        DataRequestFailureKind.unavailable,
      );
      intents.findError = const DataRequestFailure(
        DataRequestFailureKind.unknown,
        statusCode: 404,
      );
      final controller = container.read(
        downloadIntakeControllerProvider.notifier,
      );

      await controller.inspect('https://media.example/retry');
      expect(intents.inputs, hasLength(1));
      intents.createError = null;
      await controller.inspect('https://media.example/retry');

      expect(intents.inputs, hasLength(2));
      expect(intents.keys[1], intents.keys[0]);
      expect(
        container.read(downloadIntakeControllerProvider).intent?.status,
        IntentStatus.ready,
      );
    },
  );

  test(
    'resumes an existing intent by GET and observes readiness without POST',
    () async {
      final container = _container(FakeDownloadIntakeRepository());
      addTearDown(container.dispose);
      await _signIn(container, '00000000-0000-0000-0000-000000000001');
      final intents =
          container.read(downloadIntentRepositoryProvider)
              as FakeDownloadIntentRepository;
      intents.status = IntentStatus.queued;
      final controller = container.read(
        downloadIntakeControllerProvider.notifier,
      );

      await controller.resume('00000000-0000-4000-8000-000000000301');
      expect(
        container.read(downloadIntakeControllerProvider).intent?.status,
        IntentStatus.queued,
      );
      intents.status = IntentStatus.ready;
      await controller.pollIntent();

      expect(intents.inputs, isEmpty);
      expect(intents.reads, hasLength(2));
      expect(
        container.read(downloadIntakeControllerProvider).inspection,
        isNotNull,
      );
    },
  );

  test('drops a previous account admission after identity changes', () async {
    final container = _container(FakeDownloadIntakeRepository());
    addTearDown(container.dispose);
    await _signIn(container, '00000000-0000-0000-0000-000000000001');
    final intents =
        container.read(downloadIntentRepositoryProvider)
            as FakeDownloadIntentRepository;
    final pending = Completer<IntentResponse>();
    intents.pendingCreate = pending.future;
    final controller = container.read(
      downloadIntakeControllerProvider.notifier,
    );

    final operation = controller.inspect('https://media.example/account-a');
    await container.read(authSessionProvider.notifier).logout();
    await _signIn(container, '00000000-0000-0000-0000-000000000002');
    pending.complete(intentFixture());
    await operation;

    expect(container.read(downloadIntakeControllerProvider).intent, isNull);
    expect(container.read(downloadIntakeControllerProvider).inspection, isNull);
  });

  test(
    'an expired result refreshes the intent without creating a task',
    () async {
      final intake = FakeDownloadIntakeRepository();
      final container = _container(intake);
      addTearDown(container.dispose);
      final intents =
          container.read(downloadIntentRepositoryProvider)
              as FakeDownloadIntentRepository;
      final controller = container.read(
        downloadIntakeControllerProvider.notifier,
      );
      intake.inspection = intake.inspection.rebuild(
        (builder) => builder..expiresAt = DateTime.utc(2020),
      );
      await controller.inspect('https://media.example/expired');

      final job = await controller.createDownload();

      expect(job, isNull);
      expect(intake.createdFormats, isEmpty);
      expect(intents.refreshCount, 1);
    },
  );

  test(
    'a later 404 on an uncertain key admits on that explicit retry',
    () async {
      final container = _container(FakeDownloadIntakeRepository());
      addTearDown(container.dispose);
      final intents =
          container.read(downloadIntentRepositoryProvider)
              as FakeDownloadIntentRepository;
      intents.createError = const DataRequestFailure(
        DataRequestFailureKind.unavailable,
      );
      intents.findError = const DataRequestFailure(
        DataRequestFailureKind.unavailable,
      );
      final controller = container.read(
        downloadIntakeControllerProvider.notifier,
      );

      await controller.inspect('https://media.example/uncertain');
      expect(intents.inputs, hasLength(1));
      intents.createError = null;
      intents.findError = const DataRequestFailure(
        DataRequestFailureKind.unknown,
        statusCode: 404,
      );
      await controller.inspect('https://media.example/uncertain');

      expect(intents.inputs, hasLength(2));
      expect(intents.keys[0], intents.keys[1]);
      expect(
        container.read(downloadIntakeControllerProvider).intent,
        isNotNull,
      );
    },
  );

  test(
    'a ready inspection read can be retried without a new admission',
    () async {
      final container = _container(FakeDownloadIntakeRepository());
      addTearDown(container.dispose);
      await _signIn(container, '00000000-0000-0000-0000-000000000001');
      final intents =
          container.read(downloadIntentRepositoryProvider)
              as FakeDownloadIntentRepository;
      intents.inspectionError = const DataRequestFailure(
        DataRequestFailureKind.unavailable,
      );
      final controller = container.read(
        downloadIntakeControllerProvider.notifier,
      );

      await controller.inspect('https://media.example/read-error');
      expect(
        container.read(downloadIntakeControllerProvider).inspection,
        isNull,
      );
      intents.inspectionError = null;
      await controller.resume(intentFixture().id);

      expect(intents.inputs, hasLength(1));
      expect(
        container.read(downloadIntakeControllerProvider).inspection,
        isNotNull,
      );
    },
  );

  test('a failed refresh keeps the prior result and visible error', () async {
    final container = _container(FakeDownloadIntakeRepository());
    addTearDown(container.dispose);
    final intents =
        container.read(downloadIntentRepositoryProvider)
            as FakeDownloadIntentRepository;
    final controller = container.read(
      downloadIntakeControllerProvider.notifier,
    );
    await controller.inspect('https://media.example/refresh');
    intents.refreshError = const DataRequestFailure(
      DataRequestFailureKind.rateLimited,
      statusCode: 429,
    );

    await controller.refreshIntent();

    final state = container.read(downloadIntakeControllerProvider);
    expect(state.error, isA<DataRequestFailure>());
    expect(state.inspection, isNotNull);
    expect(state.intent?.version, 2);
  });

  test('an ambiguous refresh with unchanged GET retains its failure', () async {
    final container = _container(FakeDownloadIntakeRepository());
    addTearDown(container.dispose);
    final intents =
        container.read(downloadIntentRepositoryProvider)
            as FakeDownloadIntentRepository;
    final controller = container.read(
      downloadIntakeControllerProvider.notifier,
    );
    await controller.inspect('https://media.example/refresh-unknown');
    intents.refreshError = const DataRequestFailure(
      DataRequestFailureKind.unavailable,
    );

    await controller.refreshIntent();

    final state = container.read(downloadIntakeControllerProvider);
    expect(state.error, isA<DataRequestFailure>());
    expect(state.intent?.version, 2);
    expect(state.inspection, isNotNull);
    expect(intents.refreshCount, 1);
  });

  test('an uncertain cancel recovers through GET and keeps polling', () async {
    final container = _container(FakeDownloadIntakeRepository());
    addTearDown(container.dispose);
    final intents =
        container.read(downloadIntentRepositoryProvider)
            as FakeDownloadIntentRepository;
    intents.status = IntentStatus.queued;
    final controller = container.read(
      downloadIntakeControllerProvider.notifier,
    );
    await controller.inspect('https://media.example/cancel');
    intents.cancelError = const DataRequestFailure(
      DataRequestFailureKind.unavailable,
    );
    intents.getError = const DataRequestFailure(
      DataRequestFailureKind.unavailable,
    );

    await controller.cancelIntent();
    expect(intents.cancelCount, 1);
    intents.getError = null;
    intents.status = IntentStatus.cancelled;
    await controller.pollIntent();

    expect(intents.cancelCount, 1);
    expect(
      container.read(downloadIntakeControllerProvider).intent?.status,
      IntentStatus.cancelled,
    );
  });

  test('an old in-flight poll cannot block a new intent generation', () async {
    final container = _container(FakeDownloadIntakeRepository());
    addTearDown(container.dispose);
    final intents =
        container.read(downloadIntentRepositoryProvider)
            as FakeDownloadIntentRepository;
    intents.status = IntentStatus.queued;
    final controller = container.read(
      downloadIntakeControllerProvider.notifier,
    );
    await controller.inspect('https://media.example/old');
    final pending = Completer<IntentResponse>();
    intents.pendingGet = pending.future;
    final oldPoll = controller.pollIntent();

    await controller.inspect('https://media.example/new');
    intents.pendingGet = null;
    intents.status = IntentStatus.ready;
    await controller.pollIntent();
    expect(
      container.read(downloadIntakeControllerProvider).intent?.status,
      IntentStatus.ready,
    );

    pending.complete(intentFixture(status: IntentStatus.failed, version: 3));
    await oldPoll;
    expect(
      container.read(downloadIntakeControllerProvider).intent?.status,
      IntentStatus.ready,
    );
  });
}

ProviderContainer _container(
  DownloadIntakeRepository repository,
) => ProviderContainer(
  overrides: [
    downloadIntakeRepositoryProvider.overrideWithValue(repository),
    downloadIntentRepositoryProvider.overrideWithValue(
      FakeDownloadIntentRepository(repository as FakeDownloadIntakeRepository),
    ),
    nativeAuthGatewayProvider.overrideWithValue(FakeAuthGateway()),
    refreshCredentialStoreProvider.overrideWithValue(MemoryCredentialStore()),
  ],
);

Future<void> _signIn(ProviderContainer container, String userId) async {
  final gateway = container.read(nativeAuthGatewayProvider) as FakeAuthGateway;
  gateway.session = testSession(userId: userId);
  final auth = container.read(authSessionProvider.notifier);
  if (container.read(authSessionProvider).phase == AuthSessionPhase.restoring) {
    await auth.restore();
  }
  expect(
    await auth.login(email: 'member@example.com', password: 'password'),
    isTrue,
  );
}
