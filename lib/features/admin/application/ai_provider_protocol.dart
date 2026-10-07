import 'package:framefetch_server_api/framefetch_server_api.dart';

bool isDirectAiEngine(AiProviderEngine engine) => const [
  AiProviderEngine.openrouter,
  AiProviderEngine.openai,
  AiProviderEngine.deepseek,
].contains(engine);

String aiProviderBaseUrl(AiProviderEngine engine) => switch (engine) {
  AiProviderEngine.openrouter => 'https://openrouter.ai/api/v1',
  AiProviderEngine.claude => 'https://api.anthropic.com',
  AiProviderEngine.deepseek => 'https://api.deepseek.com',
  _ => 'https://api.openai.com/v1',
};

bool isValidAiBaseUrl(String value) {
  final uri = Uri.tryParse(value.trim());
  if (uri == null ||
      uri.host.isEmpty ||
      uri.userInfo.isNotEmpty ||
      uri.hasQuery ||
      uri.hasFragment) {
    return false;
  }
  final loopback = {'localhost', '127.0.0.1', '::1'}.contains(uri.host);
  return uri.scheme == 'https' || (uri.scheme == 'http' && loopback);
}

bool supportsStructuredText(AiModelResponse model) =>
    model.inputModalities.contains('text') &&
    model.outputModalities.contains('text') &&
    model.supportedParameters.contains('structured_outputs');
