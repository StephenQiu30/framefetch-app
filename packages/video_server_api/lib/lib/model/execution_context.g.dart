// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'execution_context.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ExecutionContext extends ExecutionContext {
  @override
  final String providerKey;
  @override
  final String registryRevision;
  @override
  final String resolvedLayer;
  @override
  final String client;
  @override
  final String engineRevision;
  @override
  final String egressRoute;
  @override
  final String egressRevision;
  @override
  final String egressClass;
  @override
  final String? egressObservedIp;
  @override
  final bool identityUsed;
  @override
  final String? identityDigest;
  @override
  final String browserContextKind;

  factory _$ExecutionContext(
          [void Function(ExecutionContextBuilder)? updates]) =>
      (ExecutionContextBuilder()..update(updates))._build();

  _$ExecutionContext._(
      {required this.providerKey,
      required this.registryRevision,
      required this.resolvedLayer,
      required this.client,
      required this.engineRevision,
      required this.egressRoute,
      required this.egressRevision,
      required this.egressClass,
      this.egressObservedIp,
      required this.identityUsed,
      this.identityDigest,
      required this.browserContextKind})
      : super._();
  @override
  ExecutionContext rebuild(void Function(ExecutionContextBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExecutionContextBuilder toBuilder() =>
      ExecutionContextBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExecutionContext &&
        providerKey == other.providerKey &&
        registryRevision == other.registryRevision &&
        resolvedLayer == other.resolvedLayer &&
        client == other.client &&
        engineRevision == other.engineRevision &&
        egressRoute == other.egressRoute &&
        egressRevision == other.egressRevision &&
        egressClass == other.egressClass &&
        egressObservedIp == other.egressObservedIp &&
        identityUsed == other.identityUsed &&
        identityDigest == other.identityDigest &&
        browserContextKind == other.browserContextKind;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, providerKey.hashCode);
    _$hash = $jc(_$hash, registryRevision.hashCode);
    _$hash = $jc(_$hash, resolvedLayer.hashCode);
    _$hash = $jc(_$hash, client.hashCode);
    _$hash = $jc(_$hash, engineRevision.hashCode);
    _$hash = $jc(_$hash, egressRoute.hashCode);
    _$hash = $jc(_$hash, egressRevision.hashCode);
    _$hash = $jc(_$hash, egressClass.hashCode);
    _$hash = $jc(_$hash, egressObservedIp.hashCode);
    _$hash = $jc(_$hash, identityUsed.hashCode);
    _$hash = $jc(_$hash, identityDigest.hashCode);
    _$hash = $jc(_$hash, browserContextKind.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExecutionContext')
          ..add('providerKey', providerKey)
          ..add('registryRevision', registryRevision)
          ..add('resolvedLayer', resolvedLayer)
          ..add('client', client)
          ..add('engineRevision', engineRevision)
          ..add('egressRoute', egressRoute)
          ..add('egressRevision', egressRevision)
          ..add('egressClass', egressClass)
          ..add('egressObservedIp', egressObservedIp)
          ..add('identityUsed', identityUsed)
          ..add('identityDigest', identityDigest)
          ..add('browserContextKind', browserContextKind))
        .toString();
  }
}

class ExecutionContextBuilder
    implements Builder<ExecutionContext, ExecutionContextBuilder> {
  _$ExecutionContext? _$v;

  String? _providerKey;
  String? get providerKey => _$this._providerKey;
  set providerKey(String? providerKey) => _$this._providerKey = providerKey;

  String? _registryRevision;
  String? get registryRevision => _$this._registryRevision;
  set registryRevision(String? registryRevision) =>
      _$this._registryRevision = registryRevision;

  String? _resolvedLayer;
  String? get resolvedLayer => _$this._resolvedLayer;
  set resolvedLayer(String? resolvedLayer) =>
      _$this._resolvedLayer = resolvedLayer;

  String? _client;
  String? get client => _$this._client;
  set client(String? client) => _$this._client = client;

  String? _engineRevision;
  String? get engineRevision => _$this._engineRevision;
  set engineRevision(String? engineRevision) =>
      _$this._engineRevision = engineRevision;

  String? _egressRoute;
  String? get egressRoute => _$this._egressRoute;
  set egressRoute(String? egressRoute) => _$this._egressRoute = egressRoute;

  String? _egressRevision;
  String? get egressRevision => _$this._egressRevision;
  set egressRevision(String? egressRevision) =>
      _$this._egressRevision = egressRevision;

  String? _egressClass;
  String? get egressClass => _$this._egressClass;
  set egressClass(String? egressClass) => _$this._egressClass = egressClass;

  String? _egressObservedIp;
  String? get egressObservedIp => _$this._egressObservedIp;
  set egressObservedIp(String? egressObservedIp) =>
      _$this._egressObservedIp = egressObservedIp;

  bool? _identityUsed;
  bool? get identityUsed => _$this._identityUsed;
  set identityUsed(bool? identityUsed) => _$this._identityUsed = identityUsed;

  String? _identityDigest;
  String? get identityDigest => _$this._identityDigest;
  set identityDigest(String? identityDigest) =>
      _$this._identityDigest = identityDigest;

  String? _browserContextKind;
  String? get browserContextKind => _$this._browserContextKind;
  set browserContextKind(String? browserContextKind) =>
      _$this._browserContextKind = browserContextKind;

  ExecutionContextBuilder() {
    ExecutionContext._defaults(this);
  }

  ExecutionContextBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _providerKey = $v.providerKey;
      _registryRevision = $v.registryRevision;
      _resolvedLayer = $v.resolvedLayer;
      _client = $v.client;
      _engineRevision = $v.engineRevision;
      _egressRoute = $v.egressRoute;
      _egressRevision = $v.egressRevision;
      _egressClass = $v.egressClass;
      _egressObservedIp = $v.egressObservedIp;
      _identityUsed = $v.identityUsed;
      _identityDigest = $v.identityDigest;
      _browserContextKind = $v.browserContextKind;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExecutionContext other) {
    _$v = other as _$ExecutionContext;
  }

  @override
  void update(void Function(ExecutionContextBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExecutionContext build() => _build();

  _$ExecutionContext _build() {
    final _$result = _$v ??
        _$ExecutionContext._(
          providerKey: BuiltValueNullFieldError.checkNotNull(
              providerKey, r'ExecutionContext', 'providerKey'),
          registryRevision: BuiltValueNullFieldError.checkNotNull(
              registryRevision, r'ExecutionContext', 'registryRevision'),
          resolvedLayer: BuiltValueNullFieldError.checkNotNull(
              resolvedLayer, r'ExecutionContext', 'resolvedLayer'),
          client: BuiltValueNullFieldError.checkNotNull(
              client, r'ExecutionContext', 'client'),
          engineRevision: BuiltValueNullFieldError.checkNotNull(
              engineRevision, r'ExecutionContext', 'engineRevision'),
          egressRoute: BuiltValueNullFieldError.checkNotNull(
              egressRoute, r'ExecutionContext', 'egressRoute'),
          egressRevision: BuiltValueNullFieldError.checkNotNull(
              egressRevision, r'ExecutionContext', 'egressRevision'),
          egressClass: BuiltValueNullFieldError.checkNotNull(
              egressClass, r'ExecutionContext', 'egressClass'),
          egressObservedIp: egressObservedIp,
          identityUsed: BuiltValueNullFieldError.checkNotNull(
              identityUsed, r'ExecutionContext', 'identityUsed'),
          identityDigest: identityDigest,
          browserContextKind: BuiltValueNullFieldError.checkNotNull(
              browserContextKind, r'ExecutionContext', 'browserContextKind'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
