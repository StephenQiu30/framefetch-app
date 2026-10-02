// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_engine_catalog_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseEngineCatalogResponse
    extends ApiResponseEngineCatalogResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final EngineCatalogResponse data;

  factory _$ApiResponseEngineCatalogResponse(
          [void Function(ApiResponseEngineCatalogResponseBuilder)? updates]) =>
      (ApiResponseEngineCatalogResponseBuilder()..update(updates))._build();

  _$ApiResponseEngineCatalogResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseEngineCatalogResponse rebuild(
          void Function(ApiResponseEngineCatalogResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseEngineCatalogResponseBuilder toBuilder() =>
      ApiResponseEngineCatalogResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseEngineCatalogResponse &&
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
    return (newBuiltValueToStringHelper(r'ApiResponseEngineCatalogResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseEngineCatalogResponseBuilder
    implements
        Builder<ApiResponseEngineCatalogResponse,
            ApiResponseEngineCatalogResponseBuilder> {
  _$ApiResponseEngineCatalogResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  EngineCatalogResponseBuilder? _data;
  EngineCatalogResponseBuilder get data =>
      _$this._data ??= EngineCatalogResponseBuilder();
  set data(EngineCatalogResponseBuilder? data) => _$this._data = data;

  ApiResponseEngineCatalogResponseBuilder() {
    ApiResponseEngineCatalogResponse._defaults(this);
  }

  ApiResponseEngineCatalogResponseBuilder get _$this {
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
  void replace(ApiResponseEngineCatalogResponse other) {
    _$v = other as _$ApiResponseEngineCatalogResponse;
  }

  @override
  void update(void Function(ApiResponseEngineCatalogResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseEngineCatalogResponse build() => _build();

  _$ApiResponseEngineCatalogResponse _build() {
    _$ApiResponseEngineCatalogResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseEngineCatalogResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseEngineCatalogResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseEngineCatalogResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseEngineCatalogResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
