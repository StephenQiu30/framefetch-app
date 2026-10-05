//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/heading_block.dart';
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/paragraph_block.dart';
import 'package:video_server_api/lib/model/quote_block.dart';
import 'package:video_server_api/lib/model/list_block.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'blocks_inner.g.dart';

/// BlocksInner
///
/// Properties:
/// * [id]
/// * [type]
/// * [text]
/// * [level]
/// * [ordered]
/// * [items]
@BuiltValue()
abstract class BlocksInner implements Built<BlocksInner, BlocksInnerBuilder> {
  /// One Of [HeadingBlock], [ListBlock], [ParagraphBlock], [QuoteBlock]
  OneOf get oneOf;

  static const String discriminatorFieldName = r'type';

  static const Map<String, Type> discriminatorMapping = {
    r'heading': HeadingBlock,
    r'list': ListBlock,
    r'paragraph': ParagraphBlock,
    r'quote': QuoteBlock,
  };

  BlocksInner._();

  factory BlocksInner([void updates(BlocksInnerBuilder b)]) = _$BlocksInner;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BlocksInnerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BlocksInner> get serializer => _$BlocksInnerSerializer();
}

extension BlocksInnerDiscriminatorExt on BlocksInner {
  String? get discriminatorValue {
    if (this is HeadingBlock) {
      return r'heading';
    }
    if (this is ListBlock) {
      return r'list';
    }
    if (this is ParagraphBlock) {
      return r'paragraph';
    }
    if (this is QuoteBlock) {
      return r'quote';
    }
    return null;
  }
}

extension BlocksInnerBuilderDiscriminatorExt on BlocksInnerBuilder {
  String? get discriminatorValue {
    if (this is HeadingBlockBuilder) {
      return r'heading';
    }
    if (this is ListBlockBuilder) {
      return r'list';
    }
    if (this is ParagraphBlockBuilder) {
      return r'paragraph';
    }
    if (this is QuoteBlockBuilder) {
      return r'quote';
    }
    return null;
  }
}

class _$BlocksInnerSerializer implements PrimitiveSerializer<BlocksInner> {
  @override
  final Iterable<Type> types = const [BlocksInner, _$BlocksInner];

  @override
  final String wireName = r'BlocksInner';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BlocksInner object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {}

  @override
  Object serialize(
    Serializers serializers,
    BlocksInner object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(oneOf.value,
        specifiedType: FullType(oneOf.valueType))!;
  }

  @override
  BlocksInner deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BlocksInnerBuilder();
    Object? oneOfDataSrc;
    final serializedList = (serialized as Iterable<Object?>).toList();
    final discIndex =
        serializedList.indexOf(BlocksInner.discriminatorFieldName) + 1;
    final discValue = serializers.deserialize(serializedList[discIndex],
        specifiedType: FullType(String)) as String;
    oneOfDataSrc = serialized;
    final oneOfTypes = [
      HeadingBlock,
      ListBlock,
      ParagraphBlock,
      QuoteBlock,
    ];
    Object oneOfResult;
    Type oneOfType;
    switch (discValue) {
      case r'heading':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(HeadingBlock),
        ) as HeadingBlock;
        oneOfType = HeadingBlock;
        break;
      case r'list':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(ListBlock),
        ) as ListBlock;
        oneOfType = ListBlock;
        break;
      case r'paragraph':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(ParagraphBlock),
        ) as ParagraphBlock;
        oneOfType = ParagraphBlock;
        break;
      case r'quote':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(QuoteBlock),
        ) as QuoteBlock;
        oneOfType = QuoteBlock;
        break;
      default:
        throw UnsupportedError(
            "Couldn't deserialize oneOf for the discriminator value: ${discValue}");
    }
    result.oneOf = OneOfDynamic(
        typeIndex: oneOfTypes.indexOf(oneOfType),
        types: oneOfTypes,
        value: oneOfResult);
    return result.build();
  }
}

class BlocksInnerTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'paragraph')
  static const BlocksInnerTypeEnum paragraph = _$blocksInnerTypeEnum_paragraph;
  @BuiltValueEnumConst(wireName: r'heading')
  static const BlocksInnerTypeEnum heading = _$blocksInnerTypeEnum_heading;
  @BuiltValueEnumConst(wireName: r'list')
  static const BlocksInnerTypeEnum list = _$blocksInnerTypeEnum_list;
  @BuiltValueEnumConst(wireName: r'quote')
  static const BlocksInnerTypeEnum quote = _$blocksInnerTypeEnum_quote;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const BlocksInnerTypeEnum unknownDefaultOpenApi =
      _$blocksInnerTypeEnum_unknownDefaultOpenApi;

  static Serializer<BlocksInnerTypeEnum> get serializer =>
      _$blocksInnerTypeEnumSerializer;

  const BlocksInnerTypeEnum._(String name) : super(name);

  static BuiltSet<BlocksInnerTypeEnum> get values =>
      _$blocksInnerTypeEnumValues;
  static BlocksInnerTypeEnum valueOf(String name) =>
      _$blocksInnerTypeEnumValueOf(name);
}

class BlocksInnerLevelEnum extends EnumClass {
  @BuiltValueEnumConst(wireNumber: 2)
  static const BlocksInnerLevelEnum number2 = _$blocksInnerLevelEnum_number2;
  @BuiltValueEnumConst(wireNumber: 3)
  static const BlocksInnerLevelEnum number3 = _$blocksInnerLevelEnum_number3;
  @BuiltValueEnumConst(wireNumber: 11184809, fallback: true)
  static const BlocksInnerLevelEnum unknownDefaultOpenApi =
      _$blocksInnerLevelEnum_unknownDefaultOpenApi;

  static Serializer<BlocksInnerLevelEnum> get serializer =>
      _$blocksInnerLevelEnumSerializer;

  const BlocksInnerLevelEnum._(String name) : super(name);

  static BuiltSet<BlocksInnerLevelEnum> get values =>
      _$blocksInnerLevelEnumValues;
  static BlocksInnerLevelEnum valueOf(String name) =>
      _$blocksInnerLevelEnumValueOf(name);
}
