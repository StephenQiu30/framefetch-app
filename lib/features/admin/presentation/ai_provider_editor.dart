import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/admin/application/admin_providers.dart';
import 'package:framegrab/features/admin/application/ai_provider_protocol.dart';
import 'package:framegrab/features/admin/data/admin_configuration_repository.dart';
import 'package:framegrab/features/admin/presentation/admin_edit_sheet.dart';
import 'package:framegrab/features/admin/presentation/ai_engine_label.dart';
import 'package:framegrab/features/admin/presentation/open_router_models.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_dropdown_field.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:video_server_api/video_server_api.dart';

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
      child: Builder(builder: (_) => _AiEditor(item: item)),
    ),
  );
  if (saved == true && context.mounted) {
    ref.invalidate(adminAiProvidersProvider);
  }
}

final class _AiEditor extends ConsumerStatefulWidget {
  const _AiEditor({this.item});
  final AiProviderProfileResponse? item;
  @override
  ConsumerState<_AiEditor> createState() => _AiEditorState();
}

final class _AiEditorState extends ConsumerState<_AiEditor> {
  late final _key = TextEditingController(text: widget.item?.key);
  late final _name = TextEditingController(text: widget.item?.displayName);
  late final _model = TextEditingController(text: widget.item?.model);
  late final _url = TextEditingController(text: widget.item?.baseUrl);
  final _secret = TextEditingController();
  late var _engine = widget.item?.engine ?? AiProviderEngine.codex;
  late var _auth = widget.item?.authMode ?? AiProviderAuthMode.hostLogin;
  bool get _local => widget.item?.key == 'local-codex';
  bool get _canKeepCredential =>
      widget.item?.credentialConfigured == true &&
      widget.item?.engine == _engine &&
      widget.item?.authMode == _auth &&
      (widget.item?.baseUrl ?? '').replaceFirst(RegExp(r'/+$'), '') ==
          _url.text.trim().replaceFirst(RegExp(r'/+$'), '');
  @override
  void dispose() {
    for (final c in [_key, _name, _model, _url, _secret]) {
      c.dispose();
    }
    super.dispose();
  }

  void _changeEngine(AiProviderEngine value) => setState(() {
    _engine = value;
    _auth = isDirectAiEngine(value)
        ? AiProviderAuthMode.apiKey
        : AiProviderAuthMode.hostLogin;
    _model.text = value == AiProviderEngine.deepseek
        ? 'deepseek-v4-flash-vision-exp'
        : '';
    _url.text = _auth == AiProviderAuthMode.apiKey
        ? aiProviderBaseUrl(value)
        : '';
    _secret.clear();
  });
  Future<void> _save() async {
    final repository = ref.read(adminConfigurationRepositoryProvider);
    final secret = _secret.text.trim();
    if (widget.item == null) {
      await repository.createAi(
        CreateAiProviderProfileRequest(
          (b) => b
            ..key = _key.text.trim()
            ..displayName = _name.text.trim()
            ..engine = _engine
            ..authMode = _auth
            ..model = _model.text.trim()
            ..baseUrl = _auth == AiProviderAuthMode.apiKey
                ? _url.text.trim()
                : null
            ..apiKey = secret.isEmpty ? null : secret,
        ),
      );
    } else {
      await repository.updateAi(
        widget.item!.key,
        UpdateAiProviderProfileRequest((b) {
          b
            ..displayName = _name.text.trim()
            ..model = _model.text.trim();
          if (!_local) {
            b
              ..engine = _engine
              ..authMode = _auth
              ..baseUrl = _auth == AiProviderAuthMode.apiKey
                  ? _url.text.trim()
                  : null
              ..apiKey = secret.isEmpty ? null : secret;
          }
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    String? required(String? v) =>
        (v ?? '').trim().isEmpty ? l.invalidConfiguration : null;
    return AdminEditSheet(
      title: widget.item == null ? l.createAiProvider : l.editAction,
      onSave: _save,
      fields: [
        if (_local) Text(l.localCodexRestriction),
        ShadInputFormField(
          controller: _key,
          enabled: widget.item == null,
          maxLength: 32,
          validator: (v) => RegExp(r'^[a-z][a-z0-9_-]{0,31}$').hasMatch(v)
              ? null
              : l.invalidConfiguration,
          label: Text(l.configurationKey),
        ),
        ShadInputFormField(
          controller: _name,
          maxLength: 64,
          validator: required,
          label: Text(l.displayName),
        ),
        AppDropdownField<AiProviderEngine>(
          value: _engine,
          label: l.engineLabel,
          enabled: !_local,
          options: [
            for (final e in AiProviderEngine.values.where(
              (v) => v != AiProviderEngine.unknownDefaultOpenApi,
            ))
              AppDropdownOption(value: e, label: aiEngineLabel(l, e)),
          ],
          onSelected: (v) {
            if (v != null) _changeEngine(v);
          },
        ),
        AppDropdownField<AiProviderAuthMode>(
          key: ValueKey(_engine),
          value: _auth,
          label: l.authModeLabel,
          enabled: !_local,
          options: [
            for (final a in AiProviderAuthMode.values.where(
              (v) => v != AiProviderAuthMode.unknownDefaultOpenApi,
            ))
              if (!isDirectAiEngine(_engine) || a == AiProviderAuthMode.apiKey)
                AppDropdownOption(
                  value: a,
                  label: a == AiProviderAuthMode.hostLogin
                      ? l.hostLoginLabel
                      : l.apiKeyLabel,
                ),
          ],
          onSelected: (v) {
            if (v != null) {
              setState(() {
                _auth = v;
                _url.text = v == AiProviderAuthMode.apiKey
                    ? aiProviderBaseUrl(_engine)
                    : '';
                _secret.clear();
              });
            }
          },
        ),
        if (_engine == AiProviderEngine.openrouter)
          OpenRouterModels(
            onSelected: (id) => setState(() => _model.text = id),
          ),
        ShadInputFormField(
          controller: _model,
          enabled: _engine != AiProviderEngine.deepseek,
          maxLength: 128,
          validator: required,
          label: Text(l.modelLabel),
          description: _engine == AiProviderEngine.deepseek
              ? Text(l.adminFixedDeepSeekModel)
              : null,
        ),
        if (_auth == AiProviderAuthMode.apiKey) ...[
          ShadInputFormField(
            controller: _url,
            enabled: !_local && _engine != AiProviderEngine.openrouter,
            maxLength: 2048,
            keyboardType: TextInputType.url,
            onChanged: (_) => setState(() {}),
            validator: (v) =>
                isValidAiBaseUrl(v) ? null : l.invalidConfiguration,
            label: Text(l.baseUrlLabel),
            description: Text(
              _engine == AiProviderEngine.openrouter
                  ? l.adminOpenRouterUrlHint
                  : l.adminApiUrlHint,
            ),
          ),
          ShadInputFormField(
            controller: _secret,
            maxLength: 4096,
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,
            validator: _canKeepCredential ? null : required,
            label: Text(l.apiKeyLabel),
            description: _canKeepCredential ? Text(l.apiKeyKeepHint) : null,
          ),
        ] else
          Text(l.adminHostLoginHint),
      ],
    );
  }
}
