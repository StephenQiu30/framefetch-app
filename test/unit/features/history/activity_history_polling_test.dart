import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/features/history/application/activity_history_lifecycle.dart';
import 'package:framefetch/features/history/application/activity_history_provider.dart';
import 'package:framefetch/features/history/application/activity_history_query.dart';
import 'package:framefetch/features/history/data/activity_history_repository.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';
import 'package:one_of/one_of.dart';

import '../../../support/workspace_parity_fixtures.dart';

void main() {
  testWidgets(
    'processing history refreshes and terminal records stop polling',
    (tester) async {
      final repository = _Repository();
      final container = _container(repository);
      addTearDown(container.dispose);
      final subscription = container.listen(
        activityHistoryProvider(const ActivityHistoryQuery()),
        (_, _) {},
      );
      addTearDown(subscription.close);
      await tester.pump();
      expect(repository.queries, hasLength(1));
      repository.processing = false;
      await tester.pump(const Duration(seconds: 3));
      await tester.pump();
      expect(repository.queries, hasLength(2));
      final result = container.read(
        activityHistoryProvider(const ActivityHistoryQuery()),
      );
      expect(
        (result.requireValue.items.first.oneOf.value
                as ParseHistoryRecordResponse)
            .status,
        IntentStatus.ready,
      );
      await tester.pump(const Duration(seconds: 9));
      expect(repository.queries, hasLength(2));
    },
  );

  testWidgets('changing filters disposes the previous polling scope', (
    tester,
  ) async {
    final repository = _Repository();
    final container = _container(repository);
    addTearDown(container.dispose);
    final previous = container.listen(
      activityHistoryProvider(const ActivityHistoryQuery()),
      (_, _) {},
    );
    await tester.pump();
    previous.close();
    final next = container.listen(
      activityHistoryProvider(const ActivityHistoryQuery(search: 'filtered')),
      (_, _) {},
    );
    addTearDown(next.close);
    await tester.pump();
    await tester.pump(const Duration(seconds: 9));
    expect(repository.queries.map((query) => query.search), ['', 'filtered']);
  });

  testWidgets('unmounting history cancels its pending poll', (tester) async {
    final repository = _Repository();
    final container = _container(repository);
    addTearDown(container.dispose);
    final subscription = container.listen(
      activityHistoryProvider(const ActivityHistoryQuery()),
      (_, _) {},
    );
    await tester.pump();
    subscription.close();
    await tester.pump();
    await tester.pump(const Duration(seconds: 9));
    expect(repository.queries, hasLength(1));
  });

  testWidgets('history pauses in the background and refreshes on resume', (
    tester,
  ) async {
    addTearDown(
      () => tester.binding.handleAppLifecycleStateChanged(
        AppLifecycleState.resumed,
      ),
    );
    final repository = _Repository();
    final container = _container(repository);
    addTearDown(container.dispose);
    final subscription = container.listen(
      activityHistoryProvider(const ActivityHistoryQuery()),
      (_, _) {},
    );
    addTearDown(subscription.close);
    await tester.pump();
    expect(repository.queries, hasLength(1));
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
    expect(container.read(activityHistoryForegroundProvider), false);
    await tester.pump(const Duration(seconds: 9));
    expect(repository.queries, hasLength(1));
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    expect(container.read(activityHistoryForegroundProvider), true);
    // Standalone ProviderContainer refreshes use a zero-duration event timer;
    // a frame-only pump flushes microtasks without dispatching that event.
    await tester.pump(Duration.zero);
    expect(repository.queries, hasLength(2));
    repository.processing = false;
    await tester.pump(const Duration(seconds: 3));
    await tester.pump();
    expect(repository.queries, hasLength(3));
    await tester.pump(const Duration(seconds: 9));
    expect(repository.queries, hasLength(3));
  });
}

ProviderContainer _container(_Repository repository) => ProviderContainer(
  overrides: [activityHistoryRepositoryProvider.overrideWithValue(repository)],
);

final class _Repository implements ActivityHistoryRepository {
  final queries = <ActivityHistoryQuery>[];
  bool processing = true;

  @override
  Future<HistoryRecordPageResponse> fetch(ActivityHistoryQuery query) async {
    queries.add(query);
    final active = processing && query.search.isEmpty;
    final record = parseHistoryFixture().rebuild(
      (b) => b
        ..status = active ? IntentStatus.resolving : IntentStatus.ready
        ..statusGroup = active
            ? HistoryStatusGroup.processing
            : HistoryStatusGroup.completed,
    );
    return HistoryRecordPageResponse(
      (b) => b
        ..items.add(
          ItemsInner(
            (i) => i
              ..oneOf = OneOfDynamic(
                typeIndex: 1,
                types: const [
                  DocumentParseHistoryRecordResponse,
                  ParseHistoryRecordResponse,
                  ScreenplayAnalysisHistoryRecordResponse,
                  VideoAnalysisHistoryRecordResponse,
                ],
                value: record,
              ),
          ),
        ),
    );
  }
}
