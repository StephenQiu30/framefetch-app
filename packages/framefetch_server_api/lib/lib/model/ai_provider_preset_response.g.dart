// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_provider_preset_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AiProviderPresetResponseStructuredOutputModeEnum
    _$aiProviderPresetResponseStructuredOutputModeEnum_jsonSchema =
    const AiProviderPresetResponseStructuredOutputModeEnum._('jsonSchema');
const AiProviderPresetResponseStructuredOutputModeEnum
    _$aiProviderPresetResponseStructuredOutputModeEnum_jsonObject =
    const AiProviderPresetResponseStructuredOutputModeEnum._('jsonObject');
const AiProviderPresetResponseStructuredOutputModeEnum
    _$aiProviderPresetResponseStructuredOutputModeEnum_unknownDefaultOpenApi =
    const AiProviderPresetResponseStructuredOutputModeEnum._(
        'unknownDefaultOpenApi');

AiProviderPresetResponseStructuredOutputModeEnum
    _$aiProviderPresetResponseStructuredOutputModeEnumValueOf(String name) {
  switch (name) {
    case 'jsonSchema':
      return _$aiProviderPresetResponseStructuredOutputModeEnum_jsonSchema;
    case 'jsonObject':
      return _$aiProviderPresetResponseStructuredOutputModeEnum_jsonObject;
    case 'unknownDefaultOpenApi':
      return _$aiProviderPresetResponseStructuredOutputModeEnum_unknownDefaultOpenApi;
    default:
      return _$aiProviderPresetResponseStructuredOutputModeEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<AiProviderPresetResponseStructuredOutputModeEnum>
    _$aiProviderPresetResponseStructuredOutputModeEnumValues = BuiltSet<
        AiProviderPresetResponseStructuredOutputModeEnum>(const <AiProviderPresetResponseStructuredOutputModeEnum>[
  _$aiProviderPresetResponseStructuredOutputModeEnum_jsonSchema,
  _$aiProviderPresetResponseStructuredOutputModeEnum_jsonObject,
  _$aiProviderPresetResponseStructuredOutputModeEnum_unknownDefaultOpenApi,
]);

Serializer<AiProviderPresetResponseStructuredOutputModeEnum>
    _$aiProviderPresetResponseStructuredOutputModeEnumSerializer =
    _$AiProviderPresetResponseStructuredOutputModeEnumSerializer();

class _$AiProviderPresetResponseStructuredOutputModeEnumSerializer
    implements
        PrimitiveSerializer<AiProviderPresetResponseStructuredOutputModeEnum> {
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
    AiProviderPresetResponseStructuredOutputModeEnum
  ];
  @override
  final String wireName = 'AiProviderPresetResponseStructuredOutputModeEnum';

  @override
  Object serialize(Serializers serializers,
          AiProviderPresetResponseStructuredOutputModeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AiProviderPresetResponseStructuredOutputModeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AiProviderPresetResponseStructuredOutputModeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AiProviderPresetResponse extends AiProviderPresetResponse {
  @override
  final String id;
  @override
  final AiProviderEngine engine;
  @override
  final String displayName;
  @override
  final String baseUrl;
  @override
  final AiProviderAuthMode authMode;
  @override
  final String defaultModel;
  @override
  final BuiltList<AiProviderSuggestedModelResponse> suggestedModels;
  @override
  final bool supportsVision;
  @override
  final bool supportsModelsEndpoint;
  @override
  final AiProviderPresetResponseStructuredOutputModeEnum structuredOutputMode;
  @override
  final String endpointKind;
  @override
  final bool supportsCustomModelId;
  @override
  final String keyIsolationNotice;

  factory _$AiProviderPresetResponse(
          [void Function(AiProviderPresetResponseBuilder)? updates]) =>
      (AiProviderPresetResponseBuilder()..update(updates))._build();

  _$AiProviderPresetResponse._(
      {required this.id,
      required this.engine,
      required this.displayName,
      required this.baseUrl,
      required this.authMode,
      required this.defaultModel,
      required this.suggestedModels,
      required this.supportsVision,
      required this.supportsModelsEndpoint,
      required this.structuredOutputMode,
      required this.endpointKind,
      required this.supportsCustomModelId,
      required this.keyIsolationNotice})
      : super._();
  @override
  AiProviderPresetResponse rebuild(
          void Function(AiProviderPresetResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiProviderPresetResponseBuilder toBuilder() =>
      AiProviderPresetResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiProviderPresetResponse &&
        id == other.id &&
        engine == other.engine &&
        displayName == other.displayName &&
        baseUrl == other.baseUrl &&
        authMode == other.authMode &&
        defaultModel == other.defaultModel &&
        suggestedModels == other.suggestedModels &&
        supportsVision == other.supportsVision &&
        supportsModelsEndpoint == other.supportsModelsEndpoint &&
        structuredOutputMode == other.structuredOutputMode &&
        endpointKind == other.endpointKind &&
        supportsCustomModelId == other.supportsCustomModelId &&
        keyIsolationNotice == other.keyIsolationNotice;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, engine.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, baseUrl.hashCode);
    _$hash = $jc(_$hash, authMode.hashCode);
    _$hash = $jc(_$hash, defaultModel.hashCode);
    _$hash = $jc(_$hash, suggestedModels.hashCode);
    _$hash = $jc(_$hash, supportsVision.hashCode);
    _$hash = $jc(_$hash, supportsModelsEndpoint.hashCode);
    _$hash = $jc(_$hash, structuredOutputMode.hashCode);
    _$hash = $jc(_$hash, endpointKind.hashCode);
    _$hash = $jc(_$hash, supportsCustomModelId.hashCode);
    _$hash = $jc(_$hash, keyIsolationNotice.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiProviderPresetResponse')
          ..add('id', id)
          ..add('engine', engine)
          ..add('displayName', displayName)
          ..add('baseUrl', baseUrl)
          ..add('authMode', authMode)
          ..add('defaultModel', defaultModel)
          ..add('suggestedModels', suggestedModels)
          ..add('supportsVision', supportsVision)
          ..add('supportsModelsEndpoint', supportsModelsEndpoint)
          ..add('structuredOutputMode', structuredOutputMode)
          ..add('endpointKind', endpointKind)
          ..add('supportsCustomModelId', supportsCustomModelId)
          ..add('keyIsolationNotice', keyIsolationNotice))
        .toString();
  }
}

class AiProviderPresetResponseBuilder
    implements
        Builder<AiProviderPresetResponse, AiProviderPresetResponseBuilder> {
  _$AiProviderPresetResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  AiProviderEngine? _engine;
  AiProviderEngine? get engine => _$this._engine;
  set engine(AiProviderEngine? engine) => _$this._engine = engine;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _baseUrl;
  String? get baseUrl => _$this._baseUrl;
  set baseUrl(String? baseUrl) => _$this._baseUrl = baseUrl;

  AiProviderAuthMode? _authMode;
  AiProviderAuthMode? get authMode => _$this._authMode;
  set authMode(AiProviderAuthMode? authMode) => _$this._authMode = authMode;

  String? _defaultModel;
  String? get defaultModel => _$this._defaultModel;
  set defaultModel(String? defaultModel) => _$this._defaultModel = defaultModel;

  ListBuilder<AiProviderSuggestedModelResponse>? _suggestedModels;
  ListBuilder<AiProviderSuggestedModelResponse> get suggestedModels =>
      _$this._suggestedModels ??=
          ListBuilder<AiProviderSuggestedModelResponse>();
  set suggestedModels(
          ListBuilder<AiProviderSuggestedModelResponse>? suggestedModels) =>
      _$this._suggestedModels = suggestedModels;

  bool? _supportsVision;
  bool? get supportsVision => _$this._supportsVision;
  set supportsVision(bool? supportsVision) =>
      _$this._supportsVision = supportsVision;

  bool? _supportsModelsEndpoint;
  bool? get supportsModelsEndpoint => _$this._supportsModelsEndpoint;
  set supportsModelsEndpoint(bool? supportsModelsEndpoint) =>
      _$this._supportsModelsEndpoint = supportsModelsEndpoint;

  AiProviderPresetResponseStructuredOutputModeEnum? _structuredOutputMode;
  AiProviderPresetResponseStructuredOutputModeEnum? get structuredOutputMode =>
      _$this._structuredOutputMode;
  set structuredOutputMode(
          AiProviderPresetResponseStructuredOutputModeEnum?
              structuredOutputMode) =>
      _$this._structuredOutputMode = structuredOutputMode;

  String? _endpointKind;
  String? get endpointKind => _$this._endpointKind;
  set endpointKind(String? endpointKind) => _$this._endpointKind = endpointKind;

  bool? _supportsCustomModelId;
  bool? get supportsCustomModelId => _$this._supportsCustomModelId;
  set supportsCustomModelId(bool? supportsCustomModelId) =>
      _$this._supportsCustomModelId = supportsCustomModelId;

  String? _keyIsolationNotice;
  String? get keyIsolationNotice => _$this._keyIsolationNotice;
  set keyIsolationNotice(String? keyIsolationNotice) =>
      _$this._keyIsolationNotice = keyIsolationNotice;

  AiProviderPresetResponseBuilder() {
    AiProviderPresetResponse._defaults(this);
  }

  AiProviderPresetResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _engine = $v.engine;
      _displayName = $v.displayName;
      _baseUrl = $v.baseUrl;
      _authMode = $v.authMode;
      _defaultModel = $v.defaultModel;
      _suggestedModels = $v.suggestedModels.toBuilder();
      _supportsVision = $v.supportsVision;
      _supportsModelsEndpoint = $v.supportsModelsEndpoint;
      _structuredOutputMode = $v.structuredOutputMode;
      _endpointKind = $v.endpointKind;
      _supportsCustomModelId = $v.supportsCustomModelId;
      _keyIsolationNotice = $v.keyIsolationNotice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiProviderPresetResponse other) {
    _$v = other as _$AiProviderPresetResponse;
  }

  @override
  void update(void Function(AiProviderPresetResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiProviderPresetResponse build() => _build();

  _$AiProviderPresetResponse _build() {
    _$AiProviderPresetResponse _$result;
    try {
      _$result = _$v ??
          _$AiProviderPresetResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AiProviderPresetResponse', 'id'),
            engine: BuiltValueNullFieldError.checkNotNull(
                engine, r'AiProviderPresetResponse', 'engine'),
            displayName: BuiltValueNullFieldError.checkNotNull(
                displayName, r'AiProviderPresetResponse', 'displayName'),
            baseUrl: BuiltValueNullFieldError.checkNotNull(
                baseUrl, r'AiProviderPresetResponse', 'baseUrl'),
            authMode: BuiltValueNullFieldError.checkNotNull(
                authMode, r'AiProviderPresetResponse', 'authMode'),
            defaultModel: BuiltValueNullFieldError.checkNotNull(
                defaultModel, r'AiProviderPresetResponse', 'defaultModel'),
            suggestedModels: suggestedModels.build(),
            supportsVision: BuiltValueNullFieldError.checkNotNull(
                supportsVision, r'AiProviderPresetResponse', 'supportsVision'),
            supportsModelsEndpoint: BuiltValueNullFieldError.checkNotNull(
                supportsModelsEndpoint,
                r'AiProviderPresetResponse',
                'supportsModelsEndpoint'),
            structuredOutputMode: BuiltValueNullFieldError.checkNotNull(
                structuredOutputMode,
                r'AiProviderPresetResponse',
                'structuredOutputMode'),
            endpointKind: BuiltValueNullFieldError.checkNotNull(
                endpointKind, r'AiProviderPresetResponse', 'endpointKind'),
            supportsCustomModelId: BuiltValueNullFieldError.checkNotNull(
                supportsCustomModelId,
                r'AiProviderPresetResponse',
                'supportsCustomModelId'),
            keyIsolationNotice: BuiltValueNullFieldError.checkNotNull(
                keyIsolationNotice,
                r'AiProviderPresetResponse',
                'keyIsolationNotice'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'suggestedModels';
        suggestedModels.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiProviderPresetResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
