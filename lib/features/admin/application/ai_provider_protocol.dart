import 'package:framefetch_server_api/framefetch_server_api.dart';

bool isDirectAiEngine(AiProviderEngine engine) => const [
  AiProviderEngine.volcengine,
  AiProviderEngine.deepseek,
  AiProviderEngine.openai,
].contains(engine);

String aiProviderBaseUrl(AiProviderEngine engine) => switch (engine) {
  AiProviderEngine.volcengine => 'https://ark.cn-beijing.volces.com/api/v3',
  AiProviderEngine.deepseek => 'https://api.deepseek.com',
  _ => 'https://api.openai.com/v1',
};

String aiProviderDefaultModel(AiProviderEngine engine) => switch (engine) {
  AiProviderEngine.volcengine => 'doubao-seed-2-0-lite',
  AiProviderEngine.deepseek => 'deepseek-chat',
  _ => 'gpt-4.1-mini',
};

String _normalizedUrlPath(String rawUrl) {
  final trimmed = rawUrl.trim();
  if (trimmed.isEmpty) return '';
  final parsed = Uri.tryParse(trimmed);
  final path = (parsed?.path ?? trimmed).replaceAll(RegExp(r'/+$'), '');
  return path.isEmpty ? '/' : path;
}

AiProviderPresetResponse? matchAiProviderPreset(
  Iterable<AiProviderPresetResponse> presets,
  AiProviderEngine engine,
  String baseUrl,
) {
  final candidates = presets.where((p) => p.engine == engine).toList();
  if (candidates.isEmpty) return null;
  final path = _normalizedUrlPath(baseUrl);
  if (path.isNotEmpty) {
    for (final preset in candidates) {
      if (_normalizedUrlPath(preset.baseUrl) == path) return preset;
    }
  }
  return candidates.first;
}

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
