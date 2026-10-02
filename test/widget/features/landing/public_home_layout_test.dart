import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/theme/theme_preference_store.dart';
import 'package:framegrab/features/landing/presentation/public_home_screen.dart';
import 'package:framegrab/l10n/app_localizations.dart';

import '../../../support/shad_test_app.dart';
import '../../../support/theme_fakes.dart';

void main() {
  testWidgets('uses the Web single-column mobile content and type scale', (
    tester,
  ) async {
    await _pumpHome(tester, width: 390);

    final hero = tester.getRect(find.byKey(const Key('public-home-hero')));
    final workflow = tester.getRect(
      find.byKey(const Key('public-home-workflow')),
    );
    expect(hero.left, 16);
    expect(workflow.left, hero.left);
    expect(workflow.top, greaterThan(hero.bottom));
    final title = tester.widget<Text>(
      find.byKey(const Key('public-home-title')),
    );
    expect(title.data, '把素材，\n带回本地。');
    expect(title.style?.fontSize, 40);
    expect(find.text('工作流'), findsOneWidget);
    expect(find.text('从识别到交付，每一步都有明确边界。'), findsOneWidget);

    final first = tester.getRect(
      find.byKey(const Key('public-home-capability-0')),
    );
    final second = tester.getRect(
      find.byKey(const Key('public-home-capability-1')),
    );
    expect(second.left, first.left);
    expect(second.top, greaterThan(first.bottom));
    expect(tester.takeException(), isNull);
  });

  testWidgets('uses the Web hero, capability and FAQ columns on wide screens', (
    tester,
  ) async {
    await _pumpHome(tester, width: 1440);

    final shell = tester.getRect(
      find.byKey(const Key('public-home-content-shell')),
    );
    expect(shell.width, 1280);
    expect(shell.left, 80);
    final hero = tester.getRect(find.byKey(const Key('public-home-hero')));
    final workflow = tester.getRect(
      find.byKey(const Key('public-home-workflow')),
    );
    expect(workflow.top, hero.top);
    expect(workflow.left - hero.right, 96);
    expect(hero.width / workflow.width, closeTo(1.5, 0.01));
    final title = tester.widget<Text>(
      find.byKey(const Key('public-home-title')),
    );
    expect(title.data, '把素材，带回本地。');
    expect(title.style?.fontSize, 48);

    final first = tester.getRect(
      find.byKey(const Key('public-home-capability-0')),
    );
    final third = tester.getRect(
      find.byKey(const Key('public-home-capability-2')),
    );
    expect(third.top, first.top);
    expect(third.left, greaterThan(first.right));
    final question = tester.getRect(
      find.byKey(const Key('public-home-question-0')),
    );
    final nextQuestion = tester.getRect(
      find.byKey(const Key('public-home-question-1')),
    );
    expect(nextQuestion.top, question.top);
    expect(nextQuestion.left - question.right, 80);
    expect(tester.takeException(), isNull);
  });

  testWidgets(
    'returns to readable columns when accessibility text is enlarged',
    (tester) async {
      await _pumpHome(tester, width: 1024, textScale: 2);
      final hero = tester.getRect(find.byKey(const Key('public-home-hero')));
      final workflow = tester.getRect(
        find.byKey(const Key('public-home-workflow')),
      );
      expect(workflow.top, greaterThan(hero.bottom));
      expect(workflow.left, hero.left);
      final first = tester.getRect(
        find.byKey(const Key('public-home-capability-0')),
      );
      final second = tester.getRect(
        find.byKey(const Key('public-home-capability-1')),
      );
      expect(second.top, greaterThan(first.bottom));
      expect(tester.takeException(), isNull);
    },
  );
  testWidgets(
    'wraps the English actions at the mobile 2x accessibility scale',
    (tester) async {
      await _pumpHome(
        tester,
        width: 390,
        textScale: 2,
        locale: const Locale('en'),
      );
      for (final key in [
        'public-home-register',
        'public-home-source',
        'public-home-guide',
        'public-home-deployment',
      ]) {
        final rect = tester.getRect(find.byKey(Key(key)));
        expect(rect.width, lessThanOrEqualTo(358));
        expect(rect.left, greaterThanOrEqualTo(16));
        expect(rect.right, lessThanOrEqualTo(374));
      }
      expect(tester.takeException(), isNull);
    },
  );
}

Future<void> _pumpHome(
  WidgetTester tester, {
  required double width,
  double textScale = 1,
  Locale locale = const Locale('zh'),
}) async {
  tester.view.devicePixelRatio = 1;
  tester.view.physicalSize = Size(width, 900);
  addTearDown(tester.view.resetDevicePixelRatio);
  addTearDown(tester.view.resetPhysicalSize);
  await pumpShadWidget(
    tester,
    ProviderScope(
      overrides: [
        themePreferenceStoreProvider.overrideWithValue(
          MemoryThemePreferenceStore(),
        ),
      ],
      child: ShadTestApp(
        locale: locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(textScale)),
          child: child!,
        ),
        home: const PublicHomeScreen(),
      ),
    ),
  );
  await tester.pump();
}
