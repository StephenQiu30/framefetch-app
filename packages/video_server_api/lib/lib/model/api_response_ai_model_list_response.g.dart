// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_ai_model_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseAiModelListResponse extends ApiResponseAiModelListResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final AiModelListResponse data;

  factory _$ApiResponseAiModelListResponse(
          [void Function(ApiResponseAiModelListResponseBuilder)? updates]) =>
      (ApiResponseAiModelListResponseBuilder()..update(updates))._build();

  _$ApiResponseAiModelListResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseAiModelListResponse rebuild(
          void Function(ApiResponseAiModelListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseAiModelListResponseBuilder toBuilder() =>
      ApiResponseAiModelListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseAiModelListResponse &&
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
    return (newBuiltValueToStringHelper(r'ApiResponseAiModelListResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseAiModelListResponseBuilder
    implements
        Builder<ApiResponseAiModelListResponse,
            ApiResponseAiModelListResponseBuilder> {
  _$ApiResponseAiModelListResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AiModelListResponseBuilder? _data;
  AiModelListResponseBuilder get data =>
      _$this._data ??= AiModelListResponseBuilder();
  set data(AiModelListResponseBuilder? data) => _$this._data = data;

  ApiResponseAiModelListResponseBuilder() {
    ApiResponseAiModelListResponse._defaults(this);
  }

  ApiResponseAiModelListResponseBuilder get _$this {
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
  void replace(ApiResponseAiModelListResponse other) {
    _$v = other as _$ApiResponseAiModelListResponse;
  }

  @override
  void update(void Function(ApiResponseAiModelListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseAiModelListResponse build() => _build();

  _$ApiResponseAiModelListResponse _build() {
    _$ApiResponseAiModelListResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseAiModelListResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseAiModelListResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseAiModelListResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseAiModelListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
