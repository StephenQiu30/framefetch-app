import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/app/app.dart';
import 'package:framefetch/app/router/app_router.dart';
import 'package:framefetch/features/history/application/activity_history_query.dart';
import 'package:framefetch/features/history/data/activity_history_repository.dart';
import 'package:framefetch/features/history/presentation/activity_history_item.dart';
import 'package:framefetch/features/history/presentation/activity_history_screen.dart';
import 'package:framefetch/shared/presentation/cursor_pagination.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../support/workspace_parity_fixtures.dart';
import '../../app/test_app.dart';

void main() {
  testWidgets(
    'processing history keeps filters and material scope without bulk UI',
    (tester) async {
      final repository = _Repository();
      await setMobileViewport(tester);
      await pumpFramefetchApp(tester, activityHistoryRepository: repository);
      final router = ProviderScope.containerOf(
        tester.element(find.byType(FramefetchApp)),
      ).read(appRouterProvider);
      router.go('/history/activity?document_id=document');
      await tester.pumpAndSettle();

      final screen = find.byType(ActivityHistoryScreen);
      expect(find.byType(ActivityHistoryItem), findsOneWidget);
      expect(find.byType(CursorPagination), findsOneWidget);
      expect(
        find.descendant(of: screen, matching: find.byType(ShadCheckbox)),
        findsNothing,
      );
      expect(find.text('选择本页'), findsNothing);
      expect(find.textContaining('批量下载'), findsNothing);
      expect(find.text('统一查看链接、文档和 AI 分析记录。'), findsNothing);
      await tester.enterText(
        find.byKey(const Key('activity-search')),
        'lesson',
      );
      await tester.ensureVisible(find.text('搜索'));
      await tester.tap(find.text('搜索'));
      await tester.pumpAndSettle();
      expect(repository.queries.last.search, 'lesson');

      final clear = find.byKey(const Key('activity-clear-filters'));
      await tester.ensureVisible(clear);
      await tester.tap(clear);
      await tester.pumpAndSettle();
      expect(repository.queries.last.search, isEmpty);
      expect(
        repository.queries.every(
          (query) => query.documentId == 'document' && query.downloadId == null,
        ),
        isTrue,
      );
      expect(tester.takeException(), isNull);
    },
  );
}

final class _Repository implements ActivityHistoryRepository {
  final queries = <ActivityHistoryQuery>[];

  @override
  Future<HistoryRecordPageResponse> fetch(ActivityHistoryQuery query) {
    queries.add(query);
    return FakeActivityHistoryRepository().fetch(query);
  }
}
