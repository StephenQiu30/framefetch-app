//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'screenplay_finding_response.g.dart';

/// ScreenplayFindingResponse
///
/// Properties:
/// * [id]
/// * [title]
/// * [description]
@BuiltValue()
abstract class ScreenplayFindingResponse
    implements
        Built<ScreenplayFindingResponse, ScreenplayFindingResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'description')
  String get description;

  ScreenplayFindingResponse._();

  factory ScreenplayFindingResponse(
          [void updates(ScreenplayFindingResponseBuilder b)]) =
      _$ScreenplayFindingResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ScreenplayFindingResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ScreenplayFindingResponse> get serializer =>
      _$ScreenplayFindingResponseSerializer();
}

class _$ScreenplayFindingResponseSerializer
    implements PrimitiveSerializer<ScreenplayFindingResponse> {
  @override
  final Iterable<Type> types = const [
    ScreenplayFindingResponse,
    _$ScreenplayFindingResponse
  ];

  @override
  final String wireName = r'ScreenplayFindingResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ScreenplayFindingResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ScreenplayFindingResponse object, {
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
    required ScreenplayFindingResponseBuilder result,
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
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ScreenplayFindingResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ScreenplayFindingResponseBuilder();
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
