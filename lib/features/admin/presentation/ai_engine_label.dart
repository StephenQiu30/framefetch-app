import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

String aiEngineLabel(AppLocalizations l, AiProviderEngine engine) =>
    switch (engine) {
      AiProviderEngine.volcengine => l.adminEngineVolcengine,
      AiProviderEngine.deepseek => l.adminEngineDeepSeek,
      AiProviderEngine.openai => l.adminEngineOpenAi,
      _ => engine.name,
    };
