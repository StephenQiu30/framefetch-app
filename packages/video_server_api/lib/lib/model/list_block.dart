//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_block.g.dart';

/// ListBlock
///
/// Properties:
/// * [id]
/// * [type]
/// * [ordered]
/// * [items]
@BuiltValue()
abstract class ListBlock implements Built<ListBlock, ListBlockBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'type')
  ListBlockTypeEnum get type;
  // enum typeEnum {  list,  };

  @BuiltValueField(wireName: r'ordered')
  bool get ordered;

  @BuiltValueField(wireName: r'items')
  BuiltList<String> get items;

  ListBlock._();

  factory ListBlock([void updates(ListBlockBuilder b)]) = _$ListBlock;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ListBlockBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ListBlock> get serializer => _$ListBlockSerializer();
}

class _$ListBlockSerializer implements PrimitiveSerializer<ListBlock> {
  @override
  final Iterable<Type> types = const [ListBlock, _$ListBlock];

  @override
  final String wireName = r'ListBlock';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ListBlock object, {
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
      specifiedType: const FullType(ListBlockTypeEnum),
    );
    yield r'ordered';
    yield serializers.serialize(
      object.ordered,
      specifiedType: const FullType(bool),
    );
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ListBlock object, {
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
    required ListBlockBuilder result,
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
            specifiedType: const FullType(ListBlockTypeEnum),
          ) as ListBlockTypeEnum;
          result.type = valueDes;
          break;
        case r'ordered':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.ordered = valueDes;
          break;
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
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
  ListBlock deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ListBlockBuilder();
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

class ListBlockTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'list')
  static const ListBlockTypeEnum list = _$listBlockTypeEnum_list;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ListBlockTypeEnum unknownDefaultOpenApi =
      _$listBlockTypeEnum_unknownDefaultOpenApi;

  static Serializer<ListBlockTypeEnum> get serializer =>
      _$listBlockTypeEnumSerializer;

  const ListBlockTypeEnum._(String name) : super(name);

  static BuiltSet<ListBlockTypeEnum> get values => _$listBlockTypeEnumValues;
  static ListBlockTypeEnum valueOf(String name) =>
      _$listBlockTypeEnumValueOf(name);
}
