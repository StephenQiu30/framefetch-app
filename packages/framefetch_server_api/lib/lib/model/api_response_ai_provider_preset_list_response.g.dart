// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_ai_provider_preset_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseAiProviderPresetListResponse
    extends ApiResponseAiProviderPresetListResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final AiProviderPresetListResponse data;

  factory _$ApiResponseAiProviderPresetListResponse(
          [void Function(ApiResponseAiProviderPresetListResponseBuilder)?
              updates]) =>
      (ApiResponseAiProviderPresetListResponseBuilder()..update(updates))
          ._build();

  _$ApiResponseAiProviderPresetListResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseAiProviderPresetListResponse rebuild(
          void Function(ApiResponseAiProviderPresetListResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseAiProviderPresetListResponseBuilder toBuilder() =>
      ApiResponseAiProviderPresetListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseAiProviderPresetListResponse &&
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
            r'ApiResponseAiProviderPresetListResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseAiProviderPresetListResponseBuilder
    implements
        Builder<ApiResponseAiProviderPresetListResponse,
            ApiResponseAiProviderPresetListResponseBuilder> {
  _$ApiResponseAiProviderPresetListResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AiProviderPresetListResponseBuilder? _data;
  AiProviderPresetListResponseBuilder get data =>
      _$this._data ??= AiProviderPresetListResponseBuilder();
  set data(AiProviderPresetListResponseBuilder? data) => _$this._data = data;

  ApiResponseAiProviderPresetListResponseBuilder() {
    ApiResponseAiProviderPresetListResponse._defaults(this);
  }

  ApiResponseAiProviderPresetListResponseBuilder get _$this {
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
  void replace(ApiResponseAiProviderPresetListResponse other) {
    _$v = other as _$ApiResponseAiProviderPresetListResponse;
  }

  @override
  void update(
      void Function(ApiResponseAiProviderPresetListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseAiProviderPresetListResponse build() => _build();

  _$ApiResponseAiProviderPresetListResponse _build() {
    _$ApiResponseAiProviderPresetListResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseAiProviderPresetListResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseAiProviderPresetListResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseAiProviderPresetListResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseAiProviderPresetListResponse',
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
