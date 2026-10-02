// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_analysis_analytics_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseAnalysisAnalyticsResponse
    extends ApiResponseAnalysisAnalyticsResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final AnalysisAnalyticsResponse data;

  factory _$ApiResponseAnalysisAnalyticsResponse(
          [void Function(ApiResponseAnalysisAnalyticsResponseBuilder)?
              updates]) =>
      (ApiResponseAnalysisAnalyticsResponseBuilder()..update(updates))._build();

  _$ApiResponseAnalysisAnalyticsResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseAnalysisAnalyticsResponse rebuild(
          void Function(ApiResponseAnalysisAnalyticsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseAnalysisAnalyticsResponseBuilder toBuilder() =>
      ApiResponseAnalysisAnalyticsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseAnalysisAnalyticsResponse &&
        code == other.code &&
        message == other.message &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiResponseAnalysisAnalyticsResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseAnalysisAnalyticsResponseBuilder
    implements
        Builder<ApiResponseAnalysisAnalyticsResponse,
            ApiResponseAnalysisAnalyticsResponseBuilder> {
  _$ApiResponseAnalysisAnalyticsResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AnalysisAnalyticsResponseBuilder? _data;
  AnalysisAnalyticsResponseBuilder get data =>
      _$this._data ??= AnalysisAnalyticsResponseBuilder();
  set data(AnalysisAnalyticsResponseBuilder? data) => _$this._data = data;

  ApiResponseAnalysisAnalyticsResponseBuilder() {
    ApiResponseAnalysisAnalyticsResponse._defaults(this);
  }

  ApiResponseAnalysisAnalyticsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiResponseAnalysisAnalyticsResponse other) {
    _$v = other as _$ApiResponseAnalysisAnalyticsResponse;
  }

  @override
  void update(
      void Function(ApiResponseAnalysisAnalyticsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseAnalysisAnalyticsResponse build() => _build();

  _$ApiResponseAnalysisAnalyticsResponse _build() {
    _$ApiResponseAnalysisAnalyticsResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseAnalysisAnalyticsResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseAnalysisAnalyticsResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseAnalysisAnalyticsResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseAnalysisAnalyticsResponse',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
