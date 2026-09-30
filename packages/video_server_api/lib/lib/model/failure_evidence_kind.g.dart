// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure_evidence_kind.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const FailureEvidenceKind _$upstreamResponse =
    const FailureEvidenceKind._('upstreamResponse');
const FailureEvidenceKind _$transport =
    const FailureEvidenceKind._('transport');
const FailureEvidenceKind _$localValidation =
    const FailureEvidenceKind._('localValidation');
const FailureEvidenceKind _$runtime = const FailureEvidenceKind._('runtime');
const FailureEvidenceKind _$unknown = const FailureEvidenceKind._('unknown');
const FailureEvidenceKind _$unknownDefaultOpenApi =
    const FailureEvidenceKind._('unknownDefaultOpenApi');

FailureEvidenceKind _$valueOf(String name) {
  switch (name) {
    case 'upstreamResponse':
      return _$upstreamResponse;
    case 'transport':
      return _$transport;
    case 'localValidation':
      return _$localValidation;
    case 'runtime':
      return _$runtime;
    case 'unknown':
      return _$unknown;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<FailureEvidenceKind> _$values =
    BuiltSet<FailureEvidenceKind>(const <FailureEvidenceKind>[
  _$upstreamResponse,
  _$transport,
  _$localValidation,
  _$runtime,
  _$unknown,
  _$unknownDefaultOpenApi,
]);

class _$FailureEvidenceKindMeta {
  const _$FailureEvidenceKindMeta();
  FailureEvidenceKind get upstreamResponse => _$upstreamResponse;
  FailureEvidenceKind get transport => _$transport;
  FailureEvidenceKind get localValidation => _$localValidation;
  FailureEvidenceKind get runtime => _$runtime;
  FailureEvidenceKind get unknown => _$unknown;
  FailureEvidenceKind get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  FailureEvidenceKind valueOf(String name) => _$valueOf(name);
  BuiltSet<FailureEvidenceKind> get values => _$values;
}

mixin _$FailureEvidenceKindMixin {
  // ignore: non_constant_identifier_names
  _$FailureEvidenceKindMeta get FailureEvidenceKind =>
      const _$FailureEvidenceKindMeta();
}

Serializer<FailureEvidenceKind> _$failureEvidenceKindSerializer =
    _$FailureEvidenceKindSerializer();

class _$FailureEvidenceKindSerializer
    implements PrimitiveSerializer<FailureEvidenceKind> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'upstreamResponse': 'upstream_response',
    'transport': 'transport',
    'localValidation': 'local_validation',
    'runtime': 'runtime',
    'unknown': 'unknown',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'upstream_response': 'upstreamResponse',
    'transport': 'transport',
    'local_validation': 'localValidation',
    'runtime': 'runtime',
    'unknown': 'unknown',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[FailureEvidenceKind];
  @override
  final String wireName = 'FailureEvidenceKind';

  @override
  Object serialize(Serializers serializers, FailureEvidenceKind object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  FailureEvidenceKind deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      FailureEvidenceKind.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
