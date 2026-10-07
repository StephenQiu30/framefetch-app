// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evidence_value.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EvidenceValue extends EvidenceValue {
  @override
  final OneOf oneOf;

  factory _$EvidenceValue([void Function(EvidenceValueBuilder)? updates]) =>
      (EvidenceValueBuilder()..update(updates))._build();

  _$EvidenceValue._({required this.oneOf}) : super._();
  @override
  EvidenceValue rebuild(void Function(EvidenceValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EvidenceValueBuilder toBuilder() => EvidenceValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EvidenceValue && oneOf == other.oneOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, oneOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EvidenceValue')..add('oneOf', oneOf))
        .toString();
  }
}

class EvidenceValueBuilder
    implements Builder<EvidenceValue, EvidenceValueBuilder> {
  _$EvidenceValue? _$v;

  OneOf? _oneOf;
  OneOf? get oneOf => _$this._oneOf;
  set oneOf(OneOf? oneOf) => _$this._oneOf = oneOf;

  EvidenceValueBuilder() {
    EvidenceValue._defaults(this);
  }

  EvidenceValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _oneOf = $v.oneOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EvidenceValue other) {
    _$v = other as _$EvidenceValue;
  }

  @override
  void update(void Function(EvidenceValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EvidenceValue build() => _build();

  _$EvidenceValue _build() {
    final _$result = _$v ??
        _$EvidenceValue._(
          oneOf: BuiltValueNullFieldError.checkNotNull(
              oneOf, r'EvidenceValue', 'oneOf'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
