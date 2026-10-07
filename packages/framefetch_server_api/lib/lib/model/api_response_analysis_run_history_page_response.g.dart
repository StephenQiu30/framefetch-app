// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_analysis_run_history_page_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseAnalysisRunHistoryPageResponse
    extends ApiResponseAnalysisRunHistoryPageResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final AnalysisRunHistoryPageResponse data;

  factory _$ApiResponseAnalysisRunHistoryPageResponse(
          [void Function(ApiResponseAnalysisRunHistoryPageResponseBuilder)?
              updates]) =>
      (ApiResponseAnalysisRunHistoryPageResponseBuilder()..update(updates))
          ._build();

  _$ApiResponseAnalysisRunHistoryPageResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseAnalysisRunHistoryPageResponse rebuild(
          void Function(ApiResponseAnalysisRunHistoryPageResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseAnalysisRunHistoryPageResponseBuilder toBuilder() =>
      ApiResponseAnalysisRunHistoryPageResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseAnalysisRunHistoryPageResponse &&
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
    return (newBuiltValueToStringHelper(
            r'ApiResponseAnalysisRunHistoryPageResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseAnalysisRunHistoryPageResponseBuilder
    implements
        Builder<ApiResponseAnalysisRunHistoryPageResponse,
            ApiResponseAnalysisRunHistoryPageResponseBuilder> {
  _$ApiResponseAnalysisRunHistoryPageResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AnalysisRunHistoryPageResponseBuilder? _data;
  AnalysisRunHistoryPageResponseBuilder get data =>
      _$this._data ??= AnalysisRunHistoryPageResponseBuilder();
  set data(AnalysisRunHistoryPageResponseBuilder? data) => _$this._data = data;

  ApiResponseAnalysisRunHistoryPageResponseBuilder() {
    ApiResponseAnalysisRunHistoryPageResponse._defaults(this);
  }

  ApiResponseAnalysisRunHistoryPageResponseBuilder get _$this {
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
  void replace(ApiResponseAnalysisRunHistoryPageResponse other) {
    _$v = other as _$ApiResponseAnalysisRunHistoryPageResponse;
  }

  @override
  void update(
      void Function(ApiResponseAnalysisRunHistoryPageResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseAnalysisRunHistoryPageResponse build() => _build();

  _$ApiResponseAnalysisRunHistoryPageResponse _build() {
    _$ApiResponseAnalysisRunHistoryPageResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseAnalysisRunHistoryPageResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseAnalysisRunHistoryPageResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(message,
                r'ApiResponseAnalysisRunHistoryPageResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseAnalysisRunHistoryPageResponse',
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
