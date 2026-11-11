// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_ai_provider_connection_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TestAiProviderConnectionRequest
    extends TestAiProviderConnectionRequest {
  @override
  final AiProviderEngine engine;
  @override
  final String? presetId;
  @override
  final String? model;
  @override
  final String? apiKey;

  factory _$TestAiProviderConnectionRequest(
          [void Function(TestAiProviderConnectionRequestBuilder)? updates]) =>
      (TestAiProviderConnectionRequestBuilder()..update(updates))._build();

  _$TestAiProviderConnectionRequest._(
      {required this.engine, this.presetId, this.model, this.apiKey})
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
        engine == other.engine &&
        presetId == other.presetId &&
        model == other.model &&
        apiKey == other.apiKey;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, engine.hashCode);
    _$hash = $jc(_$hash, presetId.hashCode);
    _$hash = $jc(_$hash, model.hashCode);
    _$hash = $jc(_$hash, apiKey.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TestAiProviderConnectionRequest')
          ..add('engine', engine)
          ..add('presetId', presetId)
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

  AiProviderEngine? _engine;
  AiProviderEngine? get engine => _$this._engine;
  set engine(AiProviderEngine? engine) => _$this._engine = engine;

  String? _presetId;
  String? get presetId => _$this._presetId;
  set presetId(String? presetId) => _$this._presetId = presetId;

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
      _engine = $v.engine;
      _presetId = $v.presetId;
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
          engine: BuiltValueNullFieldError.checkNotNull(
              engine, r'TestAiProviderConnectionRequest', 'engine'),
          presetId: presetId,
          model: model,
          apiKey: apiKey,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
