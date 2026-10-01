// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_status_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProviderStatusResponse extends ProviderStatusResponse {
  @override
  final String key;
  @override
  final String displayName;
  @override
  final bool registered;
  @override
  final bool extractorExists;
  @override
  final BuiltList<ProviderCapability> capabilities;
  @override
  final ProviderIdentity identity;
  @override
  final ProviderSupportStatus status;
  @override
  final bool downloadSupported;
  @override
  final String? userAction;
  @override
  final BuiltList<String> hosts;
  @override
  final BuiltList<String> hostSuffixes;

  factory _$ProviderStatusResponse(
          [void Function(ProviderStatusResponseBuilder)? updates]) =>
      (ProviderStatusResponseBuilder()..update(updates))._build();

  _$ProviderStatusResponse._(
      {required this.key,
      required this.displayName,
      required this.registered,
      required this.extractorExists,
      required this.capabilities,
      required this.identity,
      required this.status,
      required this.downloadSupported,
      this.userAction,
      required this.hosts,
      required this.hostSuffixes})
      : super._();
  @override
  ProviderStatusResponse rebuild(
          void Function(ProviderStatusResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProviderStatusResponseBuilder toBuilder() =>
      ProviderStatusResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProviderStatusResponse &&
        key == other.key &&
        displayName == other.displayName &&
        registered == other.registered &&
        extractorExists == other.extractorExists &&
        capabilities == other.capabilities &&
        identity == other.identity &&
        status == other.status &&
        downloadSupported == other.downloadSupported &&
        userAction == other.userAction &&
        hosts == other.hosts &&
        hostSuffixes == other.hostSuffixes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, registered.hashCode);
    _$hash = $jc(_$hash, extractorExists.hashCode);
    _$hash = $jc(_$hash, capabilities.hashCode);
    _$hash = $jc(_$hash, identity.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, downloadSupported.hashCode);
    _$hash = $jc(_$hash, userAction.hashCode);
    _$hash = $jc(_$hash, hosts.hashCode);
    _$hash = $jc(_$hash, hostSuffixes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProviderStatusResponse')
          ..add('key', key)
          ..add('displayName', displayName)
          ..add('registered', registered)
          ..add('extractorExists', extractorExists)
          ..add('capabilities', capabilities)
          ..add('identity', identity)
          ..add('status', status)
          ..add('downloadSupported', downloadSupported)
          ..add('userAction', userAction)
          ..add('hosts', hosts)
          ..add('hostSuffixes', hostSuffixes))
        .toString();
  }
}

class ProviderStatusResponseBuilder
    implements Builder<ProviderStatusResponse, ProviderStatusResponseBuilder> {
  _$ProviderStatusResponse? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  bool? _registered;
  bool? get registered => _$this._registered;
  set registered(bool? registered) => _$this._registered = registered;

  bool? _extractorExists;
  bool? get extractorExists => _$this._extractorExists;
  set extractorExists(bool? extractorExists) =>
      _$this._extractorExists = extractorExists;

  ListBuilder<ProviderCapability>? _capabilities;
  ListBuilder<ProviderCapability> get capabilities =>
      _$this._capabilities ??= ListBuilder<ProviderCapability>();
  set capabilities(ListBuilder<ProviderCapability>? capabilities) =>
      _$this._capabilities = capabilities;

  ProviderIdentity? _identity;
  ProviderIdentity? get identity => _$this._identity;
  set identity(ProviderIdentity? identity) => _$this._identity = identity;

  ProviderSupportStatus? _status;
  ProviderSupportStatus? get status => _$this._status;
  set status(ProviderSupportStatus? status) => _$this._status = status;

  bool? _downloadSupported;
  bool? get downloadSupported => _$this._downloadSupported;
  set downloadSupported(bool? downloadSupported) =>
      _$this._downloadSupported = downloadSupported;

  String? _userAction;
  String? get userAction => _$this._userAction;
  set userAction(String? userAction) => _$this._userAction = userAction;

  ListBuilder<String>? _hosts;
  ListBuilder<String> get hosts => _$this._hosts ??= ListBuilder<String>();
  set hosts(ListBuilder<String>? hosts) => _$this._hosts = hosts;

  ListBuilder<String>? _hostSuffixes;
  ListBuilder<String> get hostSuffixes =>
      _$this._hostSuffixes ??= ListBuilder<String>();
  set hostSuffixes(ListBuilder<String>? hostSuffixes) =>
      _$this._hostSuffixes = hostSuffixes;

  ProviderStatusResponseBuilder() {
    ProviderStatusResponse._defaults(this);
  }

  ProviderStatusResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _displayName = $v.displayName;
      _registered = $v.registered;
      _extractorExists = $v.extractorExists;
      _capabilities = $v.capabilities.toBuilder();
      _identity = $v.identity;
      _status = $v.status;
      _downloadSupported = $v.downloadSupported;
      _userAction = $v.userAction;
      _hosts = $v.hosts.toBuilder();
      _hostSuffixes = $v.hostSuffixes.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProviderStatusResponse other) {
    _$v = other as _$ProviderStatusResponse;
  }

  @override
  void update(void Function(ProviderStatusResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProviderStatusResponse build() => _build();

  _$ProviderStatusResponse _build() {
    _$ProviderStatusResponse _$result;
    try {
      _$result = _$v ??
          _$ProviderStatusResponse._(
            key: BuiltValueNullFieldError.checkNotNull(
                key, r'ProviderStatusResponse', 'key'),
            displayName: BuiltValueNullFieldError.checkNotNull(
                displayName, r'ProviderStatusResponse', 'displayName'),
            registered: BuiltValueNullFieldError.checkNotNull(
                registered, r'ProviderStatusResponse', 'registered'),
            extractorExists: BuiltValueNullFieldError.checkNotNull(
                extractorExists, r'ProviderStatusResponse', 'extractorExists'),
            capabilities: capabilities.build(),
            identity: BuiltValueNullFieldError.checkNotNull(
                identity, r'ProviderStatusResponse', 'identity'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'ProviderStatusResponse', 'status'),
            downloadSupported: BuiltValueNullFieldError.checkNotNull(
                downloadSupported,
                r'ProviderStatusResponse',
                'downloadSupported'),
            userAction: userAction,
            hosts: hosts.build(),
            hostSuffixes: hostSuffixes.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'capabilities';
        capabilities.build();

        _$failedField = 'hosts';
        hosts.build();
        _$failedField = 'hostSuffixes';
        hostSuffixes.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ProviderStatusResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
