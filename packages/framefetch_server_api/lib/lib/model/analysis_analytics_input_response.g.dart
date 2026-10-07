// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_analytics_input_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AnalysisAnalyticsInputResponse extends AnalysisAnalyticsInputResponse {
  @override
  final AnalysisInputKind inputKind;
  @override
  final int total;

  factory _$AnalysisAnalyticsInputResponse(
          [void Function(AnalysisAnalyticsInputResponseBuilder)? updates]) =>
      (AnalysisAnalyticsInputResponseBuilder()..update(updates))._build();

  _$AnalysisAnalyticsInputResponse._(
      {required this.inputKind, required this.total})
      : super._();
  @override
  AnalysisAnalyticsInputResponse rebuild(
          void Function(AnalysisAnalyticsInputResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnalysisAnalyticsInputResponseBuilder toBuilder() =>
      AnalysisAnalyticsInputResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnalysisAnalyticsInputResponse &&
        inputKind == other.inputKind &&
        total == other.total;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, inputKind.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnalysisAnalyticsInputResponse')
          ..add('inputKind', inputKind)
          ..add('total', total))
        .toString();
  }
}

class AnalysisAnalyticsInputResponseBuilder
    implements
        Builder<AnalysisAnalyticsInputResponse,
            AnalysisAnalyticsInputResponseBuilder> {
  _$AnalysisAnalyticsInputResponse? _$v;

  AnalysisInputKind? _inputKind;
  AnalysisInputKind? get inputKind => _$this._inputKind;
  set inputKind(AnalysisInputKind? inputKind) => _$this._inputKind = inputKind;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  AnalysisAnalyticsInputResponseBuilder() {
    AnalysisAnalyticsInputResponse._defaults(this);
  }

  AnalysisAnalyticsInputResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _inputKind = $v.inputKind;
      _total = $v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnalysisAnalyticsInputResponse other) {
    _$v = other as _$AnalysisAnalyticsInputResponse;
  }

  @override
  void update(void Function(AnalysisAnalyticsInputResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnalysisAnalyticsInputResponse build() => _build();

  _$AnalysisAnalyticsInputResponse _build() {
    final _$result = _$v ??
        _$AnalysisAnalyticsInputResponse._(
          inputKind: BuiltValueNullFieldError.checkNotNull(
              inputKind, r'AnalysisAnalyticsInputResponse', 'inputKind'),
          total: BuiltValueNullFieldError.checkNotNull(
              total, r'AnalysisAnalyticsInputResponse', 'total'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
