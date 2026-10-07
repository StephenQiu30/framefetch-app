//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_model_response.g.dart';

/// AiModelResponse
///
/// Properties:
/// * [id]
/// * [name]
/// * [contextLength]
/// * [inputModalities]
/// * [outputModalities]
/// * [supportedParameters]
@BuiltValue()
abstract class AiModelResponse
    implements Built<AiModelResponse, AiModelResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'context_length')
  int get contextLength;

  @BuiltValueField(wireName: r'input_modalities')
  BuiltList<String> get inputModalities;

  @BuiltValueField(wireName: r'output_modalities')
  BuiltList<String> get outputModalities;

  @BuiltValueField(wireName: r'supported_parameters')
  BuiltList<String> get supportedParameters;

  AiModelResponse._();

  factory AiModelResponse([void updates(AiModelResponseBuilder b)]) =
      _$AiModelResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiModelResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiModelResponse> get serializer =>
      _$AiModelResponseSerializer();
}

class _$AiModelResponseSerializer
    implements PrimitiveSerializer<AiModelResponse> {
  @override
  final Iterable<Type> types = const [AiModelResponse, _$AiModelResponse];

  @override
  final String wireName = r'AiModelResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiModelResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'context_length';
    yield serializers.serialize(
      object.contextLength,
      specifiedType: const FullType(int),
    );
    yield r'input_modalities';
    yield serializers.serialize(
      object.inputModalities,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'output_modalities';
    yield serializers.serialize(
      object.outputModalities,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'supported_parameters';
    yield serializers.serialize(
      object.supportedParameters,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AiModelResponse object, {
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
    required AiModelResponseBuilder result,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'context_length':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.contextLength = valueDes;
          break;
        case r'input_modalities':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.inputModalities.replace(valueDes);
          break;
        case r'output_modalities':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.outputModalities.replace(valueDes);
          break;
        case r'supported_parameters':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.supportedParameters.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiModelResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiModelResponseBuilder();
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
