import 'package:framegrab/l10n/app_localizations.dart';
import 'package:video_server_api/video_server_api.dart';

String aiEngineLabel(AppLocalizations l, AiProviderEngine engine) =>
    switch (engine) {
      AiProviderEngine.codex => l.adminEngineCodex,
      AiProviderEngine.claude => l.adminEngineClaude,
      AiProviderEngine.openrouter => l.adminEngineOpenRouter,
      AiProviderEngine.openai => l.adminEngineOpenAi,
      AiProviderEngine.deepseek => l.adminEngineDeepSeek,
      _ => engine.name,
    };
