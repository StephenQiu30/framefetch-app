//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'heading_block.g.dart';

/// HeadingBlock
///
/// Properties:
/// * [id]
/// * [type]
/// * [level]
/// * [text]
@BuiltValue()
abstract class HeadingBlock
    implements Built<HeadingBlock, HeadingBlockBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'type')
  HeadingBlockTypeEnum get type;
  // enum typeEnum {  heading,  };

  @BuiltValueField(wireName: r'level')
  HeadingBlockLevelEnum get level;
  // enum levelEnum {  2,  3,  };

  @BuiltValueField(wireName: r'text')
  String get text;

  HeadingBlock._();

  factory HeadingBlock([void updates(HeadingBlockBuilder b)]) = _$HeadingBlock;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HeadingBlockBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<HeadingBlock> get serializer => _$HeadingBlockSerializer();
}

class _$HeadingBlockSerializer implements PrimitiveSerializer<HeadingBlock> {
  @override
  final Iterable<Type> types = const [HeadingBlock, _$HeadingBlock];

  @override
  final String wireName = r'HeadingBlock';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HeadingBlock object, {
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
      specifiedType: const FullType(HeadingBlockTypeEnum),
    );
    yield r'level';
    yield serializers.serialize(
      object.level,
      specifiedType: const FullType(HeadingBlockLevelEnum),
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
    HeadingBlock object, {
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
    required HeadingBlockBuilder result,
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
            specifiedType: const FullType(HeadingBlockTypeEnum),
          ) as HeadingBlockTypeEnum;
          result.type = valueDes;
          break;
        case r'level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(HeadingBlockLevelEnum),
          ) as HeadingBlockLevelEnum;
          result.level = valueDes;
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
  HeadingBlock deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = HeadingBlockBuilder();
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

class HeadingBlockTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'heading')
  static const HeadingBlockTypeEnum heading = _$headingBlockTypeEnum_heading;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const HeadingBlockTypeEnum unknownDefaultOpenApi =
      _$headingBlockTypeEnum_unknownDefaultOpenApi;

  static Serializer<HeadingBlockTypeEnum> get serializer =>
      _$headingBlockTypeEnumSerializer;

  const HeadingBlockTypeEnum._(String name) : super(name);

  static BuiltSet<HeadingBlockTypeEnum> get values =>
      _$headingBlockTypeEnumValues;
  static HeadingBlockTypeEnum valueOf(String name) =>
      _$headingBlockTypeEnumValueOf(name);
}

class HeadingBlockLevelEnum extends EnumClass {
  @BuiltValueEnumConst(wireNumber: 2)
  static const HeadingBlockLevelEnum number2 = _$headingBlockLevelEnum_number2;
  @BuiltValueEnumConst(wireNumber: 3)
  static const HeadingBlockLevelEnum number3 = _$headingBlockLevelEnum_number3;
  @BuiltValueEnumConst(wireNumber: 11184809, fallback: true)
  static const HeadingBlockLevelEnum unknownDefaultOpenApi =
      _$headingBlockLevelEnum_unknownDefaultOpenApi;

  static Serializer<HeadingBlockLevelEnum> get serializer =>
      _$headingBlockLevelEnumSerializer;

  const HeadingBlockLevelEnum._(String name) : super(name);

  static BuiltSet<HeadingBlockLevelEnum> get values =>
      _$headingBlockLevelEnumValues;
  static HeadingBlockLevelEnum valueOf(String name) =>
      _$headingBlockLevelEnumValueOf(name);
}
