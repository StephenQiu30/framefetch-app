// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heading_block.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const HeadingBlockTypeEnum _$headingBlockTypeEnum_heading =
    const HeadingBlockTypeEnum._('heading');
const HeadingBlockTypeEnum _$headingBlockTypeEnum_unknownDefaultOpenApi =
    const HeadingBlockTypeEnum._('unknownDefaultOpenApi');

HeadingBlockTypeEnum _$headingBlockTypeEnumValueOf(String name) {
  switch (name) {
    case 'heading':
      return _$headingBlockTypeEnum_heading;
    case 'unknownDefaultOpenApi':
      return _$headingBlockTypeEnum_unknownDefaultOpenApi;
    default:
      return _$headingBlockTypeEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<HeadingBlockTypeEnum> _$headingBlockTypeEnumValues =
    BuiltSet<HeadingBlockTypeEnum>(const <HeadingBlockTypeEnum>[
  _$headingBlockTypeEnum_heading,
  _$headingBlockTypeEnum_unknownDefaultOpenApi,
]);

const HeadingBlockLevelEnum _$headingBlockLevelEnum_number2 =
    const HeadingBlockLevelEnum._('number2');
const HeadingBlockLevelEnum _$headingBlockLevelEnum_number3 =
    const HeadingBlockLevelEnum._('number3');
const HeadingBlockLevelEnum _$headingBlockLevelEnum_unknownDefaultOpenApi =
    const HeadingBlockLevelEnum._('unknownDefaultOpenApi');

HeadingBlockLevelEnum _$headingBlockLevelEnumValueOf(String name) {
  switch (name) {
    case 'number2':
      return _$headingBlockLevelEnum_number2;
    case 'number3':
      return _$headingBlockLevelEnum_number3;
    case 'unknownDefaultOpenApi':
      return _$headingBlockLevelEnum_unknownDefaultOpenApi;
    default:
      return _$headingBlockLevelEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<HeadingBlockLevelEnum> _$headingBlockLevelEnumValues =
    BuiltSet<HeadingBlockLevelEnum>(const <HeadingBlockLevelEnum>[
  _$headingBlockLevelEnum_number2,
  _$headingBlockLevelEnum_number3,
  _$headingBlockLevelEnum_unknownDefaultOpenApi,
]);

Serializer<HeadingBlockTypeEnum> _$headingBlockTypeEnumSerializer =
    _$HeadingBlockTypeEnumSerializer();
Serializer<HeadingBlockLevelEnum> _$headingBlockLevelEnumSerializer =
    _$HeadingBlockLevelEnumSerializer();

class _$HeadingBlockTypeEnumSerializer
    implements PrimitiveSerializer<HeadingBlockTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'heading': 'heading',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'heading': 'heading',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[HeadingBlockTypeEnum];
  @override
  final String wireName = 'HeadingBlockTypeEnum';

  @override
  Object serialize(Serializers serializers, HeadingBlockTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  HeadingBlockTypeEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      HeadingBlockTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$HeadingBlockLevelEnumSerializer
    implements PrimitiveSerializer<HeadingBlockLevelEnum> {
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
  final Iterable<Type> types = const <Type>[HeadingBlockLevelEnum];
  @override
  final String wireName = 'HeadingBlockLevelEnum';

  @override
  Object serialize(Serializers serializers, HeadingBlockLevelEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  HeadingBlockLevelEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      HeadingBlockLevelEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$HeadingBlock extends HeadingBlock {
  @override
  final String id;
  @override
  final HeadingBlockTypeEnum type;
  @override
  final HeadingBlockLevelEnum level;
  @override
  final String text;

  factory _$HeadingBlock([void Function(HeadingBlockBuilder)? updates]) =>
      (HeadingBlockBuilder()..update(updates))._build();

  _$HeadingBlock._(
      {required this.id,
      required this.type,
      required this.level,
      required this.text})
      : super._();
  @override
  HeadingBlock rebuild(void Function(HeadingBlockBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HeadingBlockBuilder toBuilder() => HeadingBlockBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HeadingBlock &&
        id == other.id &&
        type == other.type &&
        level == other.level &&
        text == other.text;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, level.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HeadingBlock')
          ..add('id', id)
          ..add('type', type)
          ..add('level', level)
          ..add('text', text))
        .toString();
  }
}

class HeadingBlockBuilder
    implements Builder<HeadingBlock, HeadingBlockBuilder> {
  _$HeadingBlock? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  HeadingBlockTypeEnum? _type;
  HeadingBlockTypeEnum? get type => _$this._type;
  set type(HeadingBlockTypeEnum? type) => _$this._type = type;

  HeadingBlockLevelEnum? _level;
  HeadingBlockLevelEnum? get level => _$this._level;
  set level(HeadingBlockLevelEnum? level) => _$this._level = level;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  HeadingBlockBuilder() {
    HeadingBlock._defaults(this);
  }

  HeadingBlockBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _level = $v.level;
      _text = $v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HeadingBlock other) {
    _$v = other as _$HeadingBlock;
  }

  @override
  void update(void Function(HeadingBlockBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HeadingBlock build() => _build();

  _$HeadingBlock _build() {
    final _$result = _$v ??
        _$HeadingBlock._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'HeadingBlock', 'id'),
          type: BuiltValueNullFieldError.checkNotNull(
              type, r'HeadingBlock', 'type'),
          level: BuiltValueNullFieldError.checkNotNull(
              level, r'HeadingBlock', 'level'),
          text: BuiltValueNullFieldError.checkNotNull(
              text, r'HeadingBlock', 'text'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
