// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_history_record_page_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseHistoryRecordPageResponse
    extends ApiResponseHistoryRecordPageResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final HistoryRecordPageResponse data;

  factory _$ApiResponseHistoryRecordPageResponse(
          [void Function(ApiResponseHistoryRecordPageResponseBuilder)?
              updates]) =>
      (ApiResponseHistoryRecordPageResponseBuilder()..update(updates))._build();

  _$ApiResponseHistoryRecordPageResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseHistoryRecordPageResponse rebuild(
          void Function(ApiResponseHistoryRecordPageResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseHistoryRecordPageResponseBuilder toBuilder() =>
      ApiResponseHistoryRecordPageResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseHistoryRecordPageResponse &&
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
    return (newBuiltValueToStringHelper(r'ApiResponseHistoryRecordPageResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseHistoryRecordPageResponseBuilder
    implements
        Builder<ApiResponseHistoryRecordPageResponse,
            ApiResponseHistoryRecordPageResponseBuilder> {
  _$ApiResponseHistoryRecordPageResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  HistoryRecordPageResponseBuilder? _data;
  HistoryRecordPageResponseBuilder get data =>
      _$this._data ??= HistoryRecordPageResponseBuilder();
  set data(HistoryRecordPageResponseBuilder? data) => _$this._data = data;

  ApiResponseHistoryRecordPageResponseBuilder() {
    ApiResponseHistoryRecordPageResponse._defaults(this);
  }

  ApiResponseHistoryRecordPageResponseBuilder get _$this {
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
  void replace(ApiResponseHistoryRecordPageResponse other) {
    _$v = other as _$ApiResponseHistoryRecordPageResponse;
  }

  @override
  void update(
      void Function(ApiResponseHistoryRecordPageResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseHistoryRecordPageResponse build() => _build();

  _$ApiResponseHistoryRecordPageResponse _build() {
    _$ApiResponseHistoryRecordPageResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseHistoryRecordPageResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseHistoryRecordPageResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseHistoryRecordPageResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseHistoryRecordPageResponse',
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
