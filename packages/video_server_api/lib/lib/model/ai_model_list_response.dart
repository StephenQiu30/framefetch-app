//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/ai_model_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_model_list_response.g.dart';

/// AiModelListResponse
///
/// Properties:
/// * [items]
@BuiltValue()
abstract class AiModelListResponse
    implements Built<AiModelListResponse, AiModelListResponseBuilder> {
  @BuiltValueField(wireName: r'items')
  BuiltList<AiModelResponse> get items;

  AiModelListResponse._();

  factory AiModelListResponse([void updates(AiModelListResponseBuilder b)]) =
      _$AiModelListResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiModelListResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiModelListResponse> get serializer =>
      _$AiModelListResponseSerializer();
}

class _$AiModelListResponseSerializer
    implements PrimitiveSerializer<AiModelListResponse> {
  @override
  final Iterable<Type> types = const [
    AiModelListResponse,
    _$AiModelListResponse
  ];

  @override
  final String wireName = r'AiModelListResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiModelListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(AiModelResponse)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AiModelListResponse object, {
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
    required AiModelListResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(AiModelResponse)]),
          ) as BuiltList<AiModelResponse>;
          result.items.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiModelListResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiModelListResponseBuilder();
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
