// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_provider_profile_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AiProviderProfileResponseStructuredOutputModeEnum
    _$aiProviderProfileResponseStructuredOutputModeEnum_jsonSchema =
    const AiProviderProfileResponseStructuredOutputModeEnum._('jsonSchema');
const AiProviderProfileResponseStructuredOutputModeEnum
    _$aiProviderProfileResponseStructuredOutputModeEnum_jsonObject =
    const AiProviderProfileResponseStructuredOutputModeEnum._('jsonObject');
const AiProviderProfileResponseStructuredOutputModeEnum
    _$aiProviderProfileResponseStructuredOutputModeEnum_unknownDefaultOpenApi =
    const AiProviderProfileResponseStructuredOutputModeEnum._(
        'unknownDefaultOpenApi');

AiProviderProfileResponseStructuredOutputModeEnum
    _$aiProviderProfileResponseStructuredOutputModeEnumValueOf(String name) {
  switch (name) {
    case 'jsonSchema':
      return _$aiProviderProfileResponseStructuredOutputModeEnum_jsonSchema;
    case 'jsonObject':
      return _$aiProviderProfileResponseStructuredOutputModeEnum_jsonObject;
    case 'unknownDefaultOpenApi':
      return _$aiProviderProfileResponseStructuredOutputModeEnum_unknownDefaultOpenApi;
    default:
      return _$aiProviderProfileResponseStructuredOutputModeEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<AiProviderProfileResponseStructuredOutputModeEnum>
    _$aiProviderProfileResponseStructuredOutputModeEnumValues = BuiltSet<
        AiProviderProfileResponseStructuredOutputModeEnum>(const <AiProviderProfileResponseStructuredOutputModeEnum>[
  _$aiProviderProfileResponseStructuredOutputModeEnum_jsonSchema,
  _$aiProviderProfileResponseStructuredOutputModeEnum_jsonObject,
  _$aiProviderProfileResponseStructuredOutputModeEnum_unknownDefaultOpenApi,
]);

Serializer<AiProviderProfileResponseStructuredOutputModeEnum>
    _$aiProviderProfileResponseStructuredOutputModeEnumSerializer =
    _$AiProviderProfileResponseStructuredOutputModeEnumSerializer();

class _$AiProviderProfileResponseStructuredOutputModeEnumSerializer
    implements
        PrimitiveSerializer<AiProviderProfileResponseStructuredOutputModeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'jsonSchema': 'json_schema',
    'jsonObject': 'json_object',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'json_schema': 'jsonSchema',
    'json_object': 'jsonObject',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[
    AiProviderProfileResponseStructuredOutputModeEnum
  ];
  @override
  final String wireName = 'AiProviderProfileResponseStructuredOutputModeEnum';

  @override
  Object serialize(Serializers serializers,
          AiProviderProfileResponseStructuredOutputModeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AiProviderProfileResponseStructuredOutputModeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AiProviderProfileResponseStructuredOutputModeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AiProviderProfileResponse extends AiProviderProfileResponse {
  @override
  final AiProviderEngine engine;
  @override
  final String displayName;
  @override
  final bool credentialConfigured;
  @override
  final bool isActive;
  @override
  final String presetId;
  @override
  final String baseUrl;
  @override
  final String model;
  @override
  final bool supportsVision;
  @override
  final bool supportsModelsEndpoint;
  @override
  final AiProviderProfileResponseStructuredOutputModeEnum structuredOutputMode;
  @override
  final BuiltList<AiProviderPresetResponse> presets;
  @override
  final DateTime? updatedAt;

  factory _$AiProviderProfileResponse(
          [void Function(AiProviderProfileResponseBuilder)? updates]) =>
      (AiProviderProfileResponseBuilder()..update(updates))._build();

  _$AiProviderProfileResponse._(
      {required this.engine,
      required this.displayName,
      required this.credentialConfigured,
      required this.isActive,
      required this.presetId,
      required this.baseUrl,
      required this.model,
      required this.supportsVision,
      required this.supportsModelsEndpoint,
      required this.structuredOutputMode,
      required this.presets,
      this.updatedAt})
      : super._();
  @override
  AiProviderProfileResponse rebuild(
          void Function(AiProviderProfileResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiProviderProfileResponseBuilder toBuilder() =>
      AiProviderProfileResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiProviderProfileResponse &&
        engine == other.engine &&
        displayName == other.displayName &&
        credentialConfigured == other.credentialConfigured &&
        isActive == other.isActive &&
        presetId == other.presetId &&
        baseUrl == other.baseUrl &&
        model == other.model &&
        supportsVision == other.supportsVision &&
        supportsModelsEndpoint == other.supportsModelsEndpoint &&
        structuredOutputMode == other.structuredOutputMode &&
        presets == other.presets &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, engine.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, credentialConfigured.hashCode);
    _$hash = $jc(_$hash, isActive.hashCode);
    _$hash = $jc(_$hash, presetId.hashCode);
    _$hash = $jc(_$hash, baseUrl.hashCode);
    _$hash = $jc(_$hash, model.hashCode);
    _$hash = $jc(_$hash, supportsVision.hashCode);
    _$hash = $jc(_$hash, supportsModelsEndpoint.hashCode);
    _$hash = $jc(_$hash, structuredOutputMode.hashCode);
    _$hash = $jc(_$hash, presets.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiProviderProfileResponse')
          ..add('engine', engine)
          ..add('displayName', displayName)
          ..add('credentialConfigured', credentialConfigured)
          ..add('isActive', isActive)
          ..add('presetId', presetId)
          ..add('baseUrl', baseUrl)
          ..add('model', model)
          ..add('supportsVision', supportsVision)
          ..add('supportsModelsEndpoint', supportsModelsEndpoint)
          ..add('structuredOutputMode', structuredOutputMode)
          ..add('presets', presets)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class AiProviderProfileResponseBuilder
    implements
        Builder<AiProviderProfileResponse, AiProviderProfileResponseBuilder> {
  _$AiProviderProfileResponse? _$v;

  AiProviderEngine? _engine;
  AiProviderEngine? get engine => _$this._engine;
  set engine(AiProviderEngine? engine) => _$this._engine = engine;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  bool? _credentialConfigured;
  bool? get credentialConfigured => _$this._credentialConfigured;
  set credentialConfigured(bool? credentialConfigured) =>
      _$this._credentialConfigured = credentialConfigured;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  String? _presetId;
  String? get presetId => _$this._presetId;
  set presetId(String? presetId) => _$this._presetId = presetId;

  String? _baseUrl;
  String? get baseUrl => _$this._baseUrl;
  set baseUrl(String? baseUrl) => _$this._baseUrl = baseUrl;

  String? _model;
  String? get model => _$this._model;
  set model(String? model) => _$this._model = model;

  bool? _supportsVision;
  bool? get supportsVision => _$this._supportsVision;
  set supportsVision(bool? supportsVision) =>
      _$this._supportsVision = supportsVision;

  bool? _supportsModelsEndpoint;
  bool? get supportsModelsEndpoint => _$this._supportsModelsEndpoint;
  set supportsModelsEndpoint(bool? supportsModelsEndpoint) =>
      _$this._supportsModelsEndpoint = supportsModelsEndpoint;

  AiProviderProfileResponseStructuredOutputModeEnum? _structuredOutputMode;
  AiProviderProfileResponseStructuredOutputModeEnum? get structuredOutputMode =>
      _$this._structuredOutputMode;
  set structuredOutputMode(
          AiProviderProfileResponseStructuredOutputModeEnum?
              structuredOutputMode) =>
      _$this._structuredOutputMode = structuredOutputMode;

  ListBuilder<AiProviderPresetResponse>? _presets;
  ListBuilder<AiProviderPresetResponse> get presets =>
      _$this._presets ??= ListBuilder<AiProviderPresetResponse>();
  set presets(ListBuilder<AiProviderPresetResponse>? presets) =>
      _$this._presets = presets;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  AiProviderProfileResponseBuilder() {
    AiProviderProfileResponse._defaults(this);
  }

  AiProviderProfileResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _engine = $v.engine;
      _displayName = $v.displayName;
      _credentialConfigured = $v.credentialConfigured;
      _isActive = $v.isActive;
      _presetId = $v.presetId;
      _baseUrl = $v.baseUrl;
      _model = $v.model;
      _supportsVision = $v.supportsVision;
      _supportsModelsEndpoint = $v.supportsModelsEndpoint;
      _structuredOutputMode = $v.structuredOutputMode;
      _presets = $v.presets.toBuilder();
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiProviderProfileResponse other) {
    _$v = other as _$AiProviderProfileResponse;
  }

  @override
  void update(void Function(AiProviderProfileResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiProviderProfileResponse build() => _build();

  _$AiProviderProfileResponse _build() {
    _$AiProviderProfileResponse _$result;
    try {
      _$result = _$v ??
          _$AiProviderProfileResponse._(
            engine: BuiltValueNullFieldError.checkNotNull(
                engine, r'AiProviderProfileResponse', 'engine'),
            displayName: BuiltValueNullFieldError.checkNotNull(
                displayName, r'AiProviderProfileResponse', 'displayName'),
            credentialConfigured: BuiltValueNullFieldError.checkNotNull(
                credentialConfigured,
                r'AiProviderProfileResponse',
                'credentialConfigured'),
            isActive: BuiltValueNullFieldError.checkNotNull(
                isActive, r'AiProviderProfileResponse', 'isActive'),
            presetId: BuiltValueNullFieldError.checkNotNull(
                presetId, r'AiProviderProfileResponse', 'presetId'),
            baseUrl: BuiltValueNullFieldError.checkNotNull(
                baseUrl, r'AiProviderProfileResponse', 'baseUrl'),
            model: BuiltValueNullFieldError.checkNotNull(
                model, r'AiProviderProfileResponse', 'model'),
            supportsVision: BuiltValueNullFieldError.checkNotNull(
                supportsVision, r'AiProviderProfileResponse', 'supportsVision'),
            supportsModelsEndpoint: BuiltValueNullFieldError.checkNotNull(
                supportsModelsEndpoint,
                r'AiProviderProfileResponse',
                'supportsModelsEndpoint'),
            structuredOutputMode: BuiltValueNullFieldError.checkNotNull(
                structuredOutputMode,
                r'AiProviderProfileResponse',
                'structuredOutputMode'),
            presets: presets.build(),
            updatedAt: updatedAt,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'presets';
        presets.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiProviderProfileResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
