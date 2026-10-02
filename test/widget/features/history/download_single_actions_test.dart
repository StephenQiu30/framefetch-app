import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/history/presentation/download_history_screen.dart';
import 'package:framegrab/shared/presentation/list_filters.dart';
import 'package:framegrab/shared/presentation/list_query.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../support/data_fakes.dart';
import '../../app/test_app.dart';

void main() {
  const id = '00000000-0000-0000-0000-000000000101';

  testWidgets('download history keeps single-item navigation and paging', (
    tester,
  ) async {
    final repository = FakeDownloadHistoryRepository(
      data: downloadHistoryFixture(),
    );
    await setMobileViewport(tester);
    await pumpFramegrabApp(tester, downloadHistoryRepository: repository);
    await tester.tap(find.byKey(const Key('app-tab-1')));
    await tester.pumpAndSettle();

    final screen = find.byType(DownloadHistoryScreen);
    expect(
      find.descendant(of: screen, matching: find.byType(ShadCheckbox)),
      findsNothing,
    );
    expect(find.text('选择本页'), findsNothing);
    expect(find.text('批量下载'), findsNothing);
    expect(find.text('向左轻扫可查看任务操作。'), findsNothing);
    expect(find.text('继续查看、获取或分析已创建的任务。'), findsNothing);
    expect(find.byType(ListFilters), findsOneWidget);
    expect(find.byType(ListPagination), findsOneWidget);
    final item = find.byKey(const Key('download-history-item-$id'));
    final title = find.descendant(of: item, matching: find.text('真实下载任务')).last;
    expect(
      tester.renderObject<RenderParagraph>(title).textAlign,
      TextAlign.start,
    );
    await tester.ensureVisible(item);
    await tester.tap(item);
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('download-detail-content')), findsOneWidget);
    expect(repository.detailCalls, [id]);
    expect(repository.deleteCalls, isEmpty);
    expect(tester.takeException(), isNull);
  });

  testWidgets('single download deletion still requires confirmation', (
    tester,
  ) async {
    final repository = FakeDownloadHistoryRepository(
      data: downloadHistoryFixture(),
    );
    await setMobileViewport(tester);
    await pumpFramegrabApp(tester, downloadHistoryRepository: repository);
    await tester.tap(find.byKey(const Key('app-tab-1')));
    await tester.pumpAndSettle();

    final item = find.byKey(const Key('download-history-slidable-$id'));
    await tester.ensureVisible(item);
    await tester.drag(item, const Offset(-320, 0));
    await tester.pumpAndSettle();
    final action = find.byKey(const Key('delete-download-$id'));
    await tester.tap(action);
    await tester.pumpAndSettle();
    expect(repository.deleteCalls, isEmpty);
    await tester.tap(find.text('保留任务'));
    await tester.pumpAndSettle();
    expect(repository.deleteCalls, isEmpty);

    await tester.drag(item, const Offset(-320, 0));
    await tester.pumpAndSettle();
    await tester.tap(action);
    await tester.pumpAndSettle();
    await tester.tap(find.text('确认删除'));
    await tester.pumpAndSettle();
    expect(repository.deleteCalls, [id]);
    expect(find.byKey(const Key('download-history-item-$id')), findsNothing);
    expect(tester.takeException(), isNull);
  });
}
