// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_media_evidence.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SkillMediaEvidenceSourceIdEnum _$skillMediaEvidenceSourceIdEnum_primary =
    const SkillMediaEvidenceSourceIdEnum._('primary');
const SkillMediaEvidenceSourceIdEnum
    _$skillMediaEvidenceSourceIdEnum_secondary =
    const SkillMediaEvidenceSourceIdEnum._('secondary');
const SkillMediaEvidenceSourceIdEnum
    _$skillMediaEvidenceSourceIdEnum_unknownDefaultOpenApi =
    const SkillMediaEvidenceSourceIdEnum._('unknownDefaultOpenApi');

SkillMediaEvidenceSourceIdEnum _$skillMediaEvidenceSourceIdEnumValueOf(
    String name) {
  switch (name) {
    case 'primary':
      return _$skillMediaEvidenceSourceIdEnum_primary;
    case 'secondary':
      return _$skillMediaEvidenceSourceIdEnum_secondary;
    case 'unknownDefaultOpenApi':
      return _$skillMediaEvidenceSourceIdEnum_unknownDefaultOpenApi;
    default:
      return _$skillMediaEvidenceSourceIdEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<SkillMediaEvidenceSourceIdEnum>
    _$skillMediaEvidenceSourceIdEnumValues = BuiltSet<
        SkillMediaEvidenceSourceIdEnum>(const <SkillMediaEvidenceSourceIdEnum>[
  _$skillMediaEvidenceSourceIdEnum_primary,
  _$skillMediaEvidenceSourceIdEnum_secondary,
  _$skillMediaEvidenceSourceIdEnum_unknownDefaultOpenApi,
]);

const SkillMediaEvidenceStatusEnum _$skillMediaEvidenceStatusEnum_observation =
    const SkillMediaEvidenceStatusEnum._('observation');
const SkillMediaEvidenceStatusEnum _$skillMediaEvidenceStatusEnum_inference =
    const SkillMediaEvidenceStatusEnum._('inference');
const SkillMediaEvidenceStatusEnum _$skillMediaEvidenceStatusEnum_suggestion =
    const SkillMediaEvidenceStatusEnum._('suggestion');
const SkillMediaEvidenceStatusEnum _$skillMediaEvidenceStatusEnum_unverified =
    const SkillMediaEvidenceStatusEnum._('unverified');
const SkillMediaEvidenceStatusEnum
    _$skillMediaEvidenceStatusEnum_unknownDefaultOpenApi =
    const SkillMediaEvidenceStatusEnum._('unknownDefaultOpenApi');

SkillMediaEvidenceStatusEnum _$skillMediaEvidenceStatusEnumValueOf(
    String name) {
  switch (name) {
    case 'observation':
      return _$skillMediaEvidenceStatusEnum_observation;
    case 'inference':
      return _$skillMediaEvidenceStatusEnum_inference;
    case 'suggestion':
      return _$skillMediaEvidenceStatusEnum_suggestion;
    case 'unverified':
      return _$skillMediaEvidenceStatusEnum_unverified;
    case 'unknownDefaultOpenApi':
      return _$skillMediaEvidenceStatusEnum_unknownDefaultOpenApi;
    default:
      return _$skillMediaEvidenceStatusEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<SkillMediaEvidenceStatusEnum>
    _$skillMediaEvidenceStatusEnumValues =
    BuiltSet<SkillMediaEvidenceStatusEnum>(const <SkillMediaEvidenceStatusEnum>[
  _$skillMediaEvidenceStatusEnum_observation,
  _$skillMediaEvidenceStatusEnum_inference,
  _$skillMediaEvidenceStatusEnum_suggestion,
  _$skillMediaEvidenceStatusEnum_unverified,
  _$skillMediaEvidenceStatusEnum_unknownDefaultOpenApi,
]);

Serializer<SkillMediaEvidenceSourceIdEnum>
    _$skillMediaEvidenceSourceIdEnumSerializer =
    _$SkillMediaEvidenceSourceIdEnumSerializer();
Serializer<SkillMediaEvidenceStatusEnum>
    _$skillMediaEvidenceStatusEnumSerializer =
    _$SkillMediaEvidenceStatusEnumSerializer();

class _$SkillMediaEvidenceSourceIdEnumSerializer
    implements PrimitiveSerializer<SkillMediaEvidenceSourceIdEnum> {
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
  final Iterable<Type> types = const <Type>[SkillMediaEvidenceSourceIdEnum];
  @override
  final String wireName = 'SkillMediaEvidenceSourceIdEnum';

  @override
  Object serialize(
          Serializers serializers, SkillMediaEvidenceSourceIdEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SkillMediaEvidenceSourceIdEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SkillMediaEvidenceSourceIdEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$SkillMediaEvidenceStatusEnumSerializer
    implements PrimitiveSerializer<SkillMediaEvidenceStatusEnum> {
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
  final Iterable<Type> types = const <Type>[SkillMediaEvidenceStatusEnum];
  @override
  final String wireName = 'SkillMediaEvidenceStatusEnum';

  @override
  Object serialize(Serializers serializers, SkillMediaEvidenceStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SkillMediaEvidenceStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SkillMediaEvidenceStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$SkillMediaEvidence extends SkillMediaEvidence {
  @override
  final SkillMediaEvidenceSourceIdEnum sourceId;
  @override
  final String sha256;
  @override
  final String frameId;
  @override
  final String frameSha256;
  @override
  final int timestampMs;
  @override
  final String claim;
  @override
  final SkillMediaEvidenceStatusEnum status;

  factory _$SkillMediaEvidence(
          [void Function(SkillMediaEvidenceBuilder)? updates]) =>
      (SkillMediaEvidenceBuilder()..update(updates))._build();

  _$SkillMediaEvidence._(
      {required this.sourceId,
      required this.sha256,
      required this.frameId,
      required this.frameSha256,
      required this.timestampMs,
      required this.claim,
      required this.status})
      : super._();
  @override
  SkillMediaEvidence rebuild(
          void Function(SkillMediaEvidenceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SkillMediaEvidenceBuilder toBuilder() =>
      SkillMediaEvidenceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SkillMediaEvidence &&
        sourceId == other.sourceId &&
        sha256 == other.sha256 &&
        frameId == other.frameId &&
        frameSha256 == other.frameSha256 &&
        timestampMs == other.timestampMs &&
        claim == other.claim &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, sourceId.hashCode);
    _$hash = $jc(_$hash, sha256.hashCode);
    _$hash = $jc(_$hash, frameId.hashCode);
    _$hash = $jc(_$hash, frameSha256.hashCode);
    _$hash = $jc(_$hash, timestampMs.hashCode);
    _$hash = $jc(_$hash, claim.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SkillMediaEvidence')
          ..add('sourceId', sourceId)
          ..add('sha256', sha256)
          ..add('frameId', frameId)
          ..add('frameSha256', frameSha256)
          ..add('timestampMs', timestampMs)
          ..add('claim', claim)
          ..add('status', status))
        .toString();
  }
}

class SkillMediaEvidenceBuilder
    implements Builder<SkillMediaEvidence, SkillMediaEvidenceBuilder> {
  _$SkillMediaEvidence? _$v;

  SkillMediaEvidenceSourceIdEnum? _sourceId;
  SkillMediaEvidenceSourceIdEnum? get sourceId => _$this._sourceId;
  set sourceId(SkillMediaEvidenceSourceIdEnum? sourceId) =>
      _$this._sourceId = sourceId;

  String? _sha256;
  String? get sha256 => _$this._sha256;
  set sha256(String? sha256) => _$this._sha256 = sha256;

  String? _frameId;
  String? get frameId => _$this._frameId;
  set frameId(String? frameId) => _$this._frameId = frameId;

  String? _frameSha256;
  String? get frameSha256 => _$this._frameSha256;
  set frameSha256(String? frameSha256) => _$this._frameSha256 = frameSha256;

  int? _timestampMs;
  int? get timestampMs => _$this._timestampMs;
  set timestampMs(int? timestampMs) => _$this._timestampMs = timestampMs;

  String? _claim;
  String? get claim => _$this._claim;
  set claim(String? claim) => _$this._claim = claim;

  SkillMediaEvidenceStatusEnum? _status;
  SkillMediaEvidenceStatusEnum? get status => _$this._status;
  set status(SkillMediaEvidenceStatusEnum? status) => _$this._status = status;

  SkillMediaEvidenceBuilder() {
    SkillMediaEvidence._defaults(this);
  }

  SkillMediaEvidenceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sourceId = $v.sourceId;
      _sha256 = $v.sha256;
      _frameId = $v.frameId;
      _frameSha256 = $v.frameSha256;
      _timestampMs = $v.timestampMs;
      _claim = $v.claim;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SkillMediaEvidence other) {
    _$v = other as _$SkillMediaEvidence;
  }

  @override
  void update(void Function(SkillMediaEvidenceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SkillMediaEvidence build() => _build();

  _$SkillMediaEvidence _build() {
    final _$result = _$v ??
        _$SkillMediaEvidence._(
          sourceId: BuiltValueNullFieldError.checkNotNull(
              sourceId, r'SkillMediaEvidence', 'sourceId'),
          sha256: BuiltValueNullFieldError.checkNotNull(
              sha256, r'SkillMediaEvidence', 'sha256'),
          frameId: BuiltValueNullFieldError.checkNotNull(
              frameId, r'SkillMediaEvidence', 'frameId'),
          frameSha256: BuiltValueNullFieldError.checkNotNull(
              frameSha256, r'SkillMediaEvidence', 'frameSha256'),
          timestampMs: BuiltValueNullFieldError.checkNotNull(
              timestampMs, r'SkillMediaEvidence', 'timestampMs'),
          claim: BuiltValueNullFieldError.checkNotNull(
              claim, r'SkillMediaEvidence', 'claim'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'SkillMediaEvidence', 'status'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
