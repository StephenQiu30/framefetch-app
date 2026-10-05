// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paragraph_block.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ParagraphBlockTypeEnum _$paragraphBlockTypeEnum_paragraph =
    const ParagraphBlockTypeEnum._('paragraph');
const ParagraphBlockTypeEnum _$paragraphBlockTypeEnum_unknownDefaultOpenApi =
    const ParagraphBlockTypeEnum._('unknownDefaultOpenApi');

ParagraphBlockTypeEnum _$paragraphBlockTypeEnumValueOf(String name) {
  switch (name) {
    case 'paragraph':
      return _$paragraphBlockTypeEnum_paragraph;
    case 'unknownDefaultOpenApi':
      return _$paragraphBlockTypeEnum_unknownDefaultOpenApi;
    default:
      return _$paragraphBlockTypeEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<ParagraphBlockTypeEnum> _$paragraphBlockTypeEnumValues =
    BuiltSet<ParagraphBlockTypeEnum>(const <ParagraphBlockTypeEnum>[
  _$paragraphBlockTypeEnum_paragraph,
  _$paragraphBlockTypeEnum_unknownDefaultOpenApi,
]);

Serializer<ParagraphBlockTypeEnum> _$paragraphBlockTypeEnumSerializer =
    _$ParagraphBlockTypeEnumSerializer();

class _$ParagraphBlockTypeEnumSerializer
    implements PrimitiveSerializer<ParagraphBlockTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'paragraph': 'paragraph',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'paragraph': 'paragraph',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ParagraphBlockTypeEnum];
  @override
  final String wireName = 'ParagraphBlockTypeEnum';

  @override
  Object serialize(Serializers serializers, ParagraphBlockTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ParagraphBlockTypeEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ParagraphBlockTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ParagraphBlock extends ParagraphBlock {
  @override
  final String id;
  @override
  final ParagraphBlockTypeEnum type;
  @override
  final String text;

  factory _$ParagraphBlock([void Function(ParagraphBlockBuilder)? updates]) =>
      (ParagraphBlockBuilder()..update(updates))._build();

  _$ParagraphBlock._({required this.id, required this.type, required this.text})
      : super._();
  @override
  ParagraphBlock rebuild(void Function(ParagraphBlockBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ParagraphBlockBuilder toBuilder() => ParagraphBlockBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ParagraphBlock &&
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
    return (newBuiltValueToStringHelper(r'ParagraphBlock')
          ..add('id', id)
          ..add('type', type)
          ..add('text', text))
        .toString();
  }
}

class ParagraphBlockBuilder
    implements Builder<ParagraphBlock, ParagraphBlockBuilder> {
  _$ParagraphBlock? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ParagraphBlockTypeEnum? _type;
  ParagraphBlockTypeEnum? get type => _$this._type;
  set type(ParagraphBlockTypeEnum? type) => _$this._type = type;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  ParagraphBlockBuilder() {
    ParagraphBlock._defaults(this);
  }

  ParagraphBlockBuilder get _$this {
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
  void replace(ParagraphBlock other) {
    _$v = other as _$ParagraphBlock;
  }

  @override
  void update(void Function(ParagraphBlockBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ParagraphBlock build() => _build();

  _$ParagraphBlock _build() {
    final _$result = _$v ??
        _$ParagraphBlock._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'ParagraphBlock', 'id'),
          type: BuiltValueNullFieldError.checkNotNull(
              type, r'ParagraphBlock', 'type'),
          text: BuiltValueNullFieldError.checkNotNull(
              text, r'ParagraphBlock', 'text'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
