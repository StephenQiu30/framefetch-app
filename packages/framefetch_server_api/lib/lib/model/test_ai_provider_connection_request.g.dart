// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_ai_provider_connection_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TestAiProviderConnectionRequest
    extends TestAiProviderConnectionRequest {
  @override
  final String? providerKey;
  @override
  final AiProviderEngine? engine;
  @override
  final AiProviderAuthMode? authMode;
  @override
  final String? baseUrl;
  @override
  final String? model;
  @override
  final String? apiKey;

  factory _$TestAiProviderConnectionRequest(
          [void Function(TestAiProviderConnectionRequestBuilder)? updates]) =>
      (TestAiProviderConnectionRequestBuilder()..update(updates))._build();

  _$TestAiProviderConnectionRequest._(
      {this.providerKey,
      this.engine,
      this.authMode,
      this.baseUrl,
      this.model,
      this.apiKey})
      : super._();
  @override
  TestAiProviderConnectionRequest rebuild(
          void Function(TestAiProviderConnectionRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TestAiProviderConnectionRequestBuilder toBuilder() =>
      TestAiProviderConnectionRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TestAiProviderConnectionRequest &&
        providerKey == other.providerKey &&
        engine == other.engine &&
        authMode == other.authMode &&
        baseUrl == other.baseUrl &&
        model == other.model &&
        apiKey == other.apiKey;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, providerKey.hashCode);
    _$hash = $jc(_$hash, engine.hashCode);
    _$hash = $jc(_$hash, authMode.hashCode);
    _$hash = $jc(_$hash, baseUrl.hashCode);
    _$hash = $jc(_$hash, model.hashCode);
    _$hash = $jc(_$hash, apiKey.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TestAiProviderConnectionRequest')
          ..add('providerKey', providerKey)
          ..add('engine', engine)
          ..add('authMode', authMode)
          ..add('baseUrl', baseUrl)
          ..add('model', model)
          ..add('apiKey', apiKey))
        .toString();
  }
}

class TestAiProviderConnectionRequestBuilder
    implements
        Builder<TestAiProviderConnectionRequest,
            TestAiProviderConnectionRequestBuilder> {
  _$TestAiProviderConnectionRequest? _$v;

  String? _providerKey;
  String? get providerKey => _$this._providerKey;
  set providerKey(String? providerKey) => _$this._providerKey = providerKey;

  AiProviderEngine? _engine;
  AiProviderEngine? get engine => _$this._engine;
  set engine(AiProviderEngine? engine) => _$this._engine = engine;

  AiProviderAuthMode? _authMode;
  AiProviderAuthMode? get authMode => _$this._authMode;
  set authMode(AiProviderAuthMode? authMode) => _$this._authMode = authMode;

  String? _baseUrl;
  String? get baseUrl => _$this._baseUrl;
  set baseUrl(String? baseUrl) => _$this._baseUrl = baseUrl;

  String? _model;
  String? get model => _$this._model;
  set model(String? model) => _$this._model = model;

  String? _apiKey;
  String? get apiKey => _$this._apiKey;
  set apiKey(String? apiKey) => _$this._apiKey = apiKey;

  TestAiProviderConnectionRequestBuilder() {
    TestAiProviderConnectionRequest._defaults(this);
  }

  TestAiProviderConnectionRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _providerKey = $v.providerKey;
      _engine = $v.engine;
      _authMode = $v.authMode;
      _baseUrl = $v.baseUrl;
      _model = $v.model;
      _apiKey = $v.apiKey;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TestAiProviderConnectionRequest other) {
    _$v = other as _$TestAiProviderConnectionRequest;
  }

  @override
  void update(void Function(TestAiProviderConnectionRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TestAiProviderConnectionRequest build() => _build();

  _$TestAiProviderConnectionRequest _build() {
    final _$result = _$v ??
        _$TestAiProviderConnectionRequest._(
          providerKey: providerKey,
          engine: engine,
          authMode: authMode,
          baseUrl: baseUrl,
          model: model,
          apiKey: apiKey,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
