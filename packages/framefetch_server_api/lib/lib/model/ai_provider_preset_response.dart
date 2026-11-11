//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:framefetch_server_api/lib/model/ai_provider_auth_mode.dart';
import 'package:framefetch_server_api/lib/model/ai_provider_suggested_model_response.dart';
import 'package:framefetch_server_api/lib/model/ai_provider_engine.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_provider_preset_response.g.dart';

/// AiProviderPresetResponse
///
/// Properties:
/// * [id]
/// * [engine]
/// * [displayName]
/// * [baseUrl]
/// * [authMode]
/// * [defaultModel]
/// * [suggestedModels]
/// * [supportsVision]
/// * [supportsModelsEndpoint]
/// * [structuredOutputMode]
/// * [endpointKind]
/// * [supportsCustomModelId]
/// * [keyIsolationNotice]
@BuiltValue()
abstract class AiProviderPresetResponse
    implements
        Built<AiProviderPresetResponse, AiProviderPresetResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'engine')
  AiProviderEngine get engine;
  // enum engineEnum {  volcengine,  deepseek,  openai,  };

  @BuiltValueField(wireName: r'display_name')
  String get displayName;

  @BuiltValueField(wireName: r'base_url')
  String get baseUrl;

  @BuiltValueField(wireName: r'auth_mode')
  AiProviderAuthMode get authMode;
  // enum authModeEnum {  api_key,  };

  @BuiltValueField(wireName: r'default_model')
  String get defaultModel;

  @BuiltValueField(wireName: r'suggested_models')
  BuiltList<AiProviderSuggestedModelResponse> get suggestedModels;

  @BuiltValueField(wireName: r'supports_vision')
  bool get supportsVision;

  @BuiltValueField(wireName: r'supports_models_endpoint')
  bool get supportsModelsEndpoint;

  @BuiltValueField(wireName: r'structured_output_mode')
  AiProviderPresetResponseStructuredOutputModeEnum get structuredOutputMode;
  // enum structuredOutputModeEnum {  json_schema,  json_object,  };

  @BuiltValueField(wireName: r'endpoint_kind')
  String get endpointKind;

  @BuiltValueField(wireName: r'supports_custom_model_id')
  bool get supportsCustomModelId;

  @BuiltValueField(wireName: r'key_isolation_notice')
  String get keyIsolationNotice;

  AiProviderPresetResponse._();

  factory AiProviderPresetResponse(
          [void updates(AiProviderPresetResponseBuilder b)]) =
      _$AiProviderPresetResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiProviderPresetResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiProviderPresetResponse> get serializer =>
      _$AiProviderPresetResponseSerializer();
}

class _$AiProviderPresetResponseSerializer
    implements PrimitiveSerializer<AiProviderPresetResponse> {
  @override
  final Iterable<Type> types = const [
    AiProviderPresetResponse,
    _$AiProviderPresetResponse
  ];

  @override
  final String wireName = r'AiProviderPresetResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiProviderPresetResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'engine';
    yield serializers.serialize(
      object.engine,
      specifiedType: const FullType(AiProviderEngine),
    );
    yield r'display_name';
    yield serializers.serialize(
      object.displayName,
      specifiedType: const FullType(String),
    );
    yield r'base_url';
    yield serializers.serialize(
      object.baseUrl,
      specifiedType: const FullType(String),
    );
    yield r'auth_mode';
    yield serializers.serialize(
      object.authMode,
      specifiedType: const FullType(AiProviderAuthMode),
    );
    yield r'default_model';
    yield serializers.serialize(
      object.defaultModel,
      specifiedType: const FullType(String),
    );
    yield r'suggested_models';
    yield serializers.serialize(
      object.suggestedModels,
      specifiedType: const FullType(
          BuiltList, [FullType(AiProviderSuggestedModelResponse)]),
    );
    yield r'supports_vision';
    yield serializers.serialize(
      object.supportsVision,
      specifiedType: const FullType(bool),
    );
    yield r'supports_models_endpoint';
    yield serializers.serialize(
      object.supportsModelsEndpoint,
      specifiedType: const FullType(bool),
    );
    yield r'structured_output_mode';
    yield serializers.serialize(
      object.structuredOutputMode,
      specifiedType:
          const FullType(AiProviderPresetResponseStructuredOutputModeEnum),
    );
    yield r'endpoint_kind';
    yield serializers.serialize(
      object.endpointKind,
      specifiedType: const FullType(String),
    );
    yield r'supports_custom_model_id';
    yield serializers.serialize(
      object.supportsCustomModelId,
      specifiedType: const FullType(bool),
    );
    yield r'key_isolation_notice';
    yield serializers.serialize(
      object.keyIsolationNotice,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AiProviderPresetResponse object, {
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
    required AiProviderPresetResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'engine':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiProviderEngine),
          ) as AiProviderEngine;
          result.engine = valueDes;
          break;
        case r'display_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.displayName = valueDes;
          break;
        case r'base_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.baseUrl = valueDes;
          break;
        case r'auth_mode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiProviderAuthMode),
          ) as AiProviderAuthMode;
          result.authMode = valueDes;
          break;
        case r'default_model':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.defaultModel = valueDes;
          break;
        case r'suggested_models':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(AiProviderSuggestedModelResponse)]),
          ) as BuiltList<AiProviderSuggestedModelResponse>;
          result.suggestedModels.replace(valueDes);
          break;
        case r'supports_vision':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.supportsVision = valueDes;
          break;
        case r'supports_models_endpoint':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.supportsModelsEndpoint = valueDes;
          break;
        case r'structured_output_mode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                AiProviderPresetResponseStructuredOutputModeEnum),
          ) as AiProviderPresetResponseStructuredOutputModeEnum;
          result.structuredOutputMode = valueDes;
          break;
        case r'endpoint_kind':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.endpointKind = valueDes;
          break;
        case r'supports_custom_model_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.supportsCustomModelId = valueDes;
          break;
        case r'key_isolation_notice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.keyIsolationNotice = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiProviderPresetResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiProviderPresetResponseBuilder();
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

class AiProviderPresetResponseStructuredOutputModeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'json_schema')
  static const AiProviderPresetResponseStructuredOutputModeEnum jsonSchema =
      _$aiProviderPresetResponseStructuredOutputModeEnum_jsonSchema;
  @BuiltValueEnumConst(wireName: r'json_object')
  static const AiProviderPresetResponseStructuredOutputModeEnum jsonObject =
      _$aiProviderPresetResponseStructuredOutputModeEnum_jsonObject;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const AiProviderPresetResponseStructuredOutputModeEnum
      unknownDefaultOpenApi =
      _$aiProviderPresetResponseStructuredOutputModeEnum_unknownDefaultOpenApi;

  static Serializer<AiProviderPresetResponseStructuredOutputModeEnum>
      get serializer =>
          _$aiProviderPresetResponseStructuredOutputModeEnumSerializer;

  const AiProviderPresetResponseStructuredOutputModeEnum._(String name)
      : super(name);

  static BuiltSet<AiProviderPresetResponseStructuredOutputModeEnum>
      get values => _$aiProviderPresetResponseStructuredOutputModeEnumValues;
  static AiProviderPresetResponseStructuredOutputModeEnum valueOf(
          String name) =>
      _$aiProviderPresetResponseStructuredOutputModeEnumValueOf(name);
}
