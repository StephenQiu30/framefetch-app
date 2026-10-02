// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DataRecordTypeEnum _$dataRecordTypeEnum_screenplayAnalysis =
    const DataRecordTypeEnum._('screenplayAnalysis');
const DataRecordTypeEnum _$dataRecordTypeEnum_unknownDefaultOpenApi =
    const DataRecordTypeEnum._('unknownDefaultOpenApi');

DataRecordTypeEnum _$dataRecordTypeEnumValueOf(String name) {
  switch (name) {
    case 'screenplayAnalysis':
      return _$dataRecordTypeEnum_screenplayAnalysis;
    case 'unknownDefaultOpenApi':
      return _$dataRecordTypeEnum_unknownDefaultOpenApi;
    default:
      return _$dataRecordTypeEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<DataRecordTypeEnum> _$dataRecordTypeEnumValues =
    BuiltSet<DataRecordTypeEnum>(const <DataRecordTypeEnum>[
  _$dataRecordTypeEnum_screenplayAnalysis,
  _$dataRecordTypeEnum_unknownDefaultOpenApi,
]);

const DataAllowedActionsEnum _$dataAllowedActionsEnum_view =
    const DataAllowedActionsEnum._('view');
const DataAllowedActionsEnum _$dataAllowedActionsEnum_retry =
    const DataAllowedActionsEnum._('retry');
const DataAllowedActionsEnum _$dataAllowedActionsEnum_cancel =
    const DataAllowedActionsEnum._('cancel');
const DataAllowedActionsEnum _$dataAllowedActionsEnum_delete =
    const DataAllowedActionsEnum._('delete');
const DataAllowedActionsEnum _$dataAllowedActionsEnum_unknownDefaultOpenApi =
    const DataAllowedActionsEnum._('unknownDefaultOpenApi');

DataAllowedActionsEnum _$dataAllowedActionsEnumValueOf(String name) {
  switch (name) {
    case 'view':
      return _$dataAllowedActionsEnum_view;
    case 'retry':
      return _$dataAllowedActionsEnum_retry;
    case 'cancel':
      return _$dataAllowedActionsEnum_cancel;
    case 'delete':
      return _$dataAllowedActionsEnum_delete;
    case 'unknownDefaultOpenApi':
      return _$dataAllowedActionsEnum_unknownDefaultOpenApi;
    default:
      return _$dataAllowedActionsEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<DataAllowedActionsEnum> _$dataAllowedActionsEnumValues =
    BuiltSet<DataAllowedActionsEnum>(const <DataAllowedActionsEnum>[
  _$dataAllowedActionsEnum_view,
  _$dataAllowedActionsEnum_retry,
  _$dataAllowedActionsEnum_cancel,
  _$dataAllowedActionsEnum_delete,
  _$dataAllowedActionsEnum_unknownDefaultOpenApi,
]);

Serializer<DataRecordTypeEnum> _$dataRecordTypeEnumSerializer =
    _$DataRecordTypeEnumSerializer();
Serializer<DataAllowedActionsEnum> _$dataAllowedActionsEnumSerializer =
    _$DataAllowedActionsEnumSerializer();

class _$DataRecordTypeEnumSerializer
    implements PrimitiveSerializer<DataRecordTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'screenplayAnalysis': 'screenplay_analysis',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'screenplay_analysis': 'screenplayAnalysis',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[DataRecordTypeEnum];
  @override
  final String wireName = 'DataRecordTypeEnum';

  @override
  Object serialize(Serializers serializers, DataRecordTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  DataRecordTypeEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DataRecordTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$DataAllowedActionsEnumSerializer
    implements PrimitiveSerializer<DataAllowedActionsEnum> {
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
  final Iterable<Type> types = const <Type>[DataAllowedActionsEnum];
  @override
  final String wireName = 'DataAllowedActionsEnum';

  @override
  Object serialize(Serializers serializers, DataAllowedActionsEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  DataAllowedActionsEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DataAllowedActionsEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$Data extends Data {
  @override
  final OneOf oneOf;

  factory _$Data([void Function(DataBuilder)? updates]) =>
      (DataBuilder()..update(updates))._build();

  _$Data._({required this.oneOf}) : super._();
  @override
  Data rebuild(void Function(DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DataBuilder toBuilder() => DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Data && oneOf == other.oneOf;
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
    return (newBuiltValueToStringHelper(r'Data')..add('oneOf', oneOf))
        .toString();
  }
}

class DataBuilder implements Builder<Data, DataBuilder> {
  _$Data? _$v;

  OneOf? _oneOf;
  OneOf? get oneOf => _$this._oneOf;
  set oneOf(OneOf? oneOf) => _$this._oneOf = oneOf;

  DataBuilder() {
    Data._defaults(this);
  }

  DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _oneOf = $v.oneOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Data other) {
    _$v = other as _$Data;
  }

  @override
  void update(void Function(DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Data build() => _build();

  _$Data _build() {
    final _$result = _$v ??
        _$Data._(
          oneOf: BuiltValueNullFieldError.checkNotNull(oneOf, r'Data', 'oneOf'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
