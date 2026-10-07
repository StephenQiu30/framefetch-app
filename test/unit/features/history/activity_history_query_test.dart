import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/features/history/application/activity_history_query.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

void main() {
  test('screenplay subtypes match the server history union', () {
    const basic = ActivityHistoryQuery(
      category: ActivityCategory.screenplay,
      screenplayMode: ScreenplayHistoryMode.basic,
    );
    const rewrite = ActivityHistoryQuery(
      category: ActivityCategory.screenplay,
      screenplayMode: ScreenplayHistoryMode.rewrite,
    );
    expect(basic.recordTypes, [HistoryRecordKind.documentParse]);
    expect(basic.resultContract, isNull);
    expect(rewrite.recordTypes, [HistoryRecordKind.screenplayAnalysis]);
    expect(rewrite.resultContract, AnalysisResultContract.screenplayRewrite);
  });

  test('date range uses local day boundaries and an exclusive next day', () {
    expect(
      ActivityHistoryQuery.dateBoundary('2026-10-02'),
      DateTime(2026, 10, 2).toUtc(),
    );
    expect(
      ActivityHistoryQuery.dateBoundary('2026-10-02', end: true),
      DateTime(2026, 10, 3).toUtc(),
    );
    expect(ActivityHistoryQuery.dateBoundary('2026-02-31'), isNull);
    expect(ActivityHistoryQuery.dateBoundary('invalid'), isNull);
  });

  test('filter changes clear cursors while preserving page size and scope', () {
    final query = ActivityHistoryQuery(
      pageSize: 50,
      documentId: 'document',
      cursor: HistoryRecordCursorResponse(
        (b) => b
          ..id = 'cursor'
          ..createdAt = DateTime.utc(2026)
          ..recordType = HistoryRecordKind.parse,
      ),
    );
    final next = query.filter(category: ActivityCategory.parse);
    expect(next.cursor, isNull);
    expect(next.pageSize, 50);
    expect(next.documentId, 'document');
    expect(next, next.filter());
  });
}
