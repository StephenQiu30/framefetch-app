import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/features/analysis/data/analysis_history_repository.dart';
import 'package:framefetch/features/analysis/presentation/analysis_run_history.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch/shared/presentation/cursor_pagination.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

import '../../../support/shad_test_app.dart';

void main() {
  for (final terminal in [AnalysisStatus.succeeded, AnalysisStatus.cancelled]) {
    testWidgets(
      'refreshes $terminal run after active ends with the same runNo',
      (tester) async {
        final active = ValueNotifier(true);
        addTearDown(active.dispose);
        final repository = _Repository();
        await pumpShadWidget(
          tester,
          ProviderScope(
            overrides: [
              analysisHistoryRepositoryProvider.overrideWithValue(repository),
            ],
            child: ShadTestApp(
              locale: const Locale('zh'),
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              home: Scaffold(
                body: ValueListenableBuilder<bool>(
                  valueListenable: active,
                  builder: (context, value, _) => AnalysisRunHistory(
                    analysisId: 'same-analysis',
                    runNo: 1,
                    active: value,
                  ),
                ),
              ),
            ),
          ),
        );
        await tester.pump();
        expect(repository.reads, 1);
        repository.status = terminal;
        active.value = false;
        await tester.pumpAndSettle();
        expect(repository.reads, 2);
        expect(find.textContaining('第 1 次执行'), findsOneWidget);
        expect(
          find.textContaining(
            terminal == AnalysisStatus.succeeded ? '分析已完成' : '分析已取消',
          ),
          findsOneWidget,
        );
        await tester.pump(const Duration(seconds: 9));
        expect(repository.reads, 2);
        expect(tester.takeException(), isNull);
      },
    );
  }
  for (final change in ['runNo', 'analysisId']) {
    testWidgets('changing $change resets a second-page cursor', (tester) async {
      final target = ValueNotifier((id: 'same-analysis', runNo: 1));
      addTearDown(target.dispose);
      final repository = _Repository(nextCursor: 1);
      await pumpShadWidget(
        tester,
        ProviderScope(
          overrides: [
            analysisHistoryRepositoryProvider.overrideWithValue(repository),
          ],
          child: ShadTestApp(
            locale: const Locale('zh'),
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            home: Scaffold(
              body: ValueListenableBuilder<({String id, int runNo})>(
                valueListenable: target,
                builder: (context, value, _) => AnalysisRunHistory(
                  analysisId: value.id,
                  runNo: value.runNo,
                  active: false,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.bySemanticsLabel('下一页').last);
      await tester.pumpAndSettle();
      expect(repository.queries.last.before, 1);
      expect(
        tester.widget<CursorPagination>(find.byType(CursorPagination)).page,
        2,
      );
      target.value = change == 'runNo'
          ? (id: 'same-analysis', runNo: 2)
          : (id: 'other-analysis', runNo: 1);
      await tester.pumpAndSettle();
      expect(repository.queries.last.id, target.value.id);
      expect(repository.queries.last.before, isNull);
      expect(
        tester.widget<CursorPagination>(find.byType(CursorPagination)).page,
        1,
      );
      expect(tester.takeException(), isNull);
    });
  }
}

final class _Repository implements AnalysisHistoryRepository {
  _Repository({this.nextCursor});
  final int? nextCursor;
  final queries = <({String id, int? before})>[];
  int reads = 0;
  AnalysisStatus status = AnalysisStatus.running;

  @override
  Future<Object> fetchRecord(String id) => throw UnimplementedError();

  @override
  Future<AnalysisRunHistoryPageResponse> fetchRuns(
    String id, {
    int? before,
    int pageSize = 10,
  }) async {
    reads++;
    queries.add((id: id, before: before));
    return AnalysisRunHistoryPageResponse(
      (b) => b
        ..nextBeforeRunNo = before == null ? nextCursor : null
        ..items.add(
          AnalysisRunHistoryResponse(
            (run) => run
              ..id = 'same-run'
              ..runNo = 1
              ..trigger = 'initial'
              ..status = status
              ..createdAt = DateTime.utc(2026, 10, 2),
          ),
        ),
    );
  }
}
