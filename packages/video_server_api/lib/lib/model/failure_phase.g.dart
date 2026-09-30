// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure_phase.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const FailurePhase _$recognize = const FailurePhase._('recognize');
const FailurePhase _$prepareContext = const FailurePhase._('prepareContext');
const FailurePhase _$fetchMetadata = const FailurePhase._('fetchMetadata');
const FailurePhase _$selectFormat = const FailurePhase._('selectFormat');
const FailurePhase _$probeMedia = const FailurePhase._('probeMedia');
const FailurePhase _$transfer = const FailurePhase._('transfer');
const FailurePhase _$validate = const FailurePhase._('validate');
const FailurePhase _$publish = const FailurePhase._('publish');
const FailurePhase _$unknownDefaultOpenApi =
    const FailurePhase._('unknownDefaultOpenApi');

FailurePhase _$valueOf(String name) {
  switch (name) {
    case 'recognize':
      return _$recognize;
    case 'prepareContext':
      return _$prepareContext;
    case 'fetchMetadata':
      return _$fetchMetadata;
    case 'selectFormat':
      return _$selectFormat;
    case 'probeMedia':
      return _$probeMedia;
    case 'transfer':
      return _$transfer;
    case 'validate':
      return _$validate;
    case 'publish':
      return _$publish;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<FailurePhase> _$values =
    BuiltSet<FailurePhase>(const <FailurePhase>[
  _$recognize,
  _$prepareContext,
  _$fetchMetadata,
  _$selectFormat,
  _$probeMedia,
  _$transfer,
  _$validate,
  _$publish,
  _$unknownDefaultOpenApi,
]);

class _$FailurePhaseMeta {
  const _$FailurePhaseMeta();
  FailurePhase get recognize => _$recognize;
  FailurePhase get prepareContext => _$prepareContext;
  FailurePhase get fetchMetadata => _$fetchMetadata;
  FailurePhase get selectFormat => _$selectFormat;
  FailurePhase get probeMedia => _$probeMedia;
  FailurePhase get transfer => _$transfer;
  FailurePhase get validate => _$validate;
  FailurePhase get publish => _$publish;
  FailurePhase get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  FailurePhase valueOf(String name) => _$valueOf(name);
  BuiltSet<FailurePhase> get values => _$values;
}

mixin _$FailurePhaseMixin {
  // ignore: non_constant_identifier_names
  _$FailurePhaseMeta get FailurePhase => const _$FailurePhaseMeta();
}

Serializer<FailurePhase> _$failurePhaseSerializer = _$FailurePhaseSerializer();

class _$FailurePhaseSerializer implements PrimitiveSerializer<FailurePhase> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'recognize': 'recognize',
    'prepareContext': 'prepare_context',
    'fetchMetadata': 'fetch_metadata',
    'selectFormat': 'select_format',
    'probeMedia': 'probe_media',
    'transfer': 'transfer',
    'validate': 'validate',
    'publish': 'publish',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'recognize': 'recognize',
    'prepare_context': 'prepareContext',
    'fetch_metadata': 'fetchMetadata',
    'select_format': 'selectFormat',
    'probe_media': 'probeMedia',
    'transfer': 'transfer',
    'validate': 'validate',
    'publish': 'publish',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[FailurePhase];
  @override
  final String wireName = 'FailurePhase';

  @override
  Object serialize(Serializers serializers, FailurePhase object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  FailurePhase deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      FailurePhase.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
