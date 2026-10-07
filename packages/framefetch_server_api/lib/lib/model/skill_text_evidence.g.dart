// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_text_evidence.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SkillTextEvidenceSourceIdEnum _$skillTextEvidenceSourceIdEnum_primary =
    const SkillTextEvidenceSourceIdEnum._('primary');
const SkillTextEvidenceSourceIdEnum _$skillTextEvidenceSourceIdEnum_secondary =
    const SkillTextEvidenceSourceIdEnum._('secondary');
const SkillTextEvidenceSourceIdEnum
    _$skillTextEvidenceSourceIdEnum_unknownDefaultOpenApi =
    const SkillTextEvidenceSourceIdEnum._('unknownDefaultOpenApi');

SkillTextEvidenceSourceIdEnum _$skillTextEvidenceSourceIdEnumValueOf(
    String name) {
  switch (name) {
    case 'primary':
      return _$skillTextEvidenceSourceIdEnum_primary;
    case 'secondary':
      return _$skillTextEvidenceSourceIdEnum_secondary;
    case 'unknownDefaultOpenApi':
      return _$skillTextEvidenceSourceIdEnum_unknownDefaultOpenApi;
    default:
      return _$skillTextEvidenceSourceIdEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<SkillTextEvidenceSourceIdEnum>
    _$skillTextEvidenceSourceIdEnumValues = BuiltSet<
        SkillTextEvidenceSourceIdEnum>(const <SkillTextEvidenceSourceIdEnum>[
  _$skillTextEvidenceSourceIdEnum_primary,
  _$skillTextEvidenceSourceIdEnum_secondary,
  _$skillTextEvidenceSourceIdEnum_unknownDefaultOpenApi,
]);

const SkillTextEvidenceStatusEnum _$skillTextEvidenceStatusEnum_observation =
    const SkillTextEvidenceStatusEnum._('observation');
const SkillTextEvidenceStatusEnum _$skillTextEvidenceStatusEnum_inference =
    const SkillTextEvidenceStatusEnum._('inference');
const SkillTextEvidenceStatusEnum _$skillTextEvidenceStatusEnum_suggestion =
    const SkillTextEvidenceStatusEnum._('suggestion');
const SkillTextEvidenceStatusEnum _$skillTextEvidenceStatusEnum_unverified =
    const SkillTextEvidenceStatusEnum._('unverified');
const SkillTextEvidenceStatusEnum
    _$skillTextEvidenceStatusEnum_unknownDefaultOpenApi =
    const SkillTextEvidenceStatusEnum._('unknownDefaultOpenApi');

SkillTextEvidenceStatusEnum _$skillTextEvidenceStatusEnumValueOf(String name) {
  switch (name) {
    case 'observation':
      return _$skillTextEvidenceStatusEnum_observation;
    case 'inference':
      return _$skillTextEvidenceStatusEnum_inference;
    case 'suggestion':
      return _$skillTextEvidenceStatusEnum_suggestion;
    case 'unverified':
      return _$skillTextEvidenceStatusEnum_unverified;
    case 'unknownDefaultOpenApi':
      return _$skillTextEvidenceStatusEnum_unknownDefaultOpenApi;
    default:
      return _$skillTextEvidenceStatusEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<SkillTextEvidenceStatusEnum>
    _$skillTextEvidenceStatusEnumValues =
    BuiltSet<SkillTextEvidenceStatusEnum>(const <SkillTextEvidenceStatusEnum>[
  _$skillTextEvidenceStatusEnum_observation,
  _$skillTextEvidenceStatusEnum_inference,
  _$skillTextEvidenceStatusEnum_suggestion,
  _$skillTextEvidenceStatusEnum_unverified,
  _$skillTextEvidenceStatusEnum_unknownDefaultOpenApi,
]);

Serializer<SkillTextEvidenceSourceIdEnum>
    _$skillTextEvidenceSourceIdEnumSerializer =
    _$SkillTextEvidenceSourceIdEnumSerializer();
Serializer<SkillTextEvidenceStatusEnum>
    _$skillTextEvidenceStatusEnumSerializer =
    _$SkillTextEvidenceStatusEnumSerializer();

class _$SkillTextEvidenceSourceIdEnumSerializer
    implements PrimitiveSerializer<SkillTextEvidenceSourceIdEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'primary': 'primary',
    'secondary': 'secondary',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'primary': 'primary',
    'secondary': 'secondary',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[SkillTextEvidenceSourceIdEnum];
  @override
  final String wireName = 'SkillTextEvidenceSourceIdEnum';

  @override
  Object serialize(
          Serializers serializers, SkillTextEvidenceSourceIdEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SkillTextEvidenceSourceIdEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SkillTextEvidenceSourceIdEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$SkillTextEvidenceStatusEnumSerializer
    implements PrimitiveSerializer<SkillTextEvidenceStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'observation': 'observation',
    'inference': 'inference',
    'suggestion': 'suggestion',
    'unverified': 'unverified',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'observation': 'observation',
    'inference': 'inference',
    'suggestion': 'suggestion',
    'unverified': 'unverified',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[SkillTextEvidenceStatusEnum];
  @override
  final String wireName = 'SkillTextEvidenceStatusEnum';

  @override
  Object serialize(Serializers serializers, SkillTextEvidenceStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SkillTextEvidenceStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SkillTextEvidenceStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$SkillTextEvidence extends SkillTextEvidence {
  @override
  final SkillTextEvidenceSourceIdEnum sourceId;
  @override
  final String sha256;
  @override
  final int start;
  @override
  final int end;
  @override
  final String quote;
  @override
  final String claim;
  @override
  final SkillTextEvidenceStatusEnum status;

  factory _$SkillTextEvidence(
          [void Function(SkillTextEvidenceBuilder)? updates]) =>
      (SkillTextEvidenceBuilder()..update(updates))._build();

  _$SkillTextEvidence._(
      {required this.sourceId,
      required this.sha256,
      required this.start,
      required this.end,
      required this.quote,
      required this.claim,
      required this.status})
      : super._();
  @override
  SkillTextEvidence rebuild(void Function(SkillTextEvidenceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SkillTextEvidenceBuilder toBuilder() =>
      SkillTextEvidenceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SkillTextEvidence &&
        sourceId == other.sourceId &&
        sha256 == other.sha256 &&
        start == other.start &&
        end == other.end &&
        quote == other.quote &&
        claim == other.claim &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, sourceId.hashCode);
    _$hash = $jc(_$hash, sha256.hashCode);
    _$hash = $jc(_$hash, start.hashCode);
    _$hash = $jc(_$hash, end.hashCode);
    _$hash = $jc(_$hash, quote.hashCode);
    _$hash = $jc(_$hash, claim.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SkillTextEvidence')
          ..add('sourceId', sourceId)
          ..add('sha256', sha256)
          ..add('start', start)
          ..add('end', end)
          ..add('quote', quote)
          ..add('claim', claim)
          ..add('status', status))
        .toString();
  }
}

class SkillTextEvidenceBuilder
    implements Builder<SkillTextEvidence, SkillTextEvidenceBuilder> {
  _$SkillTextEvidence? _$v;

  SkillTextEvidenceSourceIdEnum? _sourceId;
  SkillTextEvidenceSourceIdEnum? get sourceId => _$this._sourceId;
  set sourceId(SkillTextEvidenceSourceIdEnum? sourceId) =>
      _$this._sourceId = sourceId;

  String? _sha256;
  String? get sha256 => _$this._sha256;
  set sha256(String? sha256) => _$this._sha256 = sha256;

  int? _start;
  int? get start => _$this._start;
  set start(int? start) => _$this._start = start;

  int? _end;
  int? get end => _$this._end;
  set end(int? end) => _$this._end = end;

  String? _quote;
  String? get quote => _$this._quote;
  set quote(String? quote) => _$this._quote = quote;

  String? _claim;
  String? get claim => _$this._claim;
  set claim(String? claim) => _$this._claim = claim;

  SkillTextEvidenceStatusEnum? _status;
  SkillTextEvidenceStatusEnum? get status => _$this._status;
  set status(SkillTextEvidenceStatusEnum? status) => _$this._status = status;

  SkillTextEvidenceBuilder() {
    SkillTextEvidence._defaults(this);
  }

  SkillTextEvidenceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sourceId = $v.sourceId;
      _sha256 = $v.sha256;
      _start = $v.start;
      _end = $v.end;
      _quote = $v.quote;
      _claim = $v.claim;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SkillTextEvidence other) {
    _$v = other as _$SkillTextEvidence;
  }

  @override
  void update(void Function(SkillTextEvidenceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SkillTextEvidence build() => _build();

  _$SkillTextEvidence _build() {
    final _$result = _$v ??
        _$SkillTextEvidence._(
          sourceId: BuiltValueNullFieldError.checkNotNull(
              sourceId, r'SkillTextEvidence', 'sourceId'),
          sha256: BuiltValueNullFieldError.checkNotNull(
              sha256, r'SkillTextEvidence', 'sha256'),
          start: BuiltValueNullFieldError.checkNotNull(
              start, r'SkillTextEvidence', 'start'),
          end: BuiltValueNullFieldError.checkNotNull(
              end, r'SkillTextEvidence', 'end'),
          quote: BuiltValueNullFieldError.checkNotNull(
              quote, r'SkillTextEvidence', 'quote'),
          claim: BuiltValueNullFieldError.checkNotNull(
              claim, r'SkillTextEvidence', 'claim'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'SkillTextEvidence', 'status'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
