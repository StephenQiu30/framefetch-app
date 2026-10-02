// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_operation_log_page_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseOperationLogPageResponse
    extends ApiResponseOperationLogPageResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final OperationLogPageResponse data;

  factory _$ApiResponseOperationLogPageResponse(
          [void Function(ApiResponseOperationLogPageResponseBuilder)?
              updates]) =>
      (ApiResponseOperationLogPageResponseBuilder()..update(updates))._build();

  _$ApiResponseOperationLogPageResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseOperationLogPageResponse rebuild(
          void Function(ApiResponseOperationLogPageResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseOperationLogPageResponseBuilder toBuilder() =>
      ApiResponseOperationLogPageResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseOperationLogPageResponse &&
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
    return (newBuiltValueToStringHelper(r'ApiResponseOperationLogPageResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseOperationLogPageResponseBuilder
    implements
        Builder<ApiResponseOperationLogPageResponse,
            ApiResponseOperationLogPageResponseBuilder> {
  _$ApiResponseOperationLogPageResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  OperationLogPageResponseBuilder? _data;
  OperationLogPageResponseBuilder get data =>
      _$this._data ??= OperationLogPageResponseBuilder();
  set data(OperationLogPageResponseBuilder? data) => _$this._data = data;

  ApiResponseOperationLogPageResponseBuilder() {
    ApiResponseOperationLogPageResponse._defaults(this);
  }

  ApiResponseOperationLogPageResponseBuilder get _$this {
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
  void replace(ApiResponseOperationLogPageResponse other) {
    _$v = other as _$ApiResponseOperationLogPageResponse;
  }

  @override
  void update(
      void Function(ApiResponseOperationLogPageResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseOperationLogPageResponse build() => _build();

  _$ApiResponseOperationLogPageResponse _build() {
    _$ApiResponseOperationLogPageResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseOperationLogPageResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseOperationLogPageResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseOperationLogPageResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ApiResponseOperationLogPageResponse',
            _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
