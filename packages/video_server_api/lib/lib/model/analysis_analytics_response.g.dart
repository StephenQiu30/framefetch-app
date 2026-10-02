// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_analytics_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AnalysisAnalyticsResponse extends AnalysisAnalyticsResponse {
  @override
  final int periodDays;
  @override
  final DateTime start;
  @override
  final DateTime end;
  @override
  final AnalysisAnalyticsSummaryResponse summary;
  @override
  final BuiltList<AnalysisAnalyticsDailyResponse> daily;
  @override
  final BuiltList<AnalysisAnalyticsInputResponse> inputs;

  factory _$AnalysisAnalyticsResponse(
          [void Function(AnalysisAnalyticsResponseBuilder)? updates]) =>
      (AnalysisAnalyticsResponseBuilder()..update(updates))._build();

  _$AnalysisAnalyticsResponse._(
      {required this.periodDays,
      required this.start,
      required this.end,
      required this.summary,
      required this.daily,
      required this.inputs})
      : super._();
  @override
  AnalysisAnalyticsResponse rebuild(
          void Function(AnalysisAnalyticsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnalysisAnalyticsResponseBuilder toBuilder() =>
      AnalysisAnalyticsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnalysisAnalyticsResponse &&
        periodDays == other.periodDays &&
        start == other.start &&
        end == other.end &&
        summary == other.summary &&
        daily == other.daily &&
        inputs == other.inputs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, periodDays.hashCode);
    _$hash = $jc(_$hash, start.hashCode);
    _$hash = $jc(_$hash, end.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, daily.hashCode);
    _$hash = $jc(_$hash, inputs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnalysisAnalyticsResponse')
          ..add('periodDays', periodDays)
          ..add('start', start)
          ..add('end', end)
          ..add('summary', summary)
          ..add('daily', daily)
          ..add('inputs', inputs))
        .toString();
  }
}

class AnalysisAnalyticsResponseBuilder
    implements
        Builder<AnalysisAnalyticsResponse, AnalysisAnalyticsResponseBuilder> {
  _$AnalysisAnalyticsResponse? _$v;

  int? _periodDays;
  int? get periodDays => _$this._periodDays;
  set periodDays(int? periodDays) => _$this._periodDays = periodDays;

  DateTime? _start;
  DateTime? get start => _$this._start;
  set start(DateTime? start) => _$this._start = start;

  DateTime? _end;
  DateTime? get end => _$this._end;
  set end(DateTime? end) => _$this._end = end;

  AnalysisAnalyticsSummaryResponseBuilder? _summary;
  AnalysisAnalyticsSummaryResponseBuilder get summary =>
      _$this._summary ??= AnalysisAnalyticsSummaryResponseBuilder();
  set summary(AnalysisAnalyticsSummaryResponseBuilder? summary) =>
      _$this._summary = summary;

  ListBuilder<AnalysisAnalyticsDailyResponse>? _daily;
  ListBuilder<AnalysisAnalyticsDailyResponse> get daily =>
      _$this._daily ??= ListBuilder<AnalysisAnalyticsDailyResponse>();
  set daily(ListBuilder<AnalysisAnalyticsDailyResponse>? daily) =>
      _$this._daily = daily;

  ListBuilder<AnalysisAnalyticsInputResponse>? _inputs;
  ListBuilder<AnalysisAnalyticsInputResponse> get inputs =>
      _$this._inputs ??= ListBuilder<AnalysisAnalyticsInputResponse>();
  set inputs(ListBuilder<AnalysisAnalyticsInputResponse>? inputs) =>
      _$this._inputs = inputs;

  AnalysisAnalyticsResponseBuilder() {
    AnalysisAnalyticsResponse._defaults(this);
  }

  AnalysisAnalyticsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _periodDays = $v.periodDays;
      _start = $v.start;
      _end = $v.end;
      _summary = $v.summary.toBuilder();
      _daily = $v.daily.toBuilder();
      _inputs = $v.inputs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnalysisAnalyticsResponse other) {
    _$v = other as _$AnalysisAnalyticsResponse;
  }

  @override
  void update(void Function(AnalysisAnalyticsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnalysisAnalyticsResponse build() => _build();

  _$AnalysisAnalyticsResponse _build() {
    _$AnalysisAnalyticsResponse _$result;
    try {
      _$result = _$v ??
          _$AnalysisAnalyticsResponse._(
            periodDays: BuiltValueNullFieldError.checkNotNull(
                periodDays, r'AnalysisAnalyticsResponse', 'periodDays'),
            start: BuiltValueNullFieldError.checkNotNull(
                start, r'AnalysisAnalyticsResponse', 'start'),
            end: BuiltValueNullFieldError.checkNotNull(
                end, r'AnalysisAnalyticsResponse', 'end'),
            summary: summary.build(),
            daily: daily.build(),
            inputs: inputs.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'summary';
        summary.build();
        _$failedField = 'daily';
        daily.build();
        _$failedField = 'inputs';
        inputs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AnalysisAnalyticsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
