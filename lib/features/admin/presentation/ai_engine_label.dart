import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

String aiEngineLabel(AppLocalizations l, AiProviderEngine engine) =>
    switch (engine) {
      AiProviderEngine.codex => l.adminEngineCodex,
      AiProviderEngine.claude => l.adminEngineClaude,
      AiProviderEngine.openrouter => l.adminEngineOpenRouter,
      AiProviderEngine.openai => l.adminEngineOpenAi,
      AiProviderEngine.deepseek => l.adminEngineDeepSeek,
      _ => engine.name,
    };
