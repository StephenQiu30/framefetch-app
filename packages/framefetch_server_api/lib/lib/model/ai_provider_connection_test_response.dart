//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_provider_connection_test_response.g.dart';

/// AiProviderConnectionTestResponse
///
/// Properties:
/// * [ok]
/// * [status]
/// * [httpStatus]
/// * [presetId]
/// * [supportsVision]
/// * [structuredOutputMode]
/// * [modelsEndpointSupported]
/// * [chatEndpointReachable]
/// * [discoveredModels]
/// * [latencyMs]
/// * [visionNotice]
/// * [capabilityNotice]
/// * [message]
@BuiltValue()
abstract class AiProviderConnectionTestResponse
    implements
        Built<AiProviderConnectionTestResponse,
            AiProviderConnectionTestResponseBuilder> {
  @BuiltValueField(wireName: r'ok')
  bool get ok;

  @BuiltValueField(wireName: r'status')
  AiProviderConnectionTestResponseStatusEnum get status;
  // enum statusEnum {  ok,  models_unsupported_chat_ok,  auth_failed,  model_rejected,  rate_limited,  upstream_error,  timeout,  network_error,  };

  @BuiltValueField(wireName: r'http_status')
  int? get httpStatus;

  @BuiltValueField(wireName: r'preset_id')
  String? get presetId;

  @BuiltValueField(wireName: r'supports_vision')
  bool get supportsVision;

  @BuiltValueField(wireName: r'structured_output_mode')
  AiProviderConnectionTestResponseStructuredOutputModeEnum
      get structuredOutputMode;
  // enum structuredOutputModeEnum {  json_schema,  json_object,  };

  @BuiltValueField(wireName: r'models_endpoint_supported')
  bool get modelsEndpointSupported;

  @BuiltValueField(wireName: r'chat_endpoint_reachable')
  bool get chatEndpointReachable;

  @BuiltValueField(wireName: r'discovered_models')
  BuiltList<String> get discoveredModels;

  @BuiltValueField(wireName: r'latency_ms')
  int? get latencyMs;

  @BuiltValueField(wireName: r'vision_notice')
  String get visionNotice;

  @BuiltValueField(wireName: r'capability_notice')
  String get capabilityNotice;

  @BuiltValueField(wireName: r'message')
  String get message;

  AiProviderConnectionTestResponse._();

  factory AiProviderConnectionTestResponse(
          [void updates(AiProviderConnectionTestResponseBuilder b)]) =
      _$AiProviderConnectionTestResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiProviderConnectionTestResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiProviderConnectionTestResponse> get serializer =>
      _$AiProviderConnectionTestResponseSerializer();
}

class _$AiProviderConnectionTestResponseSerializer
    implements PrimitiveSerializer<AiProviderConnectionTestResponse> {
  @override
  final Iterable<Type> types = const [
    AiProviderConnectionTestResponse,
    _$AiProviderConnectionTestResponse
  ];

  @override
  final String wireName = r'AiProviderConnectionTestResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiProviderConnectionTestResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'ok';
    yield serializers.serialize(
      object.ok,
      specifiedType: const FullType(bool),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(AiProviderConnectionTestResponseStatusEnum),
    );
    yield r'http_status';
    yield object.httpStatus == null
        ? null
        : serializers.serialize(
            object.httpStatus,
            specifiedType: const FullType.nullable(int),
          );
    yield r'preset_id';
    yield object.presetId == null
        ? null
        : serializers.serialize(
            object.presetId,
            specifiedType: const FullType.nullable(String),
          );
    yield r'supports_vision';
    yield serializers.serialize(
      object.supportsVision,
      specifiedType: const FullType(bool),
    );
    yield r'structured_output_mode';
    yield serializers.serialize(
      object.structuredOutputMode,
      specifiedType: const FullType(
          AiProviderConnectionTestResponseStructuredOutputModeEnum),
    );
    yield r'models_endpoint_supported';
    yield serializers.serialize(
      object.modelsEndpointSupported,
      specifiedType: const FullType(bool),
    );
    yield r'chat_endpoint_reachable';
    yield serializers.serialize(
      object.chatEndpointReachable,
      specifiedType: const FullType(bool),
    );
    yield r'discovered_models';
    yield serializers.serialize(
      object.discoveredModels,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'latency_ms';
    yield object.latencyMs == null
        ? null
        : serializers.serialize(
            object.latencyMs,
            specifiedType: const FullType.nullable(int),
          );
    yield r'vision_notice';
    yield serializers.serialize(
      object.visionNotice,
      specifiedType: const FullType(String),
    );
    yield r'capability_notice';
    yield serializers.serialize(
      object.capabilityNotice,
      specifiedType: const FullType(String),
    );
    yield r'message';
    yield serializers.serialize(
      object.message,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AiProviderConnectionTestResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiProviderConnectionTestResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'ok':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.ok = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(AiProviderConnectionTestResponseStatusEnum),
          ) as AiProviderConnectionTestResponseStatusEnum;
          result.status = valueDes;
          break;
        case r'http_status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.httpStatus = valueDes;
          break;
        case r'preset_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.presetId = valueDes;
          break;
        case r'supports_vision':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.supportsVision = valueDes;
          break;
        case r'structured_output_mode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                AiProviderConnectionTestResponseStructuredOutputModeEnum),
          ) as AiProviderConnectionTestResponseStructuredOutputModeEnum;
          result.structuredOutputMode = valueDes;
          break;
        case r'models_endpoint_supported':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.modelsEndpointSupported = valueDes;
          break;
        case r'chat_endpoint_reachable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.chatEndpointReachable = valueDes;
          break;
        case r'discovered_models':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.discoveredModels.replace(valueDes);
          break;
        case r'latency_ms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.latencyMs = valueDes;
          break;
        case r'vision_notice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.visionNotice = valueDes;
          break;
        case r'capability_notice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.capabilityNotice = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiProviderConnectionTestResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiProviderConnectionTestResponseBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

class AiProviderConnectionTestResponseStatusEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'ok')
  static const AiProviderConnectionTestResponseStatusEnum ok =
      _$aiProviderConnectionTestResponseStatusEnum_ok;
  @BuiltValueEnumConst(wireName: r'models_unsupported_chat_ok')
  static const AiProviderConnectionTestResponseStatusEnum
      modelsUnsupportedChatOk =
      _$aiProviderConnectionTestResponseStatusEnum_modelsUnsupportedChatOk;
  @BuiltValueEnumConst(wireName: r'auth_failed')
  static const AiProviderConnectionTestResponseStatusEnum authFailed =
      _$aiProviderConnectionTestResponseStatusEnum_authFailed;
  @BuiltValueEnumConst(wireName: r'model_rejected')
  static const AiProviderConnectionTestResponseStatusEnum modelRejected =
      _$aiProviderConnectionTestResponseStatusEnum_modelRejected;
  @BuiltValueEnumConst(wireName: r'rate_limited')
  static const AiProviderConnectionTestResponseStatusEnum rateLimited =
      _$aiProviderConnectionTestResponseStatusEnum_rateLimited;
  @BuiltValueEnumConst(wireName: r'upstream_error')
  static const AiProviderConnectionTestResponseStatusEnum upstreamError =
      _$aiProviderConnectionTestResponseStatusEnum_upstreamError;
  @BuiltValueEnumConst(wireName: r'timeout')
  static const AiProviderConnectionTestResponseStatusEnum timeout =
      _$aiProviderConnectionTestResponseStatusEnum_timeout;
  @BuiltValueEnumConst(wireName: r'network_error')
  static const AiProviderConnectionTestResponseStatusEnum networkError =
      _$aiProviderConnectionTestResponseStatusEnum_networkError;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const AiProviderConnectionTestResponseStatusEnum
      unknownDefaultOpenApi =
      _$aiProviderConnectionTestResponseStatusEnum_unknownDefaultOpenApi;

  static Serializer<AiProviderConnectionTestResponseStatusEnum>
      get serializer => _$aiProviderConnectionTestResponseStatusEnumSerializer;

  const AiProviderConnectionTestResponseStatusEnum._(String name) : super(name);

  static BuiltSet<AiProviderConnectionTestResponseStatusEnum> get values =>
      _$aiProviderConnectionTestResponseStatusEnumValues;
  static AiProviderConnectionTestResponseStatusEnum valueOf(String name) =>
      _$aiProviderConnectionTestResponseStatusEnumValueOf(name);
}

class AiProviderConnectionTestResponseStructuredOutputModeEnum
    extends EnumClass {
  @BuiltValueEnumConst(wireName: r'json_schema')
  static const AiProviderConnectionTestResponseStructuredOutputModeEnum
      jsonSchema =
      _$aiProviderConnectionTestResponseStructuredOutputModeEnum_jsonSchema;
  @BuiltValueEnumConst(wireName: r'json_object')
  static const AiProviderConnectionTestResponseStructuredOutputModeEnum
      jsonObject =
      _$aiProviderConnectionTestResponseStructuredOutputModeEnum_jsonObject;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const AiProviderConnectionTestResponseStructuredOutputModeEnum
      unknownDefaultOpenApi =
      _$aiProviderConnectionTestResponseStructuredOutputModeEnum_unknownDefaultOpenApi;

  static Serializer<AiProviderConnectionTestResponseStructuredOutputModeEnum>
      get serializer =>
          _$aiProviderConnectionTestResponseStructuredOutputModeEnumSerializer;

  const AiProviderConnectionTestResponseStructuredOutputModeEnum._(String name)
      : super(name);

  static BuiltSet<AiProviderConnectionTestResponseStructuredOutputModeEnum>
      get values =>
          _$aiProviderConnectionTestResponseStructuredOutputModeEnumValues;
  static AiProviderConnectionTestResponseStructuredOutputModeEnum valueOf(
          String name) =>
      _$aiProviderConnectionTestResponseStructuredOutputModeEnumValueOf(name);
}
