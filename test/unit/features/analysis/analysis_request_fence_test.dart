import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/analysis/application/analysis_controller.dart';
import 'package:framegrab/features/analysis/application/analysis_target.dart';
import 'package:framegrab/features/analysis/data/analysis_repository.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/analysis_fakes.dart';

const _target = AnalysisTarget.video('download-1');
final _provider = analysisControllerProvider(_target);

void main() {
  for (final kind in [
    DataRequestFailureKind.unavailable,
    DataRequestFailureKind.invalidResponse,
  ]) {
    test(
      '$kind create receipt blocks duplicate requests until reconciled',
      () async {
        final repository = FakeAnalysisRepository(
          createError: DataRequestFailure(kind),
        );
        final container = _container(repository);
        await container.read(_provider.future);
        final controller = container.read(_provider.notifier);
        await _start(controller);
        expect(container.read(_provider).value!.submissionUnknown, true);
        repository.createError = null;
        await _start(controller);
        await controller.refresh();
        await _start(controller);
        expect(repository.createKeys, hasLength(1));
        repository.latest = analysisJobFixture();
        await controller.refresh();
        expect(container.read(_provider).value!.submissionUnknown, false);
        await _start(controller);
        expect(repository.createKeys, hasLength(2));
        expect(repository.createKeys.toSet(), hasLength(1));
      },
    );
  }

  test(
    'unknown retry stays fenced until a newer acknowledged run is read',
    () async {
      final repository = FakeAnalysisRepository(latest: analysisJobFixture());
      final container = _container(repository);
      await container.read(_provider.future);
      final controller = container.read(_provider.notifier);
      repository.error = const DataRequestFailure(
        DataRequestFailureKind.unavailable,
      );
      await controller.retry();
      repository.error = null;
      await controller.refresh();
      await controller.retry();
      expect(repository.retryKeys, hasLength(1));
      expect(container.read(_provider).value!.submissionUnknown, true);
      repository.latest = analysisJobFixture(runNo: 2);
      await controller.refresh();
      expect(container.read(_provider).value!.submissionUnknown, false);
    },
  );

  test(
    'provider outcome unknown cannot start or retry another model run',
    () async {
      final repository = FakeAnalysisRepository(
        latest: analysisJobFixture(status: AnalysisStatus.failed).rebuild(
          (b) => b.errorCode = AnalysisErrorCode.analysisOutcomeUnknown,
        ),
      );
      final container = _container(repository);
      await container.read(_provider.future);
      final controller = container.read(_provider.notifier);
      await controller.retry();
      await _start(controller);
      expect(repository.retryKeys, isEmpty);
      expect(repository.createKeys, isEmpty);
    },
  );

  test('a known successful create allows a fresh explicit task key', () async {
    final repository = FakeAnalysisRepository(
      createResult: analysisJobFixture(),
    );
    final container = _container(repository);
    await container.read(_provider.future);
    final controller = container.read(_provider.notifier);
    await _start(controller);
    await _start(controller);
    expect(repository.createKeys, hasLength(2));
    expect(repository.createKeys.toSet(), hasLength(2));
  });
}

ProviderContainer _container(FakeAnalysisRepository repository) {
  final container = ProviderContainer(
    overrides: [analysisRepositoryProvider.overrideWithValue(repository)],
  );
  addTearDown(container.dispose);
  final subscription = container.listen(_provider, (_, _) {});
  addTearDown(subscription.close);
  return container;
}

Future<void> _start(AnalysisController controller) => controller.start(
  customPrompt: '关注镜头与叙事',
  outputLanguage: 'zh-CN',
  skillId: 'director-breakdown',
);
