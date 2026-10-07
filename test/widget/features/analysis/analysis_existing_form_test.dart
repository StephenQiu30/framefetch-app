import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/features/analysis/presentation/analysis_configurator.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch/shared/presentation/app_dropdown_field.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../support/analysis_fakes.dart';
import '../../../support/shad_test_app.dart';

void main() {
  testWidgets(
    'existing form keeps language, custom focus and default restore',
    (tester) async {
      final first = analysisSkillFixture();
      final second = first.rebuild(
        (b) => b
          ..id = 'video-analysis'
          ..displayName = '视频综合分析'
          ..defaultPrompt = '关注真实视频证据',
      );
      String? prompt;
      String? language;
      String? skill;
      await pumpShadWidget(
        tester,
        _app(
          AnalysisConfigurator(
            busy: false,
            skills: [first, second],
            onStart:
                ({
                  required customPrompt,
                  required outputLanguage,
                  required skillId,
                }) async {
                  prompt = customPrompt;
                  language = outputLanguage;
                  skill = skillId;
                },
          ),
        ),
      );
      final input = tester.widget<ShadInput>(
        find.byKey(const Key('analysis-prompt-field')),
      );
      expect(input.maxLength, 4000);
      expect(input.maxLines, 6);
      expect(input.minLines, 4);
      expect(input.controller!.text, first.defaultPrompt);
      final languages = tester.widget<AppDropdownField<String>>(
        find.byKey(const Key('analysis-language-field')),
      );
      expect(languages.options.map((option) => option.value), [
        'zh-CN',
        'en-US',
      ]);
      languages.onSelected('en-US');
      await tester.enterText(
        find.byKey(const Key('analysis-prompt-field')),
        '我的要求',
      );
      tester
          .widget<AppDropdownField<String>>(
            find.byKey(const Key('analysis-skill-field')),
          )
          .onSelected(second.id);
      await tester.pump();
      expect(input.controller!.text, '我的要求');
      await tester.ensureVisible(find.text('恢复默认值'));
      await tester.tap(find.text('恢复默认值'));
      await tester.pump();
      expect(input.controller!.text, second.defaultPrompt);
      await tester.ensureVisible(
        find.byKey(const Key('start-analysis-button')),
      );
      await tester.tap(find.byKey(const Key('start-analysis-button')));
      await tester.pump();
      expect(
        (prompt, language, skill),
        (second.defaultPrompt, 'en-US', second.id),
      );
      expect(find.byKey(const Key('skill-secondary-kind')), findsNothing);
      expect(find.byKey(const Key('skill-execution-kind')), findsNothing);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets(
    'blocked receipt disables original controls without busy spinner',
    (tester) async {
      var calls = 0;
      await pumpShadWidget(
        tester,
        _app(
          AnalysisConfigurator(
            busy: false,
            blocked: true,
            skills: [analysisSkillFixture()],
            onStart:
                ({
                  required customPrompt,
                  required outputLanguage,
                  required skillId,
                }) async => calls++,
          ),
        ),
      );
      expect(
        tester
            .widget<ShadButton>(find.byKey(const Key('start-analysis-button')))
            .enabled,
        false,
      );
      expect(
        tester
            .widget<AppDropdownField<String>>(
              find.byKey(const Key('analysis-language-field')),
            )
            .enabled,
        false,
      );
      expect(find.text('正在创建分析…'), findsNothing);
      expect(calls, 0);
    },
  );
}

Widget _app(Widget child) => ShadTestApp(
  locale: const Locale('zh'),
  supportedLocales: AppLocalizations.supportedLocales,
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  home: Scaffold(body: SingleChildScrollView(child: child)),
);
