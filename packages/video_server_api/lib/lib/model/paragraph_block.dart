//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paragraph_block.g.dart';

/// ParagraphBlock
///
/// Properties:
/// * [id]
/// * [type]
/// * [text]
@BuiltValue()
abstract class ParagraphBlock
    implements Built<ParagraphBlock, ParagraphBlockBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'type')
  ParagraphBlockTypeEnum get type;
  // enum typeEnum {  paragraph,  };

  @BuiltValueField(wireName: r'text')
  String get text;

  ParagraphBlock._();

  factory ParagraphBlock([void updates(ParagraphBlockBuilder b)]) =
      _$ParagraphBlock;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ParagraphBlockBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ParagraphBlock> get serializer =>
      _$ParagraphBlockSerializer();
}

class _$ParagraphBlockSerializer
    implements PrimitiveSerializer<ParagraphBlock> {
  @override
  final Iterable<Type> types = const [ParagraphBlock, _$ParagraphBlock];

  @override
  final String wireName = r'ParagraphBlock';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ParagraphBlock object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(ParagraphBlockTypeEnum),
    );
    yield r'text';
    yield serializers.serialize(
      object.text,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ParagraphBlock object, {
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
    required ParagraphBlockBuilder result,
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
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ParagraphBlockTypeEnum),
          ) as ParagraphBlockTypeEnum;
          result.type = valueDes;
          break;
        case r'text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.text = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ParagraphBlock deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ParagraphBlockBuilder();
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

class ParagraphBlockTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'paragraph')
  static const ParagraphBlockTypeEnum paragraph =
      _$paragraphBlockTypeEnum_paragraph;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ParagraphBlockTypeEnum unknownDefaultOpenApi =
      _$paragraphBlockTypeEnum_unknownDefaultOpenApi;

  static Serializer<ParagraphBlockTypeEnum> get serializer =>
      _$paragraphBlockTypeEnumSerializer;

  const ParagraphBlockTypeEnum._(String name) : super(name);

  static BuiltSet<ParagraphBlockTypeEnum> get values =>
      _$paragraphBlockTypeEnumValues;
  static ParagraphBlockTypeEnum valueOf(String name) =>
      _$paragraphBlockTypeEnumValueOf(name);
}
