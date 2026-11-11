import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framefetch/core/theme/app_spacing.dart';
import 'package:framefetch/features/admin/application/admin_providers.dart';
import 'package:framefetch/features/admin/data/admin_configuration_repository.dart';
import 'package:framefetch/features/admin/data/admin_repository.dart';
import 'package:framefetch/features/admin/presentation/admin_edit_sheet.dart';
import 'package:framefetch/l10n/app_localizations.dart';
import 'package:framefetch/shared/presentation/app_dropdown_field.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Future<void> configureAiService(
  BuildContext context,
  WidgetRef ref,
  AiProviderProfileResponse item,
) async {
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
  const _AiProviderEditor({required this.item});

  final AiProviderProfileResponse item;

  @override
  ConsumerState<_AiProviderEditor> createState() => _AiProviderEditorState();
}

final class _AiProviderEditorState extends ConsumerState<_AiProviderEditor> {
  late String _presetId = widget.item.presetId;
  late final _model = TextEditingController(text: widget.item.model);
  final _apiKey = TextEditingController();
  bool _testing = false;
  AiProviderConnectionTestResponse? _testResult;
  String? _testError;

  @override
  void dispose() {
    _model.dispose();
    _apiKey.dispose();
    super.dispose();
  }

  AiProviderPresetResponse? get _activePreset {
    for (final preset in widget.item.presets) {
      if (preset.id == _presetId) return preset;
    }
    return widget.item.presets.isEmpty ? null : widget.item.presets.first;
  }

  bool get _endpointChanged {
    final preset = _activePreset;
    return widget.item.credentialConfigured &&
        preset != null &&
        preset.baseUrl != widget.item.baseUrl;
  }

  void _clearProbe() {
    _testResult = null;
    _testError = null;
  }

  void _selectPreset(AiProviderPresetResponse preset) {
    setState(() {
      _presetId = preset.id;
      _model.text = preset.defaultModel;
      if (widget.item.credentialConfigured &&
          preset.baseUrl != widget.item.baseUrl) {
        _apiKey.clear();
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
                ..engine = widget.item.engine
                ..presetId = _presetId
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
    final modelText = _model.text.trim();
    await repository.configureAi(
      widget.item.engine,
      ConfigureAiProviderRequest(
        (b) => b
          ..presetId = _presetId
          ..model = modelText.isEmpty ? _activePreset?.defaultModel : modelText
          ..apiKey = apiKeyText.isEmpty ? null : apiKeyText
          ..activate = true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final presets = widget.item.presets.toList();
    final activePreset = _activePreset;
    final requiresKey = !widget.item.credentialConfigured || _endpointChanged;

    return AdminEditSheet(
      title: widget.item.displayName,
      onSave: _save,
      fields: [
        if (activePreset != null)
          Text(
            activePreset.baseUrl,
            style: ShadTheme.of(context).textTheme.muted,
          ),
        ShadInputFormField(
          controller: _apiKey,
          enabled: !_testing,
          obscureText: true,
          label: Text(l.apiKeyLabel),
          description: !requiresKey ? Text(l.apiKeyKeepHint) : null,
          validator: (v) =>
              requiresKey && v.trim().isEmpty ? l.invalidConfiguration : null,
          onChanged: (_) => setState(_clearProbe),
        ),
        if (presets.length > 1 && activePreset != null)
          AppDropdownField<String>(
            label: l.adminEndpointPresetLabel,
            value: activePreset.id,
            onSelected: (id) {
              if (id == null) return;
              for (final preset in presets) {
                if (preset.id == id) {
                  _selectPreset(preset);
                  break;
                }
              }
            },
            options: [
              for (final preset in presets)
                AppDropdownOption(value: preset.id, label: preset.displayName),
            ],
          ),
        if (activePreset != null && activePreset.keyIsolationNotice.isNotEmpty)
          ShadAlert(description: Text(activePreset.keyIsolationNotice)),
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
