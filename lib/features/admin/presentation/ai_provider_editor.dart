import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framefetch/core/theme/app_spacing.dart';
import 'package:framefetch/features/admin/application/admin_providers.dart';
import 'package:framefetch/features/admin/application/ai_provider_protocol.dart';
import 'package:framefetch/features/admin/data/admin_configuration_repository.dart';
import 'package:framefetch/features/admin/data/admin_repository.dart';
import 'package:framefetch/features/admin/presentation/admin_edit_sheet.dart';
import 'package:framefetch/features/admin/presentation/ai_engine_label.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch/shared/presentation/app_dropdown_field.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Future<void> editAiProvider(
  BuildContext context,
  WidgetRef ref, [
  AiProviderProfileResponse? item,
]) async {
  final saved = await showShadSheet<bool>(
    context: context,
    isDismissible: false,
    builder: (sheetContext) => ShadSheet(
      draggable: false,
      closeIcon: const SizedBox.shrink(),
      isScrollControlled: true,
      child: Builder(builder: (_) => _AiProviderEditor(item: item)),
    ),
  );
  if (saved == true && context.mounted) {
    ref.invalidate(adminAiProvidersProvider);
  }
}

final class _AiProviderEditor extends ConsumerStatefulWidget {
  const _AiProviderEditor({this.item});

  final AiProviderProfileResponse? item;

  @override
  ConsumerState<_AiProviderEditor> createState() => _AiProviderEditorState();
}

final class _AiProviderEditorState extends ConsumerState<_AiProviderEditor> {
  late final _key = TextEditingController(text: widget.item?.key ?? '');
  late final _name = TextEditingController(
    text: widget.item?.displayName ?? '',
  );
  late var _engine =
      widget.item?.engine != null &&
          widget.item!.engine != AiProviderEngine.unknownDefaultOpenApi
      ? widget.item!.engine
      : AiProviderEngine.volcengine;
  late final _model = TextEditingController(
    text: widget.item?.model ?? aiProviderDefaultModel(_engine),
  );
  late final _url = TextEditingController(
    text: widget.item?.baseUrl ?? aiProviderBaseUrl(_engine),
  );
  final _apiKey = TextEditingController();
  bool _testing = false;
  AiProviderConnectionTestResponse? _testResult;
  String? _testError;

  @override
  void dispose() {
    _key.dispose();
    _name.dispose();
    _model.dispose();
    _url.dispose();
    _apiKey.dispose();
    super.dispose();
  }

  void _clearProbe() {
    _testResult = null;
    _testError = null;
  }

  void _changeEngine(
    AiProviderEngine value,
    List<AiProviderPresetResponse> presets,
  ) {
    setState(() {
      _engine = value;
      final primary = matchAiProviderPreset(presets, value, '');
      _url.text = primary?.baseUrl ?? aiProviderBaseUrl(value);
      _model.text = primary?.defaultModel ?? aiProviderDefaultModel(value);
      _clearProbe();
    });
  }

  void _selectPreset(AiProviderPresetResponse preset) {
    setState(() {
      _url.text = preset.baseUrl;
      final modelIds = preset.suggestedModels.map((m) => m.id).toSet();
      if (_model.text.trim().isEmpty ||
          (modelIds.isNotEmpty && !modelIds.contains(_model.text.trim()))) {
        _model.text = preset.defaultModel;
      }
      _clearProbe();
    });
  }

  Future<void> _testConnection() async {
    final l = AppLocalizations.of(context);
    if (_testing) return;
    setState(() {
      _testing = true;
      _clearProbe();
    });
    try {
      final apiKeyText = _apiKey.text.trim();
      final response = await ref
          .read(adminRepositoryProvider)
          .testAiProviderConnection(
            TestAiProviderConnectionRequest(
              (b) => b
                ..providerKey = widget.item?.key
                ..engine = _engine
                ..authMode = AiProviderAuthMode.apiKey
                ..baseUrl = _url.text.trim()
                ..model = _model.text.trim()
                ..apiKey = apiKeyText.isEmpty ? null : apiKeyText,
            ),
          );
      if (mounted) {
        setState(() => _testResult = response);
      }
    } catch (_) {
      if (mounted) {
        setState(() => _testError = l.adminTestConnectionFailed);
      }
    } finally {
      if (mounted) {
        setState(() => _testing = false);
      }
    }
  }

  Future<void> _save() async {
    final repository = ref.read(adminConfigurationRepositoryProvider);
    final apiKeyText = _apiKey.text.trim();
    if (widget.item == null) {
      await repository.createAi(
        CreateAiProviderProfileRequest(
          (b) => b
            ..key = _key.text.trim()
            ..displayName = _name.text.trim()
            ..engine = _engine
            ..authMode = AiProviderAuthMode.apiKey
            ..baseUrl = _url.text.trim()
            ..model = _model.text.trim()
            ..apiKey = apiKeyText,
        ),
      );
    } else {
      await repository.updateAi(
        widget.item!.key,
        UpdateAiProviderProfileRequest(
          (b) => b
            ..displayName = _name.text.trim()
            ..engine = _engine
            ..authMode = AiProviderAuthMode.apiKey
            ..baseUrl = _url.text.trim()
            ..model = _model.text.trim()
            ..apiKey = apiKeyText.isEmpty ? null : apiKeyText,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final presets =
        ref
            .watch(adminAiProviderPresetsProvider)
            .asData
            ?.value
            .items
            .toList() ??
        const <AiProviderPresetResponse>[];
    final enginePresets = presets.where((p) => p.engine == _engine).toList();
    final activePreset = matchAiProviderPreset(presets, _engine, _url.text);
    final engines = AiProviderEngine.values
        .where((v) => v != AiProviderEngine.unknownDefaultOpenApi)
        .toList();
    final requiresKey =
        widget.item == null || !(widget.item?.credentialConfigured ?? false);

    return AdminEditSheet(
      title: widget.item == null ? l.createAiProvider : l.editAction,
      onSave: _save,
      fields: [
        ShadInputFormField(
          controller: _key,
          enabled: widget.item == null,
          validator: (v) => RegExp(r'^[a-z][a-z0-9_-]{0,31}$').hasMatch(v)
              ? null
              : l.invalidConfiguration,
          label: Text(l.configurationKey),
        ),
        ShadInputFormField(
          controller: _name,
          maxLength: 64,
          validator: (v) => v.trim().isEmpty ? l.invalidConfiguration : null,
          label: Text(l.displayName),
        ),
        AppDropdownField<AiProviderEngine>(
          label: l.engineLabel,
          value: _engine,
          onSelected: (v) {
            if (v != null) _changeEngine(v, presets);
          },
          options: [
            for (final engine in engines)
              AppDropdownOption(value: engine, label: aiEngineLabel(l, engine)),
          ],
        ),
        if (enginePresets.length > 1 && activePreset != null)
          AppDropdownField<String>(
            label: l.adminEndpointPresetLabel,
            value: activePreset.id,
            onSelected: (id) {
              if (id == null) return;
              for (final preset in enginePresets) {
                if (preset.id == id) {
                  _selectPreset(preset);
                  break;
                }
              }
            },
            options: [
              for (final preset in enginePresets)
                AppDropdownOption(value: preset.id, label: preset.displayName),
            ],
          ),
        if (activePreset != null && activePreset.keyIsolationNotice.isNotEmpty)
          ShadAlert(description: Text(activePreset.keyIsolationNotice)),
        ShadInputFormField(
          controller: _url,
          enabled: !_testing,
          validator: (v) => isValidAiBaseUrl(v) ? null : l.invalidConfiguration,
          label: Text(l.baseUrlLabel),
          description: Text(l.adminApiUrlHint),
          onChanged: (_) => setState(_clearProbe),
        ),
        ShadInputFormField(
          controller: _model,
          enabled: !_testing,
          maxLength: 120,
          validator: (v) => v.trim().isEmpty ? l.invalidConfiguration : null,
          label: Text(l.modelLabel),
          description: Text('${l.adminModelsHint} ${l.adminCustomModelHint}'),
          onChanged: (_) => setState(_clearProbe),
        ),
        if (activePreset != null && activePreset.suggestedModels.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l.adminSuggestedModelsLabel,
                style: ShadTheme.of(context).textTheme.small,
              ),
              const SizedBox(height: AppSpacing.xSmall),
              Wrap(
                spacing: AppSpacing.small,
                runSpacing: AppSpacing.xSmall,
                children: [
                  for (final m in activePreset.suggestedModels)
                    ShadButton.outline(
                      size: ShadButtonSize.sm,
                      height: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      enabled: !_testing,
                      onPressed: () {
                        setState(() {
                          _model.text = m.id;
                          _clearProbe();
                        });
                      },
                      child: Flexible(
                        child: Text(
                          '${m.label} (${m.supportsVision ? l.adminImageSupported : l.adminTextOnly})',
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ShadInputFormField(
          controller: _apiKey,
          enabled: !_testing,
          obscureText: true,
          label: Text(l.apiKeyLabel),
          description: widget.item != null ? Text(l.apiKeyKeepHint) : null,
          validator: (v) =>
              requiresKey && v.trim().isEmpty ? l.invalidConfiguration : null,
          onChanged: (_) => setState(_clearProbe),
        ),
        ShadButton.outline(
          height: 0,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          enabled: !_testing,
          onPressed: _testing ? null : _testConnection,
          child: Flexible(
            child: Text(
              _testing ? l.adminTestingConnection : l.adminTestConnectionAction,
            ),
          ),
        ),
        if (_testError != null)
          Semantics(
            liveRegion: true,
            child: ShadAlert.destructive(description: Text(_testError!)),
          ),
        if (_testResult != null)
          Semantics(
            liveRegion: true,
            child: _ProbeResultCard(result: _testResult!),
          ),
      ],
    );
  }
}

final class _ProbeResultCard extends StatelessWidget {
  const _ProbeResultCard({required this.result});

  final AiProviderConnectionTestResponse result;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final lines = <String>[
      result.message,
      if (result.latencyMs != null)
        l.adminTestConnectionLatency(result.latencyMs!),
      if (result.visionNotice.isNotEmpty) result.visionNotice,
      if (result.capabilityNotice.isNotEmpty) result.capabilityNotice,
    ];
    final body = Text(lines.join('\n'));
    return result.ok
        ? ShadAlert(description: body)
        : ShadAlert.destructive(description: body);
  }
}
