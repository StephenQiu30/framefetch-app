// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_inner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ItemsInnerNextActionEnum _$itemsInnerNextActionEnum_none =
    const ItemsInnerNextActionEnum._('none');
const ItemsInnerNextActionEnum _$itemsInnerNextActionEnum_wait =
    const ItemsInnerNextActionEnum._('wait');
const ItemsInnerNextActionEnum _$itemsInnerNextActionEnum_refreshResult =
    const ItemsInnerNextActionEnum._('refreshResult');
const ItemsInnerNextActionEnum _$itemsInnerNextActionEnum_importFile =
    const ItemsInnerNextActionEnum._('importFile');
const ItemsInnerNextActionEnum
    _$itemsInnerNextActionEnum_unknownDefaultOpenApi =
    const ItemsInnerNextActionEnum._('unknownDefaultOpenApi');

ItemsInnerNextActionEnum _$itemsInnerNextActionEnumValueOf(String name) {
  switch (name) {
    case 'none':
      return _$itemsInnerNextActionEnum_none;
    case 'wait':
      return _$itemsInnerNextActionEnum_wait;
    case 'refreshResult':
      return _$itemsInnerNextActionEnum_refreshResult;
    case 'importFile':
      return _$itemsInnerNextActionEnum_importFile;
    case 'unknownDefaultOpenApi':
      return _$itemsInnerNextActionEnum_unknownDefaultOpenApi;
    default:
      return _$itemsInnerNextActionEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<ItemsInnerNextActionEnum> _$itemsInnerNextActionEnumValues =
    BuiltSet<ItemsInnerNextActionEnum>(const <ItemsInnerNextActionEnum>[
  _$itemsInnerNextActionEnum_none,
  _$itemsInnerNextActionEnum_wait,
  _$itemsInnerNextActionEnum_refreshResult,
  _$itemsInnerNextActionEnum_importFile,
  _$itemsInnerNextActionEnum_unknownDefaultOpenApi,
]);

const ItemsInnerRecordTypeEnum _$itemsInnerRecordTypeEnum_documentParse =
    const ItemsInnerRecordTypeEnum._('documentParse');
const ItemsInnerRecordTypeEnum
    _$itemsInnerRecordTypeEnum_unknownDefaultOpenApi =
    const ItemsInnerRecordTypeEnum._('unknownDefaultOpenApi');

ItemsInnerRecordTypeEnum _$itemsInnerRecordTypeEnumValueOf(String name) {
  switch (name) {
    case 'documentParse':
      return _$itemsInnerRecordTypeEnum_documentParse;
    case 'unknownDefaultOpenApi':
      return _$itemsInnerRecordTypeEnum_unknownDefaultOpenApi;
    default:
      return _$itemsInnerRecordTypeEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<ItemsInnerRecordTypeEnum> _$itemsInnerRecordTypeEnumValues =
    BuiltSet<ItemsInnerRecordTypeEnum>(const <ItemsInnerRecordTypeEnum>[
  _$itemsInnerRecordTypeEnum_documentParse,
  _$itemsInnerRecordTypeEnum_unknownDefaultOpenApi,
]);

const ItemsInnerAllowedActionsEnum _$itemsInnerAllowedActionsEnum_view =
    const ItemsInnerAllowedActionsEnum._('view');
const ItemsInnerAllowedActionsEnum _$itemsInnerAllowedActionsEnum_retry =
    const ItemsInnerAllowedActionsEnum._('retry');
const ItemsInnerAllowedActionsEnum _$itemsInnerAllowedActionsEnum_cancel =
    const ItemsInnerAllowedActionsEnum._('cancel');
const ItemsInnerAllowedActionsEnum _$itemsInnerAllowedActionsEnum_delete =
    const ItemsInnerAllowedActionsEnum._('delete');
const ItemsInnerAllowedActionsEnum
    _$itemsInnerAllowedActionsEnum_unknownDefaultOpenApi =
    const ItemsInnerAllowedActionsEnum._('unknownDefaultOpenApi');

ItemsInnerAllowedActionsEnum _$itemsInnerAllowedActionsEnumValueOf(
    String name) {
  switch (name) {
    case 'view':
      return _$itemsInnerAllowedActionsEnum_view;
    case 'retry':
      return _$itemsInnerAllowedActionsEnum_retry;
    case 'cancel':
      return _$itemsInnerAllowedActionsEnum_cancel;
    case 'delete':
      return _$itemsInnerAllowedActionsEnum_delete;
    case 'unknownDefaultOpenApi':
      return _$itemsInnerAllowedActionsEnum_unknownDefaultOpenApi;
    default:
      return _$itemsInnerAllowedActionsEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<ItemsInnerAllowedActionsEnum>
    _$itemsInnerAllowedActionsEnumValues =
    BuiltSet<ItemsInnerAllowedActionsEnum>(const <ItemsInnerAllowedActionsEnum>[
  _$itemsInnerAllowedActionsEnum_view,
  _$itemsInnerAllowedActionsEnum_retry,
  _$itemsInnerAllowedActionsEnum_cancel,
  _$itemsInnerAllowedActionsEnum_delete,
  _$itemsInnerAllowedActionsEnum_unknownDefaultOpenApi,
]);

Serializer<ItemsInnerNextActionEnum> _$itemsInnerNextActionEnumSerializer =
    _$ItemsInnerNextActionEnumSerializer();
Serializer<ItemsInnerRecordTypeEnum> _$itemsInnerRecordTypeEnumSerializer =
    _$ItemsInnerRecordTypeEnumSerializer();
Serializer<ItemsInnerAllowedActionsEnum>
    _$itemsInnerAllowedActionsEnumSerializer =
    _$ItemsInnerAllowedActionsEnumSerializer();

class _$ItemsInnerNextActionEnumSerializer
    implements PrimitiveSerializer<ItemsInnerNextActionEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'none': 'none',
    'wait': 'wait',
    'refreshResult': 'refresh_result',
    'importFile': 'import_file',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'none': 'none',
    'wait': 'wait',
    'refresh_result': 'refreshResult',
    'import_file': 'importFile',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ItemsInnerNextActionEnum];
  @override
  final String wireName = 'ItemsInnerNextActionEnum';

  @override
  Object serialize(Serializers serializers, ItemsInnerNextActionEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ItemsInnerNextActionEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ItemsInnerNextActionEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ItemsInnerRecordTypeEnumSerializer
    implements PrimitiveSerializer<ItemsInnerRecordTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'documentParse': 'document_parse',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'document_parse': 'documentParse',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ItemsInnerRecordTypeEnum];
  @override
  final String wireName = 'ItemsInnerRecordTypeEnum';

  @override
  Object serialize(Serializers serializers, ItemsInnerRecordTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ItemsInnerRecordTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ItemsInnerRecordTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ItemsInnerAllowedActionsEnumSerializer
    implements PrimitiveSerializer<ItemsInnerAllowedActionsEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'view': 'view',
    'retry': 'retry',
    'cancel': 'cancel',
    'delete': 'delete',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'view': 'view',
    'retry': 'retry',
    'cancel': 'cancel',
    'delete': 'delete',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ItemsInnerAllowedActionsEnum];
  @override
  final String wireName = 'ItemsInnerAllowedActionsEnum';

  @override
  Object serialize(Serializers serializers, ItemsInnerAllowedActionsEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ItemsInnerAllowedActionsEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ItemsInnerAllowedActionsEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ItemsInner extends ItemsInner {
  @override
  final OneOf oneOf;

  factory _$ItemsInner([void Function(ItemsInnerBuilder)? updates]) =>
      (ItemsInnerBuilder()..update(updates))._build();

  _$ItemsInner._({required this.oneOf}) : super._();
  @override
  ItemsInner rebuild(void Function(ItemsInnerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemsInnerBuilder toBuilder() => ItemsInnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ItemsInner && oneOf == other.oneOf;
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
    return (newBuiltValueToStringHelper(r'ItemsInner')..add('oneOf', oneOf))
        .toString();
  }
}

class ItemsInnerBuilder implements Builder<ItemsInner, ItemsInnerBuilder> {
  _$ItemsInner? _$v;

  OneOf? _oneOf;
  OneOf? get oneOf => _$this._oneOf;
  set oneOf(OneOf? oneOf) => _$this._oneOf = oneOf;

  ItemsInnerBuilder() {
    ItemsInner._defaults(this);
  }

  ItemsInnerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _oneOf = $v.oneOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ItemsInner other) {
    _$v = other as _$ItemsInner;
  }

  @override
  void update(void Function(ItemsInnerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ItemsInner build() => _build();

  _$ItemsInner _build() {
    final _$result = _$v ??
        _$ItemsInner._(
          oneOf: BuiltValueNullFieldError.checkNotNull(
              oneOf, r'ItemsInner', 'oneOf'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
