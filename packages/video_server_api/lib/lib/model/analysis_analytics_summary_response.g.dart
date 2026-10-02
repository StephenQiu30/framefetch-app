// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_analytics_summary_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AnalysisAnalyticsSummaryResponse
    extends AnalysisAnalyticsSummaryResponse {
  @override
  final int total;
  @override
  final int succeeded;
  @override
  final int failed;
  @override
  final int cancelled;
  @override
  final int active;
  @override
  final num? averageDurationSeconds;
  @override
  final int completedDurationCount;

  factory _$AnalysisAnalyticsSummaryResponse(
          [void Function(AnalysisAnalyticsSummaryResponseBuilder)? updates]) =>
      (AnalysisAnalyticsSummaryResponseBuilder()..update(updates))._build();

  _$AnalysisAnalyticsSummaryResponse._(
      {required this.total,
      required this.succeeded,
      required this.failed,
      required this.cancelled,
      required this.active,
      this.averageDurationSeconds,
      required this.completedDurationCount})
      : super._();
  @override
  AnalysisAnalyticsSummaryResponse rebuild(
          void Function(AnalysisAnalyticsSummaryResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnalysisAnalyticsSummaryResponseBuilder toBuilder() =>
      AnalysisAnalyticsSummaryResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnalysisAnalyticsSummaryResponse &&
        total == other.total &&
        succeeded == other.succeeded &&
        failed == other.failed &&
        cancelled == other.cancelled &&
        active == other.active &&
        averageDurationSeconds == other.averageDurationSeconds &&
        completedDurationCount == other.completedDurationCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, succeeded.hashCode);
    _$hash = $jc(_$hash, failed.hashCode);
    _$hash = $jc(_$hash, cancelled.hashCode);
    _$hash = $jc(_$hash, active.hashCode);
    _$hash = $jc(_$hash, averageDurationSeconds.hashCode);
    _$hash = $jc(_$hash, completedDurationCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnalysisAnalyticsSummaryResponse')
          ..add('total', total)
          ..add('succeeded', succeeded)
          ..add('failed', failed)
          ..add('cancelled', cancelled)
          ..add('active', active)
          ..add('averageDurationSeconds', averageDurationSeconds)
          ..add('completedDurationCount', completedDurationCount))
        .toString();
  }
}

class AnalysisAnalyticsSummaryResponseBuilder
    implements
        Builder<AnalysisAnalyticsSummaryResponse,
            AnalysisAnalyticsSummaryResponseBuilder> {
  _$AnalysisAnalyticsSummaryResponse? _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  int? _succeeded;
  int? get succeeded => _$this._succeeded;
  set succeeded(int? succeeded) => _$this._succeeded = succeeded;

  int? _failed;
  int? get failed => _$this._failed;
  set failed(int? failed) => _$this._failed = failed;

  int? _cancelled;
  int? get cancelled => _$this._cancelled;
  set cancelled(int? cancelled) => _$this._cancelled = cancelled;

  int? _active;
  int? get active => _$this._active;
  set active(int? active) => _$this._active = active;

  num? _averageDurationSeconds;
  num? get averageDurationSeconds => _$this._averageDurationSeconds;
  set averageDurationSeconds(num? averageDurationSeconds) =>
      _$this._averageDurationSeconds = averageDurationSeconds;

  int? _completedDurationCount;
  int? get completedDurationCount => _$this._completedDurationCount;
  set completedDurationCount(int? completedDurationCount) =>
      _$this._completedDurationCount = completedDurationCount;

  AnalysisAnalyticsSummaryResponseBuilder() {
    AnalysisAnalyticsSummaryResponse._defaults(this);
  }

  AnalysisAnalyticsSummaryResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _total = $v.total;
      _succeeded = $v.succeeded;
      _failed = $v.failed;
      _cancelled = $v.cancelled;
      _active = $v.active;
      _averageDurationSeconds = $v.averageDurationSeconds;
      _completedDurationCount = $v.completedDurationCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnalysisAnalyticsSummaryResponse other) {
    _$v = other as _$AnalysisAnalyticsSummaryResponse;
  }

  @override
  void update(void Function(AnalysisAnalyticsSummaryResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnalysisAnalyticsSummaryResponse build() => _build();

  _$AnalysisAnalyticsSummaryResponse _build() {
    final _$result = _$v ??
        _$AnalysisAnalyticsSummaryResponse._(
          total: BuiltValueNullFieldError.checkNotNull(
              total, r'AnalysisAnalyticsSummaryResponse', 'total'),
          succeeded: BuiltValueNullFieldError.checkNotNull(
              succeeded, r'AnalysisAnalyticsSummaryResponse', 'succeeded'),
          failed: BuiltValueNullFieldError.checkNotNull(
              failed, r'AnalysisAnalyticsSummaryResponse', 'failed'),
          cancelled: BuiltValueNullFieldError.checkNotNull(
              cancelled, r'AnalysisAnalyticsSummaryResponse', 'cancelled'),
          active: BuiltValueNullFieldError.checkNotNull(
              active, r'AnalysisAnalyticsSummaryResponse', 'active'),
          averageDurationSeconds: averageDurationSeconds,
          completedDurationCount: BuiltValueNullFieldError.checkNotNull(
              completedDurationCount,
              r'AnalysisAnalyticsSummaryResponse',
              'completedDurationCount'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
