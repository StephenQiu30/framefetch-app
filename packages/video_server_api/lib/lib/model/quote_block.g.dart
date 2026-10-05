// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_block.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const QuoteBlockTypeEnum _$quoteBlockTypeEnum_quote =
    const QuoteBlockTypeEnum._('quote');
const QuoteBlockTypeEnum _$quoteBlockTypeEnum_unknownDefaultOpenApi =
    const QuoteBlockTypeEnum._('unknownDefaultOpenApi');

QuoteBlockTypeEnum _$quoteBlockTypeEnumValueOf(String name) {
  switch (name) {
    case 'quote':
      return _$quoteBlockTypeEnum_quote;
    case 'unknownDefaultOpenApi':
      return _$quoteBlockTypeEnum_unknownDefaultOpenApi;
    default:
      return _$quoteBlockTypeEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<QuoteBlockTypeEnum> _$quoteBlockTypeEnumValues =
    BuiltSet<QuoteBlockTypeEnum>(const <QuoteBlockTypeEnum>[
  _$quoteBlockTypeEnum_quote,
  _$quoteBlockTypeEnum_unknownDefaultOpenApi,
]);

Serializer<QuoteBlockTypeEnum> _$quoteBlockTypeEnumSerializer =
    _$QuoteBlockTypeEnumSerializer();

class _$QuoteBlockTypeEnumSerializer
    implements PrimitiveSerializer<QuoteBlockTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'quote': 'quote',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'quote': 'quote',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[QuoteBlockTypeEnum];
  @override
  final String wireName = 'QuoteBlockTypeEnum';

  @override
  Object serialize(Serializers serializers, QuoteBlockTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  QuoteBlockTypeEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      QuoteBlockTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$QuoteBlock extends QuoteBlock {
  @override
  final String id;
  @override
  final QuoteBlockTypeEnum type;
  @override
  final String text;

  factory _$QuoteBlock([void Function(QuoteBlockBuilder)? updates]) =>
      (QuoteBlockBuilder()..update(updates))._build();

  _$QuoteBlock._({required this.id, required this.type, required this.text})
      : super._();
  @override
  QuoteBlock rebuild(void Function(QuoteBlockBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuoteBlockBuilder toBuilder() => QuoteBlockBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuoteBlock &&
        id == other.id &&
        type == other.type &&
        text == other.text;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'QuoteBlock')
          ..add('id', id)
          ..add('type', type)
          ..add('text', text))
        .toString();
  }
}

class QuoteBlockBuilder implements Builder<QuoteBlock, QuoteBlockBuilder> {
  _$QuoteBlock? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  QuoteBlockTypeEnum? _type;
  QuoteBlockTypeEnum? get type => _$this._type;
  set type(QuoteBlockTypeEnum? type) => _$this._type = type;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  QuoteBlockBuilder() {
    QuoteBlock._defaults(this);
  }

  QuoteBlockBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _text = $v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QuoteBlock other) {
    _$v = other as _$QuoteBlock;
  }

  @override
  void update(void Function(QuoteBlockBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QuoteBlock build() => _build();

  _$QuoteBlock _build() {
    final _$result = _$v ??
        _$QuoteBlock._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'QuoteBlock', 'id'),
          type: BuiltValueNullFieldError.checkNotNull(
              type, r'QuoteBlock', 'type'),
          text: BuiltValueNullFieldError.checkNotNull(
              text, r'QuoteBlock', 'text'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
