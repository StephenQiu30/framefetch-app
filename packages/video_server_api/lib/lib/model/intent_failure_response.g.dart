// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intent_failure_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$IntentFailureResponse extends IntentFailureResponse {
  @override
  final String code;
  @override
  final FailurePhase phase;
  @override
  final FailureScope scope;
  @override
  final FailureClass failureClass;
  @override
  final String? causeCode;
  @override
  final FailureEvidenceKind evidenceKind;
  @override
  final DateTime observedAt;
  @override
  final DateTime? retryAfter;
  @override
  final String? diagnosticRef;

  factory _$IntentFailureResponse(
          [void Function(IntentFailureResponseBuilder)? updates]) =>
      (IntentFailureResponseBuilder()..update(updates))._build();

  _$IntentFailureResponse._(
      {required this.code,
      required this.phase,
      required this.scope,
      required this.failureClass,
      this.causeCode,
      required this.evidenceKind,
      required this.observedAt,
      this.retryAfter,
      this.diagnosticRef})
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
        phase == other.phase &&
        scope == other.scope &&
        failureClass == other.failureClass &&
        causeCode == other.causeCode &&
        evidenceKind == other.evidenceKind &&
        observedAt == other.observedAt &&
        retryAfter == other.retryAfter &&
        diagnosticRef == other.diagnosticRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, phase.hashCode);
    _$hash = $jc(_$hash, scope.hashCode);
    _$hash = $jc(_$hash, failureClass.hashCode);
    _$hash = $jc(_$hash, causeCode.hashCode);
    _$hash = $jc(_$hash, evidenceKind.hashCode);
    _$hash = $jc(_$hash, observedAt.hashCode);
    _$hash = $jc(_$hash, retryAfter.hashCode);
    _$hash = $jc(_$hash, diagnosticRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IntentFailureResponse')
          ..add('code', code)
          ..add('phase', phase)
          ..add('scope', scope)
          ..add('failureClass', failureClass)
          ..add('causeCode', causeCode)
          ..add('evidenceKind', evidenceKind)
          ..add('observedAt', observedAt)
          ..add('retryAfter', retryAfter)
          ..add('diagnosticRef', diagnosticRef))
        .toString();
  }
}

class IntentFailureResponseBuilder
    implements Builder<IntentFailureResponse, IntentFailureResponseBuilder> {
  _$IntentFailureResponse? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  FailurePhase? _phase;
  FailurePhase? get phase => _$this._phase;
  set phase(FailurePhase? phase) => _$this._phase = phase;

  FailureScope? _scope;
  FailureScope? get scope => _$this._scope;
  set scope(FailureScope? scope) => _$this._scope = scope;

  FailureClass? _failureClass;
  FailureClass? get failureClass => _$this._failureClass;
  set failureClass(FailureClass? failureClass) =>
      _$this._failureClass = failureClass;

  String? _causeCode;
  String? get causeCode => _$this._causeCode;
  set causeCode(String? causeCode) => _$this._causeCode = causeCode;

  FailureEvidenceKind? _evidenceKind;
  FailureEvidenceKind? get evidenceKind => _$this._evidenceKind;
  set evidenceKind(FailureEvidenceKind? evidenceKind) =>
      _$this._evidenceKind = evidenceKind;

  DateTime? _observedAt;
  DateTime? get observedAt => _$this._observedAt;
  set observedAt(DateTime? observedAt) => _$this._observedAt = observedAt;

  DateTime? _retryAfter;
  DateTime? get retryAfter => _$this._retryAfter;
  set retryAfter(DateTime? retryAfter) => _$this._retryAfter = retryAfter;

  String? _diagnosticRef;
  String? get diagnosticRef => _$this._diagnosticRef;
  set diagnosticRef(String? diagnosticRef) =>
      _$this._diagnosticRef = diagnosticRef;

  IntentFailureResponseBuilder() {
    IntentFailureResponse._defaults(this);
  }

  IntentFailureResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _phase = $v.phase;
      _scope = $v.scope;
      _failureClass = $v.failureClass;
      _causeCode = $v.causeCode;
      _evidenceKind = $v.evidenceKind;
      _observedAt = $v.observedAt;
      _retryAfter = $v.retryAfter;
      _diagnosticRef = $v.diagnosticRef;
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
    final _$result = _$v ??
        _$IntentFailureResponse._(
          code: BuiltValueNullFieldError.checkNotNull(
              code, r'IntentFailureResponse', 'code'),
          phase: BuiltValueNullFieldError.checkNotNull(
              phase, r'IntentFailureResponse', 'phase'),
          scope: BuiltValueNullFieldError.checkNotNull(
              scope, r'IntentFailureResponse', 'scope'),
          failureClass: BuiltValueNullFieldError.checkNotNull(
              failureClass, r'IntentFailureResponse', 'failureClass'),
          causeCode: causeCode,
          evidenceKind: BuiltValueNullFieldError.checkNotNull(
              evidenceKind, r'IntentFailureResponse', 'evidenceKind'),
          observedAt: BuiltValueNullFieldError.checkNotNull(
              observedAt, r'IntentFailureResponse', 'observedAt'),
          retryAfter: retryAfter,
          diagnosticRef: diagnosticRef,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
