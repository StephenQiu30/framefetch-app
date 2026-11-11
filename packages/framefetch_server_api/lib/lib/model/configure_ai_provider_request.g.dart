// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configure_ai_provider_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConfigureAiProviderRequest extends ConfigureAiProviderRequest {
  @override
  final String? presetId;
  @override
  final String? model;
  @override
  final String? apiKey;
  @override
  final bool? activate;

  factory _$ConfigureAiProviderRequest(
          [void Function(ConfigureAiProviderRequestBuilder)? updates]) =>
      (ConfigureAiProviderRequestBuilder()..update(updates))._build();

  _$ConfigureAiProviderRequest._(
      {this.presetId, this.model, this.apiKey, this.activate})
      : super._();
  @override
  ConfigureAiProviderRequest rebuild(
          void Function(ConfigureAiProviderRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigureAiProviderRequestBuilder toBuilder() =>
      ConfigureAiProviderRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigureAiProviderRequest &&
        presetId == other.presetId &&
        model == other.model &&
        apiKey == other.apiKey &&
        activate == other.activate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, presetId.hashCode);
    _$hash = $jc(_$hash, model.hashCode);
    _$hash = $jc(_$hash, apiKey.hashCode);
    _$hash = $jc(_$hash, activate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConfigureAiProviderRequest')
          ..add('presetId', presetId)
          ..add('model', model)
          ..add('apiKey', apiKey)
          ..add('activate', activate))
        .toString();
  }
}

class ConfigureAiProviderRequestBuilder
    implements
        Builder<ConfigureAiProviderRequest, ConfigureAiProviderRequestBuilder> {
  _$ConfigureAiProviderRequest? _$v;

  String? _presetId;
  String? get presetId => _$this._presetId;
  set presetId(String? presetId) => _$this._presetId = presetId;

  String? _model;
  String? get model => _$this._model;
  set model(String? model) => _$this._model = model;

  String? _apiKey;
  String? get apiKey => _$this._apiKey;
  set apiKey(String? apiKey) => _$this._apiKey = apiKey;

  bool? _activate;
  bool? get activate => _$this._activate;
  set activate(bool? activate) => _$this._activate = activate;

  ConfigureAiProviderRequestBuilder() {
    ConfigureAiProviderRequest._defaults(this);
  }

  ConfigureAiProviderRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _presetId = $v.presetId;
      _model = $v.model;
      _apiKey = $v.apiKey;
      _activate = $v.activate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConfigureAiProviderRequest other) {
    _$v = other as _$ConfigureAiProviderRequest;
  }

  @override
  void update(void Function(ConfigureAiProviderRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConfigureAiProviderRequest build() => _build();

  _$ConfigureAiProviderRequest _build() {
    final _$result = _$v ??
        _$ConfigureAiProviderRequest._(
          presetId: presetId,
          model: model,
          apiKey: apiKey,
          activate: activate,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
