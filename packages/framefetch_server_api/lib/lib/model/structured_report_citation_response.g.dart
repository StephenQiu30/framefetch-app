// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structured_report_citation_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StructuredReportCitationResponse
    extends StructuredReportCitationResponse {
  @override
  final String sourceSha256;
  @override
  final int start;
  @override
  final int end;
  @override
  final String quote;

  factory _$StructuredReportCitationResponse(
          [void Function(StructuredReportCitationResponseBuilder)? updates]) =>
      (StructuredReportCitationResponseBuilder()..update(updates))._build();

  _$StructuredReportCitationResponse._(
      {required this.sourceSha256,
      required this.start,
      required this.end,
      required this.quote})
      : super._();
  @override
  StructuredReportCitationResponse rebuild(
          void Function(StructuredReportCitationResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StructuredReportCitationResponseBuilder toBuilder() =>
      StructuredReportCitationResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StructuredReportCitationResponse &&
        sourceSha256 == other.sourceSha256 &&
        start == other.start &&
        end == other.end &&
        quote == other.quote;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, sourceSha256.hashCode);
    _$hash = $jc(_$hash, start.hashCode);
    _$hash = $jc(_$hash, end.hashCode);
    _$hash = $jc(_$hash, quote.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StructuredReportCitationResponse')
          ..add('sourceSha256', sourceSha256)
          ..add('start', start)
          ..add('end', end)
          ..add('quote', quote))
        .toString();
  }
}

class StructuredReportCitationResponseBuilder
    implements
        Builder<StructuredReportCitationResponse,
            StructuredReportCitationResponseBuilder> {
  _$StructuredReportCitationResponse? _$v;

  String? _sourceSha256;
  String? get sourceSha256 => _$this._sourceSha256;
  set sourceSha256(String? sourceSha256) => _$this._sourceSha256 = sourceSha256;

  int? _start;
  int? get start => _$this._start;
  set start(int? start) => _$this._start = start;

  int? _end;
  int? get end => _$this._end;
  set end(int? end) => _$this._end = end;

  String? _quote;
  String? get quote => _$this._quote;
  set quote(String? quote) => _$this._quote = quote;

  StructuredReportCitationResponseBuilder() {
    StructuredReportCitationResponse._defaults(this);
  }

  StructuredReportCitationResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sourceSha256 = $v.sourceSha256;
      _start = $v.start;
      _end = $v.end;
      _quote = $v.quote;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StructuredReportCitationResponse other) {
    _$v = other as _$StructuredReportCitationResponse;
  }

  @override
  void update(void Function(StructuredReportCitationResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StructuredReportCitationResponse build() => _build();

  _$StructuredReportCitationResponse _build() {
    final _$result = _$v ??
        _$StructuredReportCitationResponse._(
          sourceSha256: BuiltValueNullFieldError.checkNotNull(sourceSha256,
              r'StructuredReportCitationResponse', 'sourceSha256'),
          start: BuiltValueNullFieldError.checkNotNull(
              start, r'StructuredReportCitationResponse', 'start'),
          end: BuiltValueNullFieldError.checkNotNull(
              end, r'StructuredReportCitationResponse', 'end'),
          quote: BuiltValueNullFieldError.checkNotNull(
              quote, r'StructuredReportCitationResponse', 'quote'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
