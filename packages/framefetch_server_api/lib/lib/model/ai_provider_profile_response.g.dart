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
  final String key;
  @override
  final String displayName;
  @override
  final AiProviderEngine engine;
  @override
  final AiProviderAuthMode authMode;
  @override
  final String? baseUrl;
  @override
  final String model;
  @override
  final bool credentialConfigured;
  @override
  final bool isActive;
  @override
  final bool isFallback;
  @override
  final String? presetId;
  @override
  final bool supportsVision;
  @override
  final bool supportsModelsEndpoint;
  @override
  final AiProviderProfileResponseStructuredOutputModeEnum structuredOutputMode;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  factory _$AiProviderProfileResponse(
          [void Function(AiProviderProfileResponseBuilder)? updates]) =>
      (AiProviderProfileResponseBuilder()..update(updates))._build();

  _$AiProviderProfileResponse._(
      {required this.key,
      required this.displayName,
      required this.engine,
      required this.authMode,
      this.baseUrl,
      required this.model,
      required this.credentialConfigured,
      required this.isActive,
      required this.isFallback,
      this.presetId,
      required this.supportsVision,
      required this.supportsModelsEndpoint,
      required this.structuredOutputMode,
      required this.createdAt,
      required this.updatedAt})
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
        key == other.key &&
        displayName == other.displayName &&
        engine == other.engine &&
        authMode == other.authMode &&
        baseUrl == other.baseUrl &&
        model == other.model &&
        credentialConfigured == other.credentialConfigured &&
        isActive == other.isActive &&
        isFallback == other.isFallback &&
        presetId == other.presetId &&
        supportsVision == other.supportsVision &&
        supportsModelsEndpoint == other.supportsModelsEndpoint &&
        structuredOutputMode == other.structuredOutputMode &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, engine.hashCode);
    _$hash = $jc(_$hash, authMode.hashCode);
    _$hash = $jc(_$hash, baseUrl.hashCode);
    _$hash = $jc(_$hash, model.hashCode);
    _$hash = $jc(_$hash, credentialConfigured.hashCode);
    _$hash = $jc(_$hash, isActive.hashCode);
    _$hash = $jc(_$hash, isFallback.hashCode);
    _$hash = $jc(_$hash, presetId.hashCode);
    _$hash = $jc(_$hash, supportsVision.hashCode);
    _$hash = $jc(_$hash, supportsModelsEndpoint.hashCode);
    _$hash = $jc(_$hash, structuredOutputMode.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiProviderProfileResponse')
          ..add('key', key)
          ..add('displayName', displayName)
          ..add('engine', engine)
          ..add('authMode', authMode)
          ..add('baseUrl', baseUrl)
          ..add('model', model)
          ..add('credentialConfigured', credentialConfigured)
          ..add('isActive', isActive)
          ..add('isFallback', isFallback)
          ..add('presetId', presetId)
          ..add('supportsVision', supportsVision)
          ..add('supportsModelsEndpoint', supportsModelsEndpoint)
          ..add('structuredOutputMode', structuredOutputMode)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class AiProviderProfileResponseBuilder
    implements
        Builder<AiProviderProfileResponse, AiProviderProfileResponseBuilder> {
  _$AiProviderProfileResponse? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  AiProviderEngine? _engine;
  AiProviderEngine? get engine => _$this._engine;
  set engine(AiProviderEngine? engine) => _$this._engine = engine;

  AiProviderAuthMode? _authMode;
  AiProviderAuthMode? get authMode => _$this._authMode;
  set authMode(AiProviderAuthMode? authMode) => _$this._authMode = authMode;

  String? _baseUrl;
  String? get baseUrl => _$this._baseUrl;
  set baseUrl(String? baseUrl) => _$this._baseUrl = baseUrl;

  String? _model;
  String? get model => _$this._model;
  set model(String? model) => _$this._model = model;

  bool? _credentialConfigured;
  bool? get credentialConfigured => _$this._credentialConfigured;
  set credentialConfigured(bool? credentialConfigured) =>
      _$this._credentialConfigured = credentialConfigured;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  bool? _isFallback;
  bool? get isFallback => _$this._isFallback;
  set isFallback(bool? isFallback) => _$this._isFallback = isFallback;

  String? _presetId;
  String? get presetId => _$this._presetId;
  set presetId(String? presetId) => _$this._presetId = presetId;

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

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  AiProviderProfileResponseBuilder() {
    AiProviderProfileResponse._defaults(this);
  }

  AiProviderProfileResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _displayName = $v.displayName;
      _engine = $v.engine;
      _authMode = $v.authMode;
      _baseUrl = $v.baseUrl;
      _model = $v.model;
      _credentialConfigured = $v.credentialConfigured;
      _isActive = $v.isActive;
      _isFallback = $v.isFallback;
      _presetId = $v.presetId;
      _supportsVision = $v.supportsVision;
      _supportsModelsEndpoint = $v.supportsModelsEndpoint;
      _structuredOutputMode = $v.structuredOutputMode;
      _createdAt = $v.createdAt;
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
    final _$result = _$v ??
        _$AiProviderProfileResponse._(
          key: BuiltValueNullFieldError.checkNotNull(
              key, r'AiProviderProfileResponse', 'key'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName, r'AiProviderProfileResponse', 'displayName'),
          engine: BuiltValueNullFieldError.checkNotNull(
              engine, r'AiProviderProfileResponse', 'engine'),
          authMode: BuiltValueNullFieldError.checkNotNull(
              authMode, r'AiProviderProfileResponse', 'authMode'),
          baseUrl: baseUrl,
          model: BuiltValueNullFieldError.checkNotNull(
              model, r'AiProviderProfileResponse', 'model'),
          credentialConfigured: BuiltValueNullFieldError.checkNotNull(
              credentialConfigured,
              r'AiProviderProfileResponse',
              'credentialConfigured'),
          isActive: BuiltValueNullFieldError.checkNotNull(
              isActive, r'AiProviderProfileResponse', 'isActive'),
          isFallback: BuiltValueNullFieldError.checkNotNull(
              isFallback, r'AiProviderProfileResponse', 'isFallback'),
          presetId: presetId,
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
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'AiProviderProfileResponse', 'createdAt'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'AiProviderProfileResponse', 'updatedAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
