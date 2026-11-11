// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_ai_provider_connection_test_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseAiProviderConnectionTestResponse
    extends ApiResponseAiProviderConnectionTestResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final AiProviderConnectionTestResponse data;

  factory _$ApiResponseAiProviderConnectionTestResponse(
          [void Function(ApiResponseAiProviderConnectionTestResponseBuilder)?
              updates]) =>
      (ApiResponseAiProviderConnectionTestResponseBuilder()..update(updates))
          ._build();

  _$ApiResponseAiProviderConnectionTestResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseAiProviderConnectionTestResponse rebuild(
          void Function(ApiResponseAiProviderConnectionTestResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseAiProviderConnectionTestResponseBuilder toBuilder() =>
      ApiResponseAiProviderConnectionTestResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseAiProviderConnectionTestResponse &&
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
            r'ApiResponseAiProviderConnectionTestResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseAiProviderConnectionTestResponseBuilder
    implements
        Builder<ApiResponseAiProviderConnectionTestResponse,
            ApiResponseAiProviderConnectionTestResponseBuilder> {
  _$ApiResponseAiProviderConnectionTestResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AiProviderConnectionTestResponseBuilder? _data;
  AiProviderConnectionTestResponseBuilder get data =>
      _$this._data ??= AiProviderConnectionTestResponseBuilder();
  set data(AiProviderConnectionTestResponseBuilder? data) =>
      _$this._data = data;

  ApiResponseAiProviderConnectionTestResponseBuilder() {
    ApiResponseAiProviderConnectionTestResponse._defaults(this);
  }

  ApiResponseAiProviderConnectionTestResponseBuilder get _$this {
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
  void replace(ApiResponseAiProviderConnectionTestResponse other) {
    _$v = other as _$ApiResponseAiProviderConnectionTestResponse;
  }

  @override
  void update(
      void Function(ApiResponseAiProviderConnectionTestResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseAiProviderConnectionTestResponse build() => _build();

  _$ApiResponseAiProviderConnectionTestResponse _build() {
    _$ApiResponseAiProviderConnectionTestResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseAiProviderConnectionTestResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseAiProviderConnectionTestResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(message,
                r'ApiResponseAiProviderConnectionTestResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseAiProviderConnectionTestResponse',
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
