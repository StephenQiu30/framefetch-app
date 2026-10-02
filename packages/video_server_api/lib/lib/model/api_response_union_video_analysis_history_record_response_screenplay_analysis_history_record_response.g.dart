// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_union_video_analysis_history_record_response_screenplay_analysis_history_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponse
    extends ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final Data data;

  factory _$ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponse(
          [void Function(
                  ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponseBuilder)?
              updates]) =>
      (ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponseBuilder()
            ..update(updates))
          ._build();

  _$ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponse
      rebuild(
              void Function(
                      ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponseBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponseBuilder
      toBuilder() =>
          ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponseBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponse &&
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
            r'ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponseBuilder
    implements
        Builder<
            ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponse,
            ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponseBuilder> {
  _$ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponse?
      _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  DataBuilder? _data;
  DataBuilder get data => _$this._data ??= DataBuilder();
  set data(DataBuilder? data) => _$this._data = data;

  ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponseBuilder() {
    ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponse
        ._defaults(this);
  }

  ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponseBuilder
      get _$this {
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
  void replace(
      ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponse
          other) {
    _$v = other
        as _$ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponse;
  }

  @override
  void update(
      void Function(
              ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponse
      build() => _build();

  _$ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponse
      _build() {
    _$ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponse
        _$result;
    try {
      _$result = _$v ??
          _$ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponse
              ._(
            code: BuiltValueNullFieldError.checkNotNull(
                code,
                r'ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponse',
                'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message,
                r'ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponse',
                'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseUnionVideoAnalysisHistoryRecordResponseScreenplayAnalysisHistoryRecordResponse',
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
