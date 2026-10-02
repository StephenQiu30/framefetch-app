// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_analytics_daily_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AnalysisAnalyticsDailyResponse extends AnalysisAnalyticsDailyResponse {
  @override
  final Date date;
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

  factory _$AnalysisAnalyticsDailyResponse(
          [void Function(AnalysisAnalyticsDailyResponseBuilder)? updates]) =>
      (AnalysisAnalyticsDailyResponseBuilder()..update(updates))._build();

  _$AnalysisAnalyticsDailyResponse._(
      {required this.date,
      required this.total,
      required this.succeeded,
      required this.failed,
      required this.cancelled,
      required this.active})
      : super._();
  @override
  AnalysisAnalyticsDailyResponse rebuild(
          void Function(AnalysisAnalyticsDailyResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnalysisAnalyticsDailyResponseBuilder toBuilder() =>
      AnalysisAnalyticsDailyResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnalysisAnalyticsDailyResponse &&
        date == other.date &&
        total == other.total &&
        succeeded == other.succeeded &&
        failed == other.failed &&
        cancelled == other.cancelled &&
        active == other.active;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, succeeded.hashCode);
    _$hash = $jc(_$hash, failed.hashCode);
    _$hash = $jc(_$hash, cancelled.hashCode);
    _$hash = $jc(_$hash, active.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnalysisAnalyticsDailyResponse')
          ..add('date', date)
          ..add('total', total)
          ..add('succeeded', succeeded)
          ..add('failed', failed)
          ..add('cancelled', cancelled)
          ..add('active', active))
        .toString();
  }
}

class AnalysisAnalyticsDailyResponseBuilder
    implements
        Builder<AnalysisAnalyticsDailyResponse,
            AnalysisAnalyticsDailyResponseBuilder> {
  _$AnalysisAnalyticsDailyResponse? _$v;

  Date? _date;
  Date? get date => _$this._date;
  set date(Date? date) => _$this._date = date;

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

  AnalysisAnalyticsDailyResponseBuilder() {
    AnalysisAnalyticsDailyResponse._defaults(this);
  }

  AnalysisAnalyticsDailyResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _total = $v.total;
      _succeeded = $v.succeeded;
      _failed = $v.failed;
      _cancelled = $v.cancelled;
      _active = $v.active;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnalysisAnalyticsDailyResponse other) {
    _$v = other as _$AnalysisAnalyticsDailyResponse;
  }

  @override
  void update(void Function(AnalysisAnalyticsDailyResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnalysisAnalyticsDailyResponse build() => _build();

  _$AnalysisAnalyticsDailyResponse _build() {
    final _$result = _$v ??
        _$AnalysisAnalyticsDailyResponse._(
          date: BuiltValueNullFieldError.checkNotNull(
              date, r'AnalysisAnalyticsDailyResponse', 'date'),
          total: BuiltValueNullFieldError.checkNotNull(
              total, r'AnalysisAnalyticsDailyResponse', 'total'),
          succeeded: BuiltValueNullFieldError.checkNotNull(
              succeeded, r'AnalysisAnalyticsDailyResponse', 'succeeded'),
          failed: BuiltValueNullFieldError.checkNotNull(
              failed, r'AnalysisAnalyticsDailyResponse', 'failed'),
          cancelled: BuiltValueNullFieldError.checkNotNull(
              cancelled, r'AnalysisAnalyticsDailyResponse', 'cancelled'),
          active: BuiltValueNullFieldError.checkNotNull(
              active, r'AnalysisAnalyticsDailyResponse', 'active'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
