// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_availability.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const HistoryAvailability _$available =
    const HistoryAvailability._('available');
const HistoryAvailability _$unavailable =
    const HistoryAvailability._('unavailable');
const HistoryAvailability _$unknown = const HistoryAvailability._('unknown');
const HistoryAvailability _$notApplicable =
    const HistoryAvailability._('notApplicable');
const HistoryAvailability _$unknownDefaultOpenApi =
    const HistoryAvailability._('unknownDefaultOpenApi');

HistoryAvailability _$valueOf(String name) {
  switch (name) {
    case 'available':
      return _$available;
    case 'unavailable':
      return _$unavailable;
    case 'unknown':
      return _$unknown;
    case 'notApplicable':
      return _$notApplicable;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<HistoryAvailability> _$values =
    BuiltSet<HistoryAvailability>(const <HistoryAvailability>[
  _$available,
  _$unavailable,
  _$unknown,
  _$notApplicable,
  _$unknownDefaultOpenApi,
]);

class _$HistoryAvailabilityMeta {
  const _$HistoryAvailabilityMeta();
  HistoryAvailability get available => _$available;
  HistoryAvailability get unavailable => _$unavailable;
  HistoryAvailability get unknown => _$unknown;
  HistoryAvailability get notApplicable => _$notApplicable;
  HistoryAvailability get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  HistoryAvailability valueOf(String name) => _$valueOf(name);
  BuiltSet<HistoryAvailability> get values => _$values;
}

mixin _$HistoryAvailabilityMixin {
  // ignore: non_constant_identifier_names
  _$HistoryAvailabilityMeta get HistoryAvailability =>
      const _$HistoryAvailabilityMeta();
}

Serializer<HistoryAvailability> _$historyAvailabilitySerializer =
    _$HistoryAvailabilitySerializer();

class _$HistoryAvailabilitySerializer
    implements PrimitiveSerializer<HistoryAvailability> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'available': 'available',
    'unavailable': 'unavailable',
    'unknown': 'unknown',
    'notApplicable': 'not_applicable',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'available': 'available',
    'unavailable': 'unavailable',
    'unknown': 'unknown',
    'not_applicable': 'notApplicable',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[HistoryAvailability];
  @override
  final String wireName = 'HistoryAvailability';

  @override
  Object serialize(Serializers serializers, HistoryAvailability object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  HistoryAvailability deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      HistoryAvailability.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
