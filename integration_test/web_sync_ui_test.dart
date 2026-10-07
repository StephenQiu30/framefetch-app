import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../test/support/auth_fakes.dart';
import '../test/widget/app/test_app.dart';

// Native rendering with synthetic repositories. No real authentication,
// Provider, AI execution, avatar upload or download is claimed by this suite.
void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> capture(WidgetTester tester, String name) async {
    FocusManager.instance.primaryFocus?.unfocus();
    // A touch outside the content dismisses shadcn's latched hover tooltips.
    await tester.tapAt(const Offset(4, 120));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    await binding.takeScreenshot(name);
  }

  testWidgets('public resources remain reachable without a session', (
    tester,
  ) async {
    await pumpFramefetchApp(tester, credentialStore: MemoryCredentialStore());
    await capture(tester, 'web-sync-public-home-light');
    await tester.tap(find.byKey(const Key('resource-menu-button')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('自托管部署'));
    await tester.pumpAndSettle();
    expect(find.text('运行帧取需要准备什么？', findRichText: true), findsOneWidget);
    await capture(tester, 'web-sync-self-hosting-light');
    await tester.tap(find.byKey(const Key('navbar-theme-toggle')));
    await capture(tester, 'web-sync-self-hosting-dark');
    await tester.tap(find.byKey(const Key('navbar-back-button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('resource-menu-button')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('关于帧取'));
    await tester.pumpAndSettle();
    expect(find.text('帧取为谁而做？', findRichText: true), findsOneWidget);
    await capture(tester, 'web-sync-about-dark');
  });

  testWidgets('profile and navigation fit native accessibility text', (
    tester,
  ) async {
    await pumpFramefetchApp(tester);
    await capture(tester, 'web-sync-workspace-light');
    await tester.tap(find.byKey(const Key('app-tab-4')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('profile-avatar-upload')), findsOneWidget);
    expect(find.text('个人资料'), findsOneWidget);
    await capture(tester, 'web-sync-profile-light');
    await tester.tap(find.byKey(const Key('navbar-theme-toggle')));
    await capture(tester, 'web-sync-profile-dark');
    tester.platformDispatcher.textScaleFactorTestValue = 2;
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
    await capture(tester, 'web-sync-profile-large-text');
    final signOut = find.byKey(const Key('logout-button'));
    await tester.ensureVisible(signOut);
    await capture(tester, 'web-sync-profile-actions-large-text');
    await tester.tap(find.byKey(const Key('app-tab-0')));
    await capture(tester, 'web-sync-workspace-large-text');
  });
}
