//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_provider_suggested_model_response.g.dart';

/// AiProviderSuggestedModelResponse
///
/// Properties:
/// * [id]
/// * [label]
/// * [supportsVision]
/// * [notes]
@BuiltValue()
abstract class AiProviderSuggestedModelResponse
    implements
        Built<AiProviderSuggestedModelResponse,
            AiProviderSuggestedModelResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'label')
  String get label;

  @BuiltValueField(wireName: r'supports_vision')
  bool get supportsVision;

  @BuiltValueField(wireName: r'notes')
  String? get notes;

  AiProviderSuggestedModelResponse._();

  factory AiProviderSuggestedModelResponse(
          [void updates(AiProviderSuggestedModelResponseBuilder b)]) =
      _$AiProviderSuggestedModelResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiProviderSuggestedModelResponseBuilder b) =>
      b..notes = '';

  @BuiltValueSerializer(custom: true)
  static Serializer<AiProviderSuggestedModelResponse> get serializer =>
      _$AiProviderSuggestedModelResponseSerializer();
}

class _$AiProviderSuggestedModelResponseSerializer
    implements PrimitiveSerializer<AiProviderSuggestedModelResponse> {
  @override
  final Iterable<Type> types = const [
    AiProviderSuggestedModelResponse,
    _$AiProviderSuggestedModelResponse
  ];

  @override
  final String wireName = r'AiProviderSuggestedModelResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiProviderSuggestedModelResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'label';
    yield serializers.serialize(
      object.label,
      specifiedType: const FullType(String),
    );
    yield r'supports_vision';
    yield serializers.serialize(
      object.supportsVision,
      specifiedType: const FullType(bool),
    );
    if (object.notes != null) {
      yield r'notes';
      yield serializers.serialize(
        object.notes,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiProviderSuggestedModelResponse object, {
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
    required AiProviderSuggestedModelResponseBuilder result,
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
        case r'label':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.label = valueDes;
          break;
        case r'supports_vision':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.supportsVision = valueDes;
          break;
        case r'notes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.notes = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiProviderSuggestedModelResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiProviderSuggestedModelResponseBuilder();
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
