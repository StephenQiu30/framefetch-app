// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_run_history_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AnalysisRunHistoryResponse extends AnalysisRunHistoryResponse {
  @override
  final String id;
  @override
  final int runNo;
  @override
  final String trigger;
  @override
  final AnalysisStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? finishedAt;
  @override
  final AnalysisErrorCode? errorCode;

  factory _$AnalysisRunHistoryResponse(
          [void Function(AnalysisRunHistoryResponseBuilder)? updates]) =>
      (AnalysisRunHistoryResponseBuilder()..update(updates))._build();

  _$AnalysisRunHistoryResponse._(
      {required this.id,
      required this.runNo,
      required this.trigger,
      required this.status,
      required this.createdAt,
      this.startedAt,
      this.finishedAt,
      this.errorCode})
      : super._();
  @override
  AnalysisRunHistoryResponse rebuild(
          void Function(AnalysisRunHistoryResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnalysisRunHistoryResponseBuilder toBuilder() =>
      AnalysisRunHistoryResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnalysisRunHistoryResponse &&
        id == other.id &&
        runNo == other.runNo &&
        trigger == other.trigger &&
        status == other.status &&
        createdAt == other.createdAt &&
        startedAt == other.startedAt &&
        finishedAt == other.finishedAt &&
        errorCode == other.errorCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, runNo.hashCode);
    _$hash = $jc(_$hash, trigger.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, startedAt.hashCode);
    _$hash = $jc(_$hash, finishedAt.hashCode);
    _$hash = $jc(_$hash, errorCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnalysisRunHistoryResponse')
          ..add('id', id)
          ..add('runNo', runNo)
          ..add('trigger', trigger)
          ..add('status', status)
          ..add('createdAt', createdAt)
          ..add('startedAt', startedAt)
          ..add('finishedAt', finishedAt)
          ..add('errorCode', errorCode))
        .toString();
  }
}

class AnalysisRunHistoryResponseBuilder
    implements
        Builder<AnalysisRunHistoryResponse, AnalysisRunHistoryResponseBuilder> {
  _$AnalysisRunHistoryResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _runNo;
  int? get runNo => _$this._runNo;
  set runNo(int? runNo) => _$this._runNo = runNo;

  String? _trigger;
  String? get trigger => _$this._trigger;
  set trigger(String? trigger) => _$this._trigger = trigger;

  AnalysisStatus? _status;
  AnalysisStatus? get status => _$this._status;
  set status(AnalysisStatus? status) => _$this._status = status;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _startedAt;
  DateTime? get startedAt => _$this._startedAt;
  set startedAt(DateTime? startedAt) => _$this._startedAt = startedAt;

  DateTime? _finishedAt;
  DateTime? get finishedAt => _$this._finishedAt;
  set finishedAt(DateTime? finishedAt) => _$this._finishedAt = finishedAt;

  AnalysisErrorCode? _errorCode;
  AnalysisErrorCode? get errorCode => _$this._errorCode;
  set errorCode(AnalysisErrorCode? errorCode) => _$this._errorCode = errorCode;

  AnalysisRunHistoryResponseBuilder() {
    AnalysisRunHistoryResponse._defaults(this);
  }

  AnalysisRunHistoryResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _runNo = $v.runNo;
      _trigger = $v.trigger;
      _status = $v.status;
      _createdAt = $v.createdAt;
      _startedAt = $v.startedAt;
      _finishedAt = $v.finishedAt;
      _errorCode = $v.errorCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnalysisRunHistoryResponse other) {
    _$v = other as _$AnalysisRunHistoryResponse;
  }

  @override
  void update(void Function(AnalysisRunHistoryResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnalysisRunHistoryResponse build() => _build();

  _$AnalysisRunHistoryResponse _build() {
    final _$result = _$v ??
        _$AnalysisRunHistoryResponse._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'AnalysisRunHistoryResponse', 'id'),
          runNo: BuiltValueNullFieldError.checkNotNull(
              runNo, r'AnalysisRunHistoryResponse', 'runNo'),
          trigger: BuiltValueNullFieldError.checkNotNull(
              trigger, r'AnalysisRunHistoryResponse', 'trigger'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'AnalysisRunHistoryResponse', 'status'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'AnalysisRunHistoryResponse', 'createdAt'),
          startedAt: startedAt,
          finishedAt: finishedAt,
          errorCode: errorCode,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
