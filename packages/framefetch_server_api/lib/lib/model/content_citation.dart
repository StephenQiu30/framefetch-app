//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'content_citation.g.dart';

/// ContentCitation
///
/// Properties:
/// * [blockId]
/// * [materialId]
/// * [segmentId]
/// * [quote]
@BuiltValue()
abstract class ContentCitation
    implements Built<ContentCitation, ContentCitationBuilder> {
  @BuiltValueField(wireName: r'block_id')
  String get blockId;

  @BuiltValueField(wireName: r'material_id')
  String get materialId;

  @BuiltValueField(wireName: r'segment_id')
  String get segmentId;

  @BuiltValueField(wireName: r'quote')
  String get quote;

  ContentCitation._();

  factory ContentCitation([void updates(ContentCitationBuilder b)]) =
      _$ContentCitation;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ContentCitationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ContentCitation> get serializer =>
      _$ContentCitationSerializer();
}

class _$ContentCitationSerializer
    implements PrimitiveSerializer<ContentCitation> {
  @override
  final Iterable<Type> types = const [ContentCitation, _$ContentCitation];

  @override
  final String wireName = r'ContentCitation';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ContentCitation object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'block_id';
    yield serializers.serialize(
      object.blockId,
      specifiedType: const FullType(String),
    );
    yield r'material_id';
    yield serializers.serialize(
      object.materialId,
      specifiedType: const FullType(String),
    );
    yield r'segment_id';
    yield serializers.serialize(
      object.segmentId,
      specifiedType: const FullType(String),
    );
    yield r'quote';
    yield serializers.serialize(
      object.quote,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ContentCitation object, {
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
    required ContentCitationBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'block_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.blockId = valueDes;
          break;
        case r'material_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.materialId = valueDes;
          break;
        case r'segment_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.segmentId = valueDes;
          break;
        case r'quote':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.quote = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ContentCitation deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ContentCitationBuilder();
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
