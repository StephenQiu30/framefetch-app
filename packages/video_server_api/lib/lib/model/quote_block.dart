//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'quote_block.g.dart';

/// QuoteBlock
///
/// Properties:
/// * [id]
/// * [type]
/// * [text]
@BuiltValue()
abstract class QuoteBlock implements Built<QuoteBlock, QuoteBlockBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'type')
  QuoteBlockTypeEnum get type;
  // enum typeEnum {  quote,  };

  @BuiltValueField(wireName: r'text')
  String get text;

  QuoteBlock._();

  factory QuoteBlock([void updates(QuoteBlockBuilder b)]) = _$QuoteBlock;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(QuoteBlockBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<QuoteBlock> get serializer => _$QuoteBlockSerializer();
}

class _$QuoteBlockSerializer implements PrimitiveSerializer<QuoteBlock> {
  @override
  final Iterable<Type> types = const [QuoteBlock, _$QuoteBlock];

  @override
  final String wireName = r'QuoteBlock';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    QuoteBlock object, {
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
      specifiedType: const FullType(QuoteBlockTypeEnum),
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
    QuoteBlock object, {
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
    required QuoteBlockBuilder result,
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
            specifiedType: const FullType(QuoteBlockTypeEnum),
          ) as QuoteBlockTypeEnum;
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
  QuoteBlock deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = QuoteBlockBuilder();
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

class QuoteBlockTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'quote')
  static const QuoteBlockTypeEnum quote = _$quoteBlockTypeEnum_quote;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const QuoteBlockTypeEnum unknownDefaultOpenApi =
      _$quoteBlockTypeEnum_unknownDefaultOpenApi;

  static Serializer<QuoteBlockTypeEnum> get serializer =>
      _$quoteBlockTypeEnumSerializer;

  const QuoteBlockTypeEnum._(String name) : super(name);

  static BuiltSet<QuoteBlockTypeEnum> get values => _$quoteBlockTypeEnumValues;
  static QuoteBlockTypeEnum valueOf(String name) =>
      _$quoteBlockTypeEnumValueOf(name);
}
