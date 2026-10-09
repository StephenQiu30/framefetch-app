// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intent_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$IntentRequest extends IntentRequest {
  @override
  final String? input;
  @override
  final DiscoveredItemInspectionSource? source_;

  factory _$IntentRequest([void Function(IntentRequestBuilder)? updates]) =>
      (IntentRequestBuilder()..update(updates))._build();

  _$IntentRequest._({this.input, this.source_}) : super._();
  @override
  IntentRequest rebuild(void Function(IntentRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IntentRequestBuilder toBuilder() => IntentRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IntentRequest &&
        input == other.input &&
        source_ == other.source_;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, input.hashCode);
    _$hash = $jc(_$hash, source_.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IntentRequest')
          ..add('input', input)
          ..add('source_', source_))
        .toString();
  }
}

class IntentRequestBuilder
    implements Builder<IntentRequest, IntentRequestBuilder> {
  _$IntentRequest? _$v;

  String? _input;
  String? get input => _$this._input;
  set input(String? input) => _$this._input = input;

  DiscoveredItemInspectionSourceBuilder? _source_;
  DiscoveredItemInspectionSourceBuilder get source_ =>
      _$this._source_ ??= DiscoveredItemInspectionSourceBuilder();
  set source_(DiscoveredItemInspectionSourceBuilder? source_) =>
      _$this._source_ = source_;

  IntentRequestBuilder() {
    IntentRequest._defaults(this);
  }

  IntentRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input;
      _source_ = $v.source_?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IntentRequest other) {
    _$v = other as _$IntentRequest;
  }

  @override
  void update(void Function(IntentRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IntentRequest build() => _build();

  _$IntentRequest _build() {
    _$IntentRequest _$result;
    try {
      _$result = _$v ??
          _$IntentRequest._(
            input: input,
            source_: _source_?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'source_';
        _source_?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'IntentRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
