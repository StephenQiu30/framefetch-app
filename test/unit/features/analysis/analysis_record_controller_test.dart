import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/analysis/application/analysis_controller.dart';
import 'package:framegrab/features/analysis/application/analysis_target.dart';
import 'package:framegrab/features/analysis/data/analysis_repository.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/analysis_fakes.dart';

void main() {
  test(
    'history detail reads and refreshes the chosen analysis instead of latest source result',
    () async {
      final repository = FakeAnalysisRepository(
        latest: analysisJobFixture(status: AnalysisStatus.succeeded),
      );
      final container = ProviderContainer(
        overrides: [analysisRepositoryProvider.overrideWithValue(repository)],
      );
      addTearDown(container.dispose);
      final target = AnalysisTarget.record(
        'older-analysis',
        inputKind: AnalysisInputKind.video,
      );
      container.listen(analysisControllerProvider(target), (_, _) {});
      await container.read(analysisControllerProvider(target).future);
      await container
          .read(analysisControllerProvider(target).notifier)
          .refresh();
      expect(repository.latestCalls, 0);
      expect(repository.fetchCalls, 2);
      await container
          .read(analysisControllerProvider(target).notifier)
          .delete();
      expect(
        container.read(analysisControllerProvider(target)).value?.job,
        isNull,
      );
      expect(repository.skillInputKinds, isEmpty);
    },
  );
}
