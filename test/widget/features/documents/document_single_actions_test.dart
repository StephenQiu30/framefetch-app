import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/documents/presentation/document_list_screen.dart';
import 'package:framegrab/shared/presentation/list_query.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../support/data_fakes.dart';
import '../../app/test_app.dart';

void main() {
  const id = '00000000-0000-0000-0000-000000000102';

  testWidgets('documents keep individual navigation and left-aligned text', (
    tester,
  ) async {
    final repository = FakeDocumentRepository(data: documentFixture());
    await setMobileViewport(tester);
    await pumpFramegrabApp(tester, documentRepository: repository);
    await tester.tap(find.byKey(const Key('app-tab-2')));
    await tester.pumpAndSettle();

    final screen = find.byType(DocumentListScreen);
    expect(
      find.descendant(of: screen, matching: find.byType(ShadCheckbox)),
      findsNothing,
    );
    expect(find.text('选择本页'), findsNothing);
    expect(find.textContaining('批量删除'), findsNothing);
    expect(find.byType(ListPagination), findsOneWidget);
    final item = find.byKey(const Key('document-list-item-$id'));
    for (final value in ['真实剧本', 'framegrab.docx']) {
      final text = find.descendant(of: item, matching: find.text(value));
      expect(
        tester.renderObject<RenderParagraph>(text).textAlign,
        TextAlign.start,
      );
    }
    await tester.ensureVisible(item);
    await tester.tap(item);
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('document-detail-content')), findsOneWidget);
    expect(repository.detailCalls, [id]);
    expect(repository.deleteCalls, isEmpty);
    expect(tester.takeException(), isNull);
  });

  testWidgets('single document deletion still requires confirmation', (
    tester,
  ) async {
    final repository = FakeDocumentRepository(data: documentFixture());
    await setMobileViewport(tester);
    await pumpFramegrabApp(tester, documentRepository: repository);
    await tester.tap(find.byKey(const Key('app-tab-2')));
    await tester.pumpAndSettle();

    final item = find.byKey(const Key('document-slidable-$id'));
    await tester.ensureVisible(item);
    await tester.drag(item, const Offset(-320, 0));
    await tester.pumpAndSettle();
    final action = find.byKey(const Key('delete-document-$id'));
    await tester.tap(action);
    await tester.pumpAndSettle();
    expect(repository.deleteCalls, isEmpty);
    await tester.tap(find.text('保留文档'));
    await tester.pumpAndSettle();
    expect(repository.deleteCalls, isEmpty);

    await tester.drag(item, const Offset(-320, 0));
    await tester.pumpAndSettle();
    await tester.tap(action);
    await tester.pumpAndSettle();
    await tester.tap(find.text('确认删除'));
    await tester.pumpAndSettle();
    expect(repository.deleteCalls, [id]);
    expect(find.byKey(const Key('document-list-item-$id')), findsNothing);
    expect(tester.takeException(), isNull);
  });
}
