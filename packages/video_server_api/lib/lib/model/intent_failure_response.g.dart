// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intent_failure_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const IntentFailureResponseStageEnum _$intentFailureResponseStageEnum_resolve =
    const IntentFailureResponseStageEnum._('resolve');
const IntentFailureResponseStageEnum _$intentFailureResponseStageEnum_download =
    const IntentFailureResponseStageEnum._('download');
const IntentFailureResponseStageEnum _$intentFailureResponseStageEnum_validate =
    const IntentFailureResponseStageEnum._('validate');
const IntentFailureResponseStageEnum _$intentFailureResponseStageEnum_publish =
    const IntentFailureResponseStageEnum._('publish');
const IntentFailureResponseStageEnum
    _$intentFailureResponseStageEnum_unknownDefaultOpenApi =
    const IntentFailureResponseStageEnum._('unknownDefaultOpenApi');

IntentFailureResponseStageEnum _$intentFailureResponseStageEnumValueOf(
    String name) {
  switch (name) {
    case 'resolve':
      return _$intentFailureResponseStageEnum_resolve;
    case 'download':
      return _$intentFailureResponseStageEnum_download;
    case 'validate':
      return _$intentFailureResponseStageEnum_validate;
    case 'publish':
      return _$intentFailureResponseStageEnum_publish;
    case 'unknownDefaultOpenApi':
      return _$intentFailureResponseStageEnum_unknownDefaultOpenApi;
    default:
      return _$intentFailureResponseStageEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<IntentFailureResponseStageEnum>
    _$intentFailureResponseStageEnumValues = BuiltSet<
        IntentFailureResponseStageEnum>(const <IntentFailureResponseStageEnum>[
  _$intentFailureResponseStageEnum_resolve,
  _$intentFailureResponseStageEnum_download,
  _$intentFailureResponseStageEnum_validate,
  _$intentFailureResponseStageEnum_publish,
  _$intentFailureResponseStageEnum_unknownDefaultOpenApi,
]);

const IntentFailureResponseGateEnum _$intentFailureResponseGateEnum_gateOne =
    const IntentFailureResponseGateEnum._('gateOne');
const IntentFailureResponseGateEnum _$intentFailureResponseGateEnum_gateTwo =
    const IntentFailureResponseGateEnum._('gateTwo');
const IntentFailureResponseGateEnum _$intentFailureResponseGateEnum_gateThree =
    const IntentFailureResponseGateEnum._('gateThree');
const IntentFailureResponseGateEnum _$intentFailureResponseGateEnum_none =
    const IntentFailureResponseGateEnum._('none');
const IntentFailureResponseGateEnum
    _$intentFailureResponseGateEnum_unknownDefaultOpenApi =
    const IntentFailureResponseGateEnum._('unknownDefaultOpenApi');

IntentFailureResponseGateEnum _$intentFailureResponseGateEnumValueOf(
    String name) {
  switch (name) {
    case 'gateOne':
      return _$intentFailureResponseGateEnum_gateOne;
    case 'gateTwo':
      return _$intentFailureResponseGateEnum_gateTwo;
    case 'gateThree':
      return _$intentFailureResponseGateEnum_gateThree;
    case 'none':
      return _$intentFailureResponseGateEnum_none;
    case 'unknownDefaultOpenApi':
      return _$intentFailureResponseGateEnum_unknownDefaultOpenApi;
    default:
      return _$intentFailureResponseGateEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<IntentFailureResponseGateEnum>
    _$intentFailureResponseGateEnumValues = BuiltSet<
        IntentFailureResponseGateEnum>(const <IntentFailureResponseGateEnum>[
  _$intentFailureResponseGateEnum_gateOne,
  _$intentFailureResponseGateEnum_gateTwo,
  _$intentFailureResponseGateEnum_gateThree,
  _$intentFailureResponseGateEnum_none,
  _$intentFailureResponseGateEnum_unknownDefaultOpenApi,
]);

Serializer<IntentFailureResponseStageEnum>
    _$intentFailureResponseStageEnumSerializer =
    _$IntentFailureResponseStageEnumSerializer();
Serializer<IntentFailureResponseGateEnum>
    _$intentFailureResponseGateEnumSerializer =
    _$IntentFailureResponseGateEnumSerializer();

class _$IntentFailureResponseStageEnumSerializer
    implements PrimitiveSerializer<IntentFailureResponseStageEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'resolve': 'resolve',
    'download': 'download',
    'validate': 'validate',
    'publish': 'publish',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'resolve': 'resolve',
    'download': 'download',
    'validate': 'validate',
    'publish': 'publish',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[IntentFailureResponseStageEnum];
  @override
  final String wireName = 'IntentFailureResponseStageEnum';

  @override
  Object serialize(
          Serializers serializers, IntentFailureResponseStageEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  IntentFailureResponseStageEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      IntentFailureResponseStageEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$IntentFailureResponseGateEnumSerializer
    implements PrimitiveSerializer<IntentFailureResponseGateEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'gateOne': '①',
    'gateTwo': '②',
    'gateThree': '③',
    'none': 'none',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    '①': 'gateOne',
    '②': 'gateTwo',
    '③': 'gateThree',
    'none': 'none',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[IntentFailureResponseGateEnum];
  @override
  final String wireName = 'IntentFailureResponseGateEnum';

  @override
  Object serialize(
          Serializers serializers, IntentFailureResponseGateEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  IntentFailureResponseGateEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      IntentFailureResponseGateEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$IntentFailureResponse extends IntentFailureResponse {
  @override
  final String code;
  @override
  final FailureClass failureClass;
  @override
  final String layer;
  @override
  final IntentFailureResponseStageEnum stage;
  @override
  final IntentFailureResponseGateEnum gate;
  @override
  final BuiltMap<String, EvidenceValue?> evidence;
  @override
  final String summary;

  factory _$IntentFailureResponse(
          [void Function(IntentFailureResponseBuilder)? updates]) =>
      (IntentFailureResponseBuilder()..update(updates))._build();

  _$IntentFailureResponse._(
      {required this.code,
      required this.failureClass,
      required this.layer,
      required this.stage,
      required this.gate,
      required this.evidence,
      required this.summary})
      : super._();
  @override
  IntentFailureResponse rebuild(
          void Function(IntentFailureResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IntentFailureResponseBuilder toBuilder() =>
      IntentFailureResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IntentFailureResponse &&
        code == other.code &&
        failureClass == other.failureClass &&
        layer == other.layer &&
        stage == other.stage &&
        gate == other.gate &&
        evidence == other.evidence &&
        summary == other.summary;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, failureClass.hashCode);
    _$hash = $jc(_$hash, layer.hashCode);
    _$hash = $jc(_$hash, stage.hashCode);
    _$hash = $jc(_$hash, gate.hashCode);
    _$hash = $jc(_$hash, evidence.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IntentFailureResponse')
          ..add('code', code)
          ..add('failureClass', failureClass)
          ..add('layer', layer)
          ..add('stage', stage)
          ..add('gate', gate)
          ..add('evidence', evidence)
          ..add('summary', summary))
        .toString();
  }
}

class IntentFailureResponseBuilder
    implements Builder<IntentFailureResponse, IntentFailureResponseBuilder> {
  _$IntentFailureResponse? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  FailureClass? _failureClass;
  FailureClass? get failureClass => _$this._failureClass;
  set failureClass(FailureClass? failureClass) =>
      _$this._failureClass = failureClass;

  String? _layer;
  String? get layer => _$this._layer;
  set layer(String? layer) => _$this._layer = layer;

  IntentFailureResponseStageEnum? _stage;
  IntentFailureResponseStageEnum? get stage => _$this._stage;
  set stage(IntentFailureResponseStageEnum? stage) => _$this._stage = stage;

  IntentFailureResponseGateEnum? _gate;
  IntentFailureResponseGateEnum? get gate => _$this._gate;
  set gate(IntentFailureResponseGateEnum? gate) => _$this._gate = gate;

  MapBuilder<String, EvidenceValue?>? _evidence;
  MapBuilder<String, EvidenceValue?> get evidence =>
      _$this._evidence ??= MapBuilder<String, EvidenceValue?>();
  set evidence(MapBuilder<String, EvidenceValue?>? evidence) =>
      _$this._evidence = evidence;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  IntentFailureResponseBuilder() {
    IntentFailureResponse._defaults(this);
  }

  IntentFailureResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _failureClass = $v.failureClass;
      _layer = $v.layer;
      _stage = $v.stage;
      _gate = $v.gate;
      _evidence = $v.evidence.toBuilder();
      _summary = $v.summary;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IntentFailureResponse other) {
    _$v = other as _$IntentFailureResponse;
  }

  @override
  void update(void Function(IntentFailureResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IntentFailureResponse build() => _build();

  _$IntentFailureResponse _build() {
    _$IntentFailureResponse _$result;
    try {
      _$result = _$v ??
          _$IntentFailureResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'IntentFailureResponse', 'code'),
            failureClass: BuiltValueNullFieldError.checkNotNull(
                failureClass, r'IntentFailureResponse', 'failureClass'),
            layer: BuiltValueNullFieldError.checkNotNull(
                layer, r'IntentFailureResponse', 'layer'),
            stage: BuiltValueNullFieldError.checkNotNull(
                stage, r'IntentFailureResponse', 'stage'),
            gate: BuiltValueNullFieldError.checkNotNull(
                gate, r'IntentFailureResponse', 'gate'),
            evidence: evidence.build(),
            summary: BuiltValueNullFieldError.checkNotNull(
                summary, r'IntentFailureResponse', 'summary'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'evidence';
        evidence.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'IntentFailureResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
