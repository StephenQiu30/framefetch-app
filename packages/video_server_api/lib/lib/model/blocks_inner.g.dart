// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blocks_inner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const BlocksInnerTypeEnum _$blocksInnerTypeEnum_paragraph =
    const BlocksInnerTypeEnum._('paragraph');
const BlocksInnerTypeEnum _$blocksInnerTypeEnum_heading =
    const BlocksInnerTypeEnum._('heading');
const BlocksInnerTypeEnum _$blocksInnerTypeEnum_list =
    const BlocksInnerTypeEnum._('list');
const BlocksInnerTypeEnum _$blocksInnerTypeEnum_quote =
    const BlocksInnerTypeEnum._('quote');
const BlocksInnerTypeEnum _$blocksInnerTypeEnum_unknownDefaultOpenApi =
    const BlocksInnerTypeEnum._('unknownDefaultOpenApi');

BlocksInnerTypeEnum _$blocksInnerTypeEnumValueOf(String name) {
  switch (name) {
    case 'paragraph':
      return _$blocksInnerTypeEnum_paragraph;
    case 'heading':
      return _$blocksInnerTypeEnum_heading;
    case 'list':
      return _$blocksInnerTypeEnum_list;
    case 'quote':
      return _$blocksInnerTypeEnum_quote;
    case 'unknownDefaultOpenApi':
      return _$blocksInnerTypeEnum_unknownDefaultOpenApi;
    default:
      return _$blocksInnerTypeEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<BlocksInnerTypeEnum> _$blocksInnerTypeEnumValues =
    BuiltSet<BlocksInnerTypeEnum>(const <BlocksInnerTypeEnum>[
  _$blocksInnerTypeEnum_paragraph,
  _$blocksInnerTypeEnum_heading,
  _$blocksInnerTypeEnum_list,
  _$blocksInnerTypeEnum_quote,
  _$blocksInnerTypeEnum_unknownDefaultOpenApi,
]);

const BlocksInnerLevelEnum _$blocksInnerLevelEnum_number2 =
    const BlocksInnerLevelEnum._('number2');
const BlocksInnerLevelEnum _$blocksInnerLevelEnum_number3 =
    const BlocksInnerLevelEnum._('number3');
const BlocksInnerLevelEnum _$blocksInnerLevelEnum_unknownDefaultOpenApi =
    const BlocksInnerLevelEnum._('unknownDefaultOpenApi');

BlocksInnerLevelEnum _$blocksInnerLevelEnumValueOf(String name) {
  switch (name) {
    case 'number2':
      return _$blocksInnerLevelEnum_number2;
    case 'number3':
      return _$blocksInnerLevelEnum_number3;
    case 'unknownDefaultOpenApi':
      return _$blocksInnerLevelEnum_unknownDefaultOpenApi;
    default:
      return _$blocksInnerLevelEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<BlocksInnerLevelEnum> _$blocksInnerLevelEnumValues =
    BuiltSet<BlocksInnerLevelEnum>(const <BlocksInnerLevelEnum>[
  _$blocksInnerLevelEnum_number2,
  _$blocksInnerLevelEnum_number3,
  _$blocksInnerLevelEnum_unknownDefaultOpenApi,
]);

Serializer<BlocksInnerTypeEnum> _$blocksInnerTypeEnumSerializer =
    _$BlocksInnerTypeEnumSerializer();
Serializer<BlocksInnerLevelEnum> _$blocksInnerLevelEnumSerializer =
    _$BlocksInnerLevelEnumSerializer();

class _$BlocksInnerTypeEnumSerializer
    implements PrimitiveSerializer<BlocksInnerTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'paragraph': 'paragraph',
    'heading': 'heading',
    'list': 'list',
    'quote': 'quote',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'paragraph': 'paragraph',
    'heading': 'heading',
    'list': 'list',
    'quote': 'quote',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[BlocksInnerTypeEnum];
  @override
  final String wireName = 'BlocksInnerTypeEnum';

  @override
  Object serialize(Serializers serializers, BlocksInnerTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  BlocksInnerTypeEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      BlocksInnerTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$BlocksInnerLevelEnumSerializer
    implements PrimitiveSerializer<BlocksInnerLevelEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'number2': 2,
    'number3': 3,
    'unknownDefaultOpenApi': 11184809,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    2: 'number2',
    3: 'number3',
    11184809: 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[BlocksInnerLevelEnum];
  @override
  final String wireName = 'BlocksInnerLevelEnum';

  @override
  Object serialize(Serializers serializers, BlocksInnerLevelEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  BlocksInnerLevelEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      BlocksInnerLevelEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$BlocksInner extends BlocksInner {
  @override
  final OneOf oneOf;

  factory _$BlocksInner([void Function(BlocksInnerBuilder)? updates]) =>
      (BlocksInnerBuilder()..update(updates))._build();

  _$BlocksInner._({required this.oneOf}) : super._();
  @override
  BlocksInner rebuild(void Function(BlocksInnerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BlocksInnerBuilder toBuilder() => BlocksInnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BlocksInner && oneOf == other.oneOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, oneOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BlocksInner')..add('oneOf', oneOf))
        .toString();
  }
}

class BlocksInnerBuilder implements Builder<BlocksInner, BlocksInnerBuilder> {
  _$BlocksInner? _$v;

  OneOf? _oneOf;
  OneOf? get oneOf => _$this._oneOf;
  set oneOf(OneOf? oneOf) => _$this._oneOf = oneOf;

  BlocksInnerBuilder() {
    BlocksInner._defaults(this);
  }

  BlocksInnerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _oneOf = $v.oneOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BlocksInner other) {
    _$v = other as _$BlocksInner;
  }

  @override
  void update(void Function(BlocksInnerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BlocksInner build() => _build();

  _$BlocksInner _build() {
    final _$result = _$v ??
        _$BlocksInner._(
          oneOf: BuiltValueNullFieldError.checkNotNull(
              oneOf, r'BlocksInner', 'oneOf'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
