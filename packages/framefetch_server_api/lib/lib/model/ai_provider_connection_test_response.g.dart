// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_provider_connection_test_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AiProviderConnectionTestResponseStatusEnum
    _$aiProviderConnectionTestResponseStatusEnum_ok =
    const AiProviderConnectionTestResponseStatusEnum._('ok');
const AiProviderConnectionTestResponseStatusEnum
    _$aiProviderConnectionTestResponseStatusEnum_modelsUnsupportedChatOk =
    const AiProviderConnectionTestResponseStatusEnum._(
        'modelsUnsupportedChatOk');
const AiProviderConnectionTestResponseStatusEnum
    _$aiProviderConnectionTestResponseStatusEnum_authFailed =
    const AiProviderConnectionTestResponseStatusEnum._('authFailed');
const AiProviderConnectionTestResponseStatusEnum
    _$aiProviderConnectionTestResponseStatusEnum_modelRejected =
    const AiProviderConnectionTestResponseStatusEnum._('modelRejected');
const AiProviderConnectionTestResponseStatusEnum
    _$aiProviderConnectionTestResponseStatusEnum_rateLimited =
    const AiProviderConnectionTestResponseStatusEnum._('rateLimited');
const AiProviderConnectionTestResponseStatusEnum
    _$aiProviderConnectionTestResponseStatusEnum_upstreamError =
    const AiProviderConnectionTestResponseStatusEnum._('upstreamError');
const AiProviderConnectionTestResponseStatusEnum
    _$aiProviderConnectionTestResponseStatusEnum_timeout =
    const AiProviderConnectionTestResponseStatusEnum._('timeout');
const AiProviderConnectionTestResponseStatusEnum
    _$aiProviderConnectionTestResponseStatusEnum_networkError =
    const AiProviderConnectionTestResponseStatusEnum._('networkError');
const AiProviderConnectionTestResponseStatusEnum
    _$aiProviderConnectionTestResponseStatusEnum_unknownDefaultOpenApi =
    const AiProviderConnectionTestResponseStatusEnum._('unknownDefaultOpenApi');

AiProviderConnectionTestResponseStatusEnum
    _$aiProviderConnectionTestResponseStatusEnumValueOf(String name) {
  switch (name) {
    case 'ok':
      return _$aiProviderConnectionTestResponseStatusEnum_ok;
    case 'modelsUnsupportedChatOk':
      return _$aiProviderConnectionTestResponseStatusEnum_modelsUnsupportedChatOk;
    case 'authFailed':
      return _$aiProviderConnectionTestResponseStatusEnum_authFailed;
    case 'modelRejected':
      return _$aiProviderConnectionTestResponseStatusEnum_modelRejected;
    case 'rateLimited':
      return _$aiProviderConnectionTestResponseStatusEnum_rateLimited;
    case 'upstreamError':
      return _$aiProviderConnectionTestResponseStatusEnum_upstreamError;
    case 'timeout':
      return _$aiProviderConnectionTestResponseStatusEnum_timeout;
    case 'networkError':
      return _$aiProviderConnectionTestResponseStatusEnum_networkError;
    case 'unknownDefaultOpenApi':
      return _$aiProviderConnectionTestResponseStatusEnum_unknownDefaultOpenApi;
    default:
      return _$aiProviderConnectionTestResponseStatusEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<AiProviderConnectionTestResponseStatusEnum>
    _$aiProviderConnectionTestResponseStatusEnumValues = BuiltSet<
        AiProviderConnectionTestResponseStatusEnum>(const <AiProviderConnectionTestResponseStatusEnum>[
  _$aiProviderConnectionTestResponseStatusEnum_ok,
  _$aiProviderConnectionTestResponseStatusEnum_modelsUnsupportedChatOk,
  _$aiProviderConnectionTestResponseStatusEnum_authFailed,
  _$aiProviderConnectionTestResponseStatusEnum_modelRejected,
  _$aiProviderConnectionTestResponseStatusEnum_rateLimited,
  _$aiProviderConnectionTestResponseStatusEnum_upstreamError,
  _$aiProviderConnectionTestResponseStatusEnum_timeout,
  _$aiProviderConnectionTestResponseStatusEnum_networkError,
  _$aiProviderConnectionTestResponseStatusEnum_unknownDefaultOpenApi,
]);

const AiProviderConnectionTestResponseStructuredOutputModeEnum
    _$aiProviderConnectionTestResponseStructuredOutputModeEnum_jsonSchema =
    const AiProviderConnectionTestResponseStructuredOutputModeEnum._(
        'jsonSchema');
const AiProviderConnectionTestResponseStructuredOutputModeEnum
    _$aiProviderConnectionTestResponseStructuredOutputModeEnum_jsonObject =
    const AiProviderConnectionTestResponseStructuredOutputModeEnum._(
        'jsonObject');
const AiProviderConnectionTestResponseStructuredOutputModeEnum
    _$aiProviderConnectionTestResponseStructuredOutputModeEnum_unknownDefaultOpenApi =
    const AiProviderConnectionTestResponseStructuredOutputModeEnum._(
        'unknownDefaultOpenApi');

AiProviderConnectionTestResponseStructuredOutputModeEnum
    _$aiProviderConnectionTestResponseStructuredOutputModeEnumValueOf(
        String name) {
  switch (name) {
    case 'jsonSchema':
      return _$aiProviderConnectionTestResponseStructuredOutputModeEnum_jsonSchema;
    case 'jsonObject':
      return _$aiProviderConnectionTestResponseStructuredOutputModeEnum_jsonObject;
    case 'unknownDefaultOpenApi':
      return _$aiProviderConnectionTestResponseStructuredOutputModeEnum_unknownDefaultOpenApi;
    default:
      return _$aiProviderConnectionTestResponseStructuredOutputModeEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<AiProviderConnectionTestResponseStructuredOutputModeEnum>
    _$aiProviderConnectionTestResponseStructuredOutputModeEnumValues = BuiltSet<
        AiProviderConnectionTestResponseStructuredOutputModeEnum>(const <AiProviderConnectionTestResponseStructuredOutputModeEnum>[
  _$aiProviderConnectionTestResponseStructuredOutputModeEnum_jsonSchema,
  _$aiProviderConnectionTestResponseStructuredOutputModeEnum_jsonObject,
  _$aiProviderConnectionTestResponseStructuredOutputModeEnum_unknownDefaultOpenApi,
]);

Serializer<AiProviderConnectionTestResponseStatusEnum>
    _$aiProviderConnectionTestResponseStatusEnumSerializer =
    _$AiProviderConnectionTestResponseStatusEnumSerializer();
Serializer<AiProviderConnectionTestResponseStructuredOutputModeEnum>
    _$aiProviderConnectionTestResponseStructuredOutputModeEnumSerializer =
    _$AiProviderConnectionTestResponseStructuredOutputModeEnumSerializer();

class _$AiProviderConnectionTestResponseStatusEnumSerializer
    implements PrimitiveSerializer<AiProviderConnectionTestResponseStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'ok': 'ok',
    'modelsUnsupportedChatOk': 'models_unsupported_chat_ok',
    'authFailed': 'auth_failed',
    'modelRejected': 'model_rejected',
    'rateLimited': 'rate_limited',
    'upstreamError': 'upstream_error',
    'timeout': 'timeout',
    'networkError': 'network_error',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'ok': 'ok',
    'models_unsupported_chat_ok': 'modelsUnsupportedChatOk',
    'auth_failed': 'authFailed',
    'model_rejected': 'modelRejected',
    'rate_limited': 'rateLimited',
    'upstream_error': 'upstreamError',
    'timeout': 'timeout',
    'network_error': 'networkError',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[
    AiProviderConnectionTestResponseStatusEnum
  ];
  @override
  final String wireName = 'AiProviderConnectionTestResponseStatusEnum';

  @override
  Object serialize(Serializers serializers,
          AiProviderConnectionTestResponseStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AiProviderConnectionTestResponseStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AiProviderConnectionTestResponseStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AiProviderConnectionTestResponseStructuredOutputModeEnumSerializer
    implements
        PrimitiveSerializer<
            AiProviderConnectionTestResponseStructuredOutputModeEnum> {
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
    AiProviderConnectionTestResponseStructuredOutputModeEnum
  ];
  @override
  final String wireName =
      'AiProviderConnectionTestResponseStructuredOutputModeEnum';

  @override
  Object serialize(Serializers serializers,
          AiProviderConnectionTestResponseStructuredOutputModeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AiProviderConnectionTestResponseStructuredOutputModeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AiProviderConnectionTestResponseStructuredOutputModeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AiProviderConnectionTestResponse
    extends AiProviderConnectionTestResponse {
  @override
  final bool ok;
  @override
  final AiProviderConnectionTestResponseStatusEnum status;
  @override
  final int? httpStatus;
  @override
  final String? presetId;
  @override
  final bool supportsVision;
  @override
  final AiProviderConnectionTestResponseStructuredOutputModeEnum
      structuredOutputMode;
  @override
  final bool modelsEndpointSupported;
  @override
  final bool chatEndpointReachable;
  @override
  final BuiltList<String> discoveredModels;
  @override
  final int? latencyMs;
  @override
  final String visionNotice;
  @override
  final String capabilityNotice;
  @override
  final String message;

  factory _$AiProviderConnectionTestResponse(
          [void Function(AiProviderConnectionTestResponseBuilder)? updates]) =>
      (AiProviderConnectionTestResponseBuilder()..update(updates))._build();

  _$AiProviderConnectionTestResponse._(
      {required this.ok,
      required this.status,
      this.httpStatus,
      this.presetId,
      required this.supportsVision,
      required this.structuredOutputMode,
      required this.modelsEndpointSupported,
      required this.chatEndpointReachable,
      required this.discoveredModels,
      this.latencyMs,
      required this.visionNotice,
      required this.capabilityNotice,
      required this.message})
      : super._();
  @override
  AiProviderConnectionTestResponse rebuild(
          void Function(AiProviderConnectionTestResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiProviderConnectionTestResponseBuilder toBuilder() =>
      AiProviderConnectionTestResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiProviderConnectionTestResponse &&
        ok == other.ok &&
        status == other.status &&
        httpStatus == other.httpStatus &&
        presetId == other.presetId &&
        supportsVision == other.supportsVision &&
        structuredOutputMode == other.structuredOutputMode &&
        modelsEndpointSupported == other.modelsEndpointSupported &&
        chatEndpointReachable == other.chatEndpointReachable &&
        discoveredModels == other.discoveredModels &&
        latencyMs == other.latencyMs &&
        visionNotice == other.visionNotice &&
        capabilityNotice == other.capabilityNotice &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ok.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, httpStatus.hashCode);
    _$hash = $jc(_$hash, presetId.hashCode);
    _$hash = $jc(_$hash, supportsVision.hashCode);
    _$hash = $jc(_$hash, structuredOutputMode.hashCode);
    _$hash = $jc(_$hash, modelsEndpointSupported.hashCode);
    _$hash = $jc(_$hash, chatEndpointReachable.hashCode);
    _$hash = $jc(_$hash, discoveredModels.hashCode);
    _$hash = $jc(_$hash, latencyMs.hashCode);
    _$hash = $jc(_$hash, visionNotice.hashCode);
    _$hash = $jc(_$hash, capabilityNotice.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiProviderConnectionTestResponse')
          ..add('ok', ok)
          ..add('status', status)
          ..add('httpStatus', httpStatus)
          ..add('presetId', presetId)
          ..add('supportsVision', supportsVision)
          ..add('structuredOutputMode', structuredOutputMode)
          ..add('modelsEndpointSupported', modelsEndpointSupported)
          ..add('chatEndpointReachable', chatEndpointReachable)
          ..add('discoveredModels', discoveredModels)
          ..add('latencyMs', latencyMs)
          ..add('visionNotice', visionNotice)
          ..add('capabilityNotice', capabilityNotice)
          ..add('message', message))
        .toString();
  }
}

class AiProviderConnectionTestResponseBuilder
    implements
        Builder<AiProviderConnectionTestResponse,
            AiProviderConnectionTestResponseBuilder> {
  _$AiProviderConnectionTestResponse? _$v;

  bool? _ok;
  bool? get ok => _$this._ok;
  set ok(bool? ok) => _$this._ok = ok;

  AiProviderConnectionTestResponseStatusEnum? _status;
  AiProviderConnectionTestResponseStatusEnum? get status => _$this._status;
  set status(AiProviderConnectionTestResponseStatusEnum? status) =>
      _$this._status = status;

  int? _httpStatus;
  int? get httpStatus => _$this._httpStatus;
  set httpStatus(int? httpStatus) => _$this._httpStatus = httpStatus;

  String? _presetId;
  String? get presetId => _$this._presetId;
  set presetId(String? presetId) => _$this._presetId = presetId;

  bool? _supportsVision;
  bool? get supportsVision => _$this._supportsVision;
  set supportsVision(bool? supportsVision) =>
      _$this._supportsVision = supportsVision;

  AiProviderConnectionTestResponseStructuredOutputModeEnum?
      _structuredOutputMode;
  AiProviderConnectionTestResponseStructuredOutputModeEnum?
      get structuredOutputMode => _$this._structuredOutputMode;
  set structuredOutputMode(
          AiProviderConnectionTestResponseStructuredOutputModeEnum?
              structuredOutputMode) =>
      _$this._structuredOutputMode = structuredOutputMode;

  bool? _modelsEndpointSupported;
  bool? get modelsEndpointSupported => _$this._modelsEndpointSupported;
  set modelsEndpointSupported(bool? modelsEndpointSupported) =>
      _$this._modelsEndpointSupported = modelsEndpointSupported;

  bool? _chatEndpointReachable;
  bool? get chatEndpointReachable => _$this._chatEndpointReachable;
  set chatEndpointReachable(bool? chatEndpointReachable) =>
      _$this._chatEndpointReachable = chatEndpointReachable;

  ListBuilder<String>? _discoveredModels;
  ListBuilder<String> get discoveredModels =>
      _$this._discoveredModels ??= ListBuilder<String>();
  set discoveredModels(ListBuilder<String>? discoveredModels) =>
      _$this._discoveredModels = discoveredModels;

  int? _latencyMs;
  int? get latencyMs => _$this._latencyMs;
  set latencyMs(int? latencyMs) => _$this._latencyMs = latencyMs;

  String? _visionNotice;
  String? get visionNotice => _$this._visionNotice;
  set visionNotice(String? visionNotice) => _$this._visionNotice = visionNotice;

  String? _capabilityNotice;
  String? get capabilityNotice => _$this._capabilityNotice;
  set capabilityNotice(String? capabilityNotice) =>
      _$this._capabilityNotice = capabilityNotice;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AiProviderConnectionTestResponseBuilder() {
    AiProviderConnectionTestResponse._defaults(this);
  }

  AiProviderConnectionTestResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ok = $v.ok;
      _status = $v.status;
      _httpStatus = $v.httpStatus;
      _presetId = $v.presetId;
      _supportsVision = $v.supportsVision;
      _structuredOutputMode = $v.structuredOutputMode;
      _modelsEndpointSupported = $v.modelsEndpointSupported;
      _chatEndpointReachable = $v.chatEndpointReachable;
      _discoveredModels = $v.discoveredModels.toBuilder();
      _latencyMs = $v.latencyMs;
      _visionNotice = $v.visionNotice;
      _capabilityNotice = $v.capabilityNotice;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiProviderConnectionTestResponse other) {
    _$v = other as _$AiProviderConnectionTestResponse;
  }

  @override
  void update(void Function(AiProviderConnectionTestResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiProviderConnectionTestResponse build() => _build();

  _$AiProviderConnectionTestResponse _build() {
    _$AiProviderConnectionTestResponse _$result;
    try {
      _$result = _$v ??
          _$AiProviderConnectionTestResponse._(
            ok: BuiltValueNullFieldError.checkNotNull(
                ok, r'AiProviderConnectionTestResponse', 'ok'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'AiProviderConnectionTestResponse', 'status'),
            httpStatus: httpStatus,
            presetId: presetId,
            supportsVision: BuiltValueNullFieldError.checkNotNull(
                supportsVision,
                r'AiProviderConnectionTestResponse',
                'supportsVision'),
            structuredOutputMode: BuiltValueNullFieldError.checkNotNull(
                structuredOutputMode,
                r'AiProviderConnectionTestResponse',
                'structuredOutputMode'),
            modelsEndpointSupported: BuiltValueNullFieldError.checkNotNull(
                modelsEndpointSupported,
                r'AiProviderConnectionTestResponse',
                'modelsEndpointSupported'),
            chatEndpointReachable: BuiltValueNullFieldError.checkNotNull(
                chatEndpointReachable,
                r'AiProviderConnectionTestResponse',
                'chatEndpointReachable'),
            discoveredModels: discoveredModels.build(),
            latencyMs: latencyMs,
            visionNotice: BuiltValueNullFieldError.checkNotNull(visionNotice,
                r'AiProviderConnectionTestResponse', 'visionNotice'),
            capabilityNotice: BuiltValueNullFieldError.checkNotNull(
                capabilityNotice,
                r'AiProviderConnectionTestResponse',
                'capabilityNotice'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'AiProviderConnectionTestResponse', 'message'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'discoveredModels';
        discoveredModels.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiProviderConnectionTestResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
