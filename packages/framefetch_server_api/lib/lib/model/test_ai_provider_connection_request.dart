//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:framefetch_server_api/lib/model/ai_provider_auth_mode.dart';
import 'package:framefetch_server_api/lib/model/ai_provider_engine.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'test_ai_provider_connection_request.g.dart';

/// TestAiProviderConnectionRequest
///
/// Properties:
/// * [providerKey]
/// * [engine]
/// * [authMode]
/// * [baseUrl]
/// * [model]
/// * [apiKey]
@BuiltValue()
abstract class TestAiProviderConnectionRequest
    implements
        Built<TestAiProviderConnectionRequest,
            TestAiProviderConnectionRequestBuilder> {
  @BuiltValueField(wireName: r'provider_key')
  String? get providerKey;

  @BuiltValueField(wireName: r'engine')
  AiProviderEngine? get engine;
  // enum engineEnum {  volcengine,  deepseek,  openai,  };

  @BuiltValueField(wireName: r'auth_mode')
  AiProviderAuthMode? get authMode;
  // enum authModeEnum {  api_key,  };

  @BuiltValueField(wireName: r'base_url')
  String? get baseUrl;

  @BuiltValueField(wireName: r'model')
  String? get model;

  @BuiltValueField(wireName: r'api_key')
  String? get apiKey;

  TestAiProviderConnectionRequest._();

  factory TestAiProviderConnectionRequest(
          [void updates(TestAiProviderConnectionRequestBuilder b)]) =
      _$TestAiProviderConnectionRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TestAiProviderConnectionRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TestAiProviderConnectionRequest> get serializer =>
      _$TestAiProviderConnectionRequestSerializer();
}

class _$TestAiProviderConnectionRequestSerializer
    implements PrimitiveSerializer<TestAiProviderConnectionRequest> {
  @override
  final Iterable<Type> types = const [
    TestAiProviderConnectionRequest,
    _$TestAiProviderConnectionRequest
  ];

  @override
  final String wireName = r'TestAiProviderConnectionRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TestAiProviderConnectionRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.providerKey != null) {
      yield r'provider_key';
      yield serializers.serialize(
        object.providerKey,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.engine != null) {
      yield r'engine';
      yield serializers.serialize(
        object.engine,
        specifiedType: const FullType.nullable(AiProviderEngine),
      );
    }
    if (object.authMode != null) {
      yield r'auth_mode';
      yield serializers.serialize(
        object.authMode,
        specifiedType: const FullType.nullable(AiProviderAuthMode),
      );
    }
    if (object.baseUrl != null) {
      yield r'base_url';
      yield serializers.serialize(
        object.baseUrl,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.model != null) {
      yield r'model';
      yield serializers.serialize(
        object.model,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.apiKey != null) {
      yield r'api_key';
      yield serializers.serialize(
        object.apiKey,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TestAiProviderConnectionRequest object, {
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
    required TestAiProviderConnectionRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'provider_key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.providerKey = valueDes;
          break;
        case r'engine':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AiProviderEngine),
          ) as AiProviderEngine?;
          if (valueDes == null) continue;
          result.engine = valueDes;
          break;
        case r'auth_mode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AiProviderAuthMode),
          ) as AiProviderAuthMode?;
          if (valueDes == null) continue;
          result.authMode = valueDes;
          break;
        case r'base_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.baseUrl = valueDes;
          break;
        case r'model':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.model = valueDes;
          break;
        case r'api_key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.apiKey = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TestAiProviderConnectionRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TestAiProviderConnectionRequestBuilder();
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
