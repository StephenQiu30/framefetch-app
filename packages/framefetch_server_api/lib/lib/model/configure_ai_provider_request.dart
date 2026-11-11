//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'configure_ai_provider_request.g.dart';

/// ConfigureAiProviderRequest
///
/// Properties:
/// * [presetId]
/// * [model]
/// * [apiKey]
/// * [activate]
@BuiltValue()
abstract class ConfigureAiProviderRequest
    implements
        Built<ConfigureAiProviderRequest, ConfigureAiProviderRequestBuilder> {
  @BuiltValueField(wireName: r'preset_id')
  String? get presetId;

  @BuiltValueField(wireName: r'model')
  String? get model;

  @BuiltValueField(wireName: r'api_key')
  String? get apiKey;

  @BuiltValueField(wireName: r'activate')
  bool? get activate;

  ConfigureAiProviderRequest._();

  factory ConfigureAiProviderRequest(
          [void updates(ConfigureAiProviderRequestBuilder b)]) =
      _$ConfigureAiProviderRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConfigureAiProviderRequestBuilder b) =>
      b..activate = true;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConfigureAiProviderRequest> get serializer =>
      _$ConfigureAiProviderRequestSerializer();
}

class _$ConfigureAiProviderRequestSerializer
    implements PrimitiveSerializer<ConfigureAiProviderRequest> {
  @override
  final Iterable<Type> types = const [
    ConfigureAiProviderRequest,
    _$ConfigureAiProviderRequest
  ];

  @override
  final String wireName = r'ConfigureAiProviderRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConfigureAiProviderRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.presetId != null) {
      yield r'preset_id';
      yield serializers.serialize(
        object.presetId,
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
    if (object.activate != null) {
      yield r'activate';
      yield serializers.serialize(
        object.activate,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ConfigureAiProviderRequest object, {
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
    required ConfigureAiProviderRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'preset_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.presetId = valueDes;
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
        case r'activate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.activate = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConfigureAiProviderRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConfigureAiProviderRequestBuilder();
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
