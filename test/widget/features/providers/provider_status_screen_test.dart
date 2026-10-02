import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/providers/data/provider_status_repository.dart';
import 'package:framegrab/features/providers/presentation/provider_status_screen.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/data_fakes.dart';
import '../../../support/shad_test_app.dart';

void main() {
  testWidgets('filters provider status with Shad tabs', (tester) async {
    final available = providerFixture().items.single.rebuild(
      (builder) => builder.capabilities.add(ProviderCapability.subtitles),
    );
    final attention = available.rebuild(
      (builder) => builder
        ..key = 'attention-provider'
        ..displayName = '需要处理的平台'
        ..capabilities.clear()
        ..userAction = '请先检查配置'
        ..registered = false
        ..downloadSupported = true
        ..status = ProviderSupportStatus.unknown,
    );
    final repository = FakeProviderStatusRepository(
      data: ProviderListResponse(
        (builder) => builder.items.replace([available, attention]),
      ),
    );

    await pumpShadWidget(
      tester,
      ProviderScope(
        overrides: [
          providerStatusRepositoryProvider.overrideWithValue(repository),
        ],
        child: const ShadTestApp(
          locale: Locale('zh'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(body: ProviderStatusScreen()),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(ShadTabs<String>), findsOneWidget);
    expect(find.byType(ChoiceChip), findsNothing);
    final firstFilter = find.byKey(const Key('provider-filter-all'));
    final filterContext = tester.element(firstFilter);
    final tabBarPadding =
        ShadTheme.of(filterContext).tabsTheme.padding ?? EdgeInsets.zero;
    final pageLeft = tester
        .getTopLeft(find.byKey(const Key('page-title-heading')))
        .dx;
    expect(
      tester.getTopLeft(firstFilter).dx,
      closeTo(
        pageLeft + tabBarPadding.resolve(Directionality.of(filterContext)).left,
        0.5,
      ),
    );
    expect(find.text('YouTube'), findsOneWidget);
    expect(find.text('youtube'), findsOneWidget);
    expect(find.textContaining('优先登录', findRichText: true), findsNWidgets(2));
    expect(find.text('单视频 · 字幕'), findsOneWidget);
    expect(find.text('暂无已登记能力'), findsOneWidget);
    expect(find.text('下载结果以实际文件为准。'), findsOneWidget);
    expect(find.text('请先检查配置'), findsOneWidget);
    expect(find.textContaining('下载已开放'), findsNothing);
    expect(find.text('需要处理的平台'), findsOneWidget);

    await tester.tap(find.byKey(const Key('provider-filter-disabled')));
    await tester.pumpAndSettle();

    expect(find.text('YouTube'), findsNothing);
    expect(find.text('单视频 · 字幕'), findsNothing);
    expect(find.text('暂无已登记能力'), findsOneWidget);
    expect(find.text('需要处理的平台'), findsOneWidget);
    expect(repository.calls, 1);
    expect(tester.takeException(), isNull);
  });
}
