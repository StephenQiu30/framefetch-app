// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_status_group.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const HistoryStatusGroup _$processing =
    const HistoryStatusGroup._('processing');
const HistoryStatusGroup _$completed = const HistoryStatusGroup._('completed');
const HistoryStatusGroup _$failed = const HistoryStatusGroup._('failed');
const HistoryStatusGroup _$cancelled = const HistoryStatusGroup._('cancelled');
const HistoryStatusGroup _$expired = const HistoryStatusGroup._('expired');
const HistoryStatusGroup _$unknownDefaultOpenApi =
    const HistoryStatusGroup._('unknownDefaultOpenApi');

HistoryStatusGroup _$valueOf(String name) {
  switch (name) {
    case 'processing':
      return _$processing;
    case 'completed':
      return _$completed;
    case 'failed':
      return _$failed;
    case 'cancelled':
      return _$cancelled;
    case 'expired':
      return _$expired;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<HistoryStatusGroup> _$values =
    BuiltSet<HistoryStatusGroup>(const <HistoryStatusGroup>[
  _$processing,
  _$completed,
  _$failed,
  _$cancelled,
  _$expired,
  _$unknownDefaultOpenApi,
]);

class _$HistoryStatusGroupMeta {
  const _$HistoryStatusGroupMeta();
  HistoryStatusGroup get processing => _$processing;
  HistoryStatusGroup get completed => _$completed;
  HistoryStatusGroup get failed => _$failed;
  HistoryStatusGroup get cancelled => _$cancelled;
  HistoryStatusGroup get expired => _$expired;
  HistoryStatusGroup get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  HistoryStatusGroup valueOf(String name) => _$valueOf(name);
  BuiltSet<HistoryStatusGroup> get values => _$values;
}

mixin _$HistoryStatusGroupMixin {
  // ignore: non_constant_identifier_names
  _$HistoryStatusGroupMeta get HistoryStatusGroup =>
      const _$HistoryStatusGroupMeta();
}

Serializer<HistoryStatusGroup> _$historyStatusGroupSerializer =
    _$HistoryStatusGroupSerializer();

class _$HistoryStatusGroupSerializer
    implements PrimitiveSerializer<HistoryStatusGroup> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'processing': 'processing',
    'completed': 'completed',
    'failed': 'failed',
    'cancelled': 'cancelled',
    'expired': 'expired',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'processing': 'processing',
    'completed': 'completed',
    'failed': 'failed',
    'cancelled': 'cancelled',
    'expired': 'expired',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[HistoryStatusGroup];
  @override
  final String wireName = 'HistoryStatusGroup';

  @override
  Object serialize(Serializers serializers, HistoryStatusGroup object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  HistoryStatusGroup deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      HistoryStatusGroup.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
