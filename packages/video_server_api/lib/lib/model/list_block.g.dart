// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_block.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ListBlockTypeEnum _$listBlockTypeEnum_list =
    const ListBlockTypeEnum._('list');
const ListBlockTypeEnum _$listBlockTypeEnum_unknownDefaultOpenApi =
    const ListBlockTypeEnum._('unknownDefaultOpenApi');

ListBlockTypeEnum _$listBlockTypeEnumValueOf(String name) {
  switch (name) {
    case 'list':
      return _$listBlockTypeEnum_list;
    case 'unknownDefaultOpenApi':
      return _$listBlockTypeEnum_unknownDefaultOpenApi;
    default:
      return _$listBlockTypeEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<ListBlockTypeEnum> _$listBlockTypeEnumValues =
    BuiltSet<ListBlockTypeEnum>(const <ListBlockTypeEnum>[
  _$listBlockTypeEnum_list,
  _$listBlockTypeEnum_unknownDefaultOpenApi,
]);

Serializer<ListBlockTypeEnum> _$listBlockTypeEnumSerializer =
    _$ListBlockTypeEnumSerializer();

class _$ListBlockTypeEnumSerializer
    implements PrimitiveSerializer<ListBlockTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'list': 'list',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'list': 'list',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ListBlockTypeEnum];
  @override
  final String wireName = 'ListBlockTypeEnum';

  @override
  Object serialize(Serializers serializers, ListBlockTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ListBlockTypeEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ListBlockTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ListBlock extends ListBlock {
  @override
  final String id;
  @override
  final ListBlockTypeEnum type;
  @override
  final bool ordered;
  @override
  final BuiltList<String> items;

  factory _$ListBlock([void Function(ListBlockBuilder)? updates]) =>
      (ListBlockBuilder()..update(updates))._build();

  _$ListBlock._(
      {required this.id,
      required this.type,
      required this.ordered,
      required this.items})
      : super._();
  @override
  ListBlock rebuild(void Function(ListBlockBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListBlockBuilder toBuilder() => ListBlockBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListBlock &&
        id == other.id &&
        type == other.type &&
        ordered == other.ordered &&
        items == other.items;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, ordered.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ListBlock')
          ..add('id', id)
          ..add('type', type)
          ..add('ordered', ordered)
          ..add('items', items))
        .toString();
  }
}

class ListBlockBuilder implements Builder<ListBlock, ListBlockBuilder> {
  _$ListBlock? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ListBlockTypeEnum? _type;
  ListBlockTypeEnum? get type => _$this._type;
  set type(ListBlockTypeEnum? type) => _$this._type = type;

  bool? _ordered;
  bool? get ordered => _$this._ordered;
  set ordered(bool? ordered) => _$this._ordered = ordered;

  ListBuilder<String>? _items;
  ListBuilder<String> get items => _$this._items ??= ListBuilder<String>();
  set items(ListBuilder<String>? items) => _$this._items = items;

  ListBlockBuilder() {
    ListBlock._defaults(this);
  }

  ListBlockBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _ordered = $v.ordered;
      _items = $v.items.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListBlock other) {
    _$v = other as _$ListBlock;
  }

  @override
  void update(void Function(ListBlockBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ListBlock build() => _build();

  _$ListBlock _build() {
    _$ListBlock _$result;
    try {
      _$result = _$v ??
          _$ListBlock._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'ListBlock', 'id'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'ListBlock', 'type'),
            ordered: BuiltValueNullFieldError.checkNotNull(
                ordered, r'ListBlock', 'ordered'),
            items: items.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ListBlock', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
