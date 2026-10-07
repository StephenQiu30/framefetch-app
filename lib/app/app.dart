import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framefetch/app/router/app_router.dart';
import 'package:framefetch/core/theme/app_theme.dart';
import 'package:framefetch/core/theme/theme_mode_controller.dart';
import 'package:framefetch/features/auth/application/auth_session_controller.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class FramefetchApp extends ConsumerStatefulWidget {
  const FramefetchApp({this.locale, super.key});

  final Locale? locale;

  @override
  ConsumerState<FramefetchApp> createState() => _FramefetchAppState();
}

final class _FramefetchAppState extends ConsumerState<FramefetchApp> {
  @override
  void initState() {
    super.initState();
    unawaited(
      Future<void>.microtask(
        () => ref.read(authSessionProvider.notifier).restore(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(appRouterProvider);
    final themeMode = ref.watch(themeModeProvider);

    return ShadApp.custom(
      theme: AppTheme.shadLight,
      darkTheme: AppTheme.shadDark,
      themeMode: themeMode,
      appBuilder: (context) => MaterialApp.router(
        title: '帧取',
        debugShowCheckedModeBanner: false,
        locale: widget.locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalShadLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: themeMode,
        routerConfig: router,
        builder: (context, child) => ShadAppBuilder(child: child),
      ),
    );
  }
}
