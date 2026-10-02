import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/theme/app_theme.dart';
import 'package:framegrab/features/analysis/data/analysis_markdown_repository.dart';
import 'package:framegrab/features/analysis/data/analysis_report_file_actions.dart';
import 'package:framegrab/features/analysis/presentation/analysis_report_preview.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/shad_test_app.dart';

void main() {
  testWidgets(
    'keeps report tables, quotes and rules free of decorative borders',
    (tester) async {
      await pumpShadWidget(
        tester,
        const ShadTestApp(
          home: Scaffold(
            body: AnalysisReportPreview(
              markdown: '> 引用\n\n---\n\n|列|\n|---|\n|值|',
            ),
          ),
        ),
      );
      final markdown = tester.widget<MarkdownBody>(
        find.byKey(const Key('analysis-markdown-preview')),
      );
      expect(markdown.styleSheet?.tableBorder, const TableBorder());
      final quote = markdown.styleSheet?.blockquoteDecoration as BoxDecoration?;
      expect(quote?.border, isNull);
      final rule =
          markdown.styleSheet?.horizontalRuleDecoration as BoxDecoration?;
      expect(rule?.border, isNull);
      expect(tester.takeException(), isNull);
    },
  );
  testWidgets('opens immediately, then renders the report after navigation', (
    tester,
  ) async {
    final actions = _FakeReportFileActions();
    await pumpShadWidget(tester, _app(actions));
    await tester.pump();

    await tester.tap(find.byKey(const Key('open-analysis-report')));
    await tester.pump(const Duration(milliseconds: 50));

    expect(
      find.byKey(const Key('analysis-report-screen'), skipOffstage: false),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('analysis-report-loading'), skipOffstage: false),
      findsOneWidget,
    );
    final loading = find.byKey(
      const Key('analysis-report-loading'),
      skipOffstage: false,
    );
    expect(tester.widget(loading), isA<Center>());
    final label = find.descendant(
      of: loading,
      matching: find.text(
        AppLocalizations.of(tester.element(loading)).analysisReportLoading,
        skipOffstage: false,
      ),
      skipOffstage: false,
    );
    expect(label, findsOneWidget);
    expect(tester.widget<Text>(label).textAlign, TextAlign.center);
    expect(
      find.byKey(const Key('analysis-markdown-preview'), skipOffstage: false),
      findsNothing,
    );

    await tester.pumpAndSettle();
    expect(find.byKey(const Key('analysis-report-loading')), findsNothing);
    expect(find.byKey(const Key('analysis-markdown-preview')), findsOneWidget);
    expect(find.text('核心结论'), findsOneWidget);
  });

  testWidgets('downloads and exports the Markdown source', (tester) async {
    final actions = _FakeReportFileActions();
    await pumpShadWidget(tester, _app(actions));
    await tester.pump();

    await tester.tap(find.byKey(const Key('open-analysis-report')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('download-analysis-report')));
    await tester.pump();
    expect(actions.downloads, [('测试标题', '# 核心结论\n\n正文')]);

    await tester.tap(find.byKey(const Key('export-analysis-report')));
    await tester.pump();
    expect(actions.exports, [('测试标题', '# 核心结论\n\n正文')]);
  });

  testWidgets('uses the Web monochrome primary action for report downloads', (
    tester,
  ) async {
    await pumpShadWidget(tester, _app(_FakeReportFileActions()));
    await tester.pump();

    await tester.tap(find.byKey(const Key('open-analysis-report')));
    await tester.pumpAndSettle();

    final button = tester.widget<ShadButton>(
      find.byKey(const Key('download-analysis-report')),
    );
    expect(button.variant, ShadButtonVariant.primary);
    expect(
      Theme.of(
        tester.element(find.byKey(const Key('download-analysis-report'))),
      ).colorScheme.primary,
      AppTheme.shadLight.colorScheme.primary,
    );
  });

  testWidgets(
    'downloads and shares the server canonical report for an analysis',
    (tester) async {
      final dio = Dio();
      addTearDown(() => dio.close(force: true));
      final client = VideoServerApi(dio: dio);
      var requests = 0;
      const canonical = '# 服务端唯一报告\n';
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            requests++;
            expect(options.path, '/api/analyses/canonical/report.md');
            expect(options.headers['Authorization'], 'Bearer synthetic-access');
            handler.resolve(
              Response<Uint8List>(
                requestOptions: options,
                statusCode: 200,
                data: Uint8List.fromList(utf8.encode(canonical)),
              ),
            );
          },
        ),
      );
      final repository = AnalysisMarkdownRepository(
        AuthenticatedRequest(
          client: client,
          accessToken: () => 'synthetic-access',
          sessionGeneration: () => 0,
          expireSession: () async {},
          refreshSession: () async => false,
        ),
      );
      final actions = _FakeReportFileActions();
      await pumpShadWidget(
        tester,
        _app(actions, analysisId: 'canonical', repository: repository),
      );
      await tester.tap(find.byKey(const Key('open-analysis-report')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('download-analysis-report')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('export-analysis-report')));
      await tester.pumpAndSettle();
      expect(actions.downloads, [('测试标题', canonical)]);
      expect(actions.exports, [('测试标题', canonical)]);
      expect(requests, 2);
    },
  );
}

Widget _app(
  AnalysisReportFileActions actions, {
  String? analysisId,
  AnalysisMarkdownRepository? repository,
}) => ProviderScope(
  overrides: [
    if (repository != null)
      analysisMarkdownRepositoryProvider.overrideWithValue(repository),
  ],
  child: ShadTestApp(
    theme: AppTheme.light,
    locale: const Locale('zh'),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(
      body: AnalysisReportLauncher(
        title: '测试标题',
        markdown: '# 核心结论\n\n正文',
        fileActions: actions,
        analysisId: analysisId,
      ),
    ),
  ),
);

final class _FakeReportFileActions implements AnalysisReportFileActions {
  final downloads = <(String, String)>[];
  final exports = <(String, String)>[];

  @override
  Future<void> download({
    required String markdown,
    required String title,
  }) async {
    downloads.add((title, markdown));
  }

  @override
  Future<void> export({
    required String markdown,
    required Rect shareOrigin,
    required String title,
  }) async {
    exports.add((title, markdown));
  }
}
