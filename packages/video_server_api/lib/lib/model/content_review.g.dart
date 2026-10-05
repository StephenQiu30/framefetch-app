// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_review.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ContentReview extends ContentReview {
  @override
  final bool needsMaterial;
  @override
  final BuiltList<ContentFinding> findings;

  factory _$ContentReview([void Function(ContentReviewBuilder)? updates]) =>
      (ContentReviewBuilder()..update(updates))._build();

  _$ContentReview._({required this.needsMaterial, required this.findings})
      : super._();
  @override
  ContentReview rebuild(void Function(ContentReviewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContentReviewBuilder toBuilder() => ContentReviewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContentReview &&
        needsMaterial == other.needsMaterial &&
        findings == other.findings;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, needsMaterial.hashCode);
    _$hash = $jc(_$hash, findings.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ContentReview')
          ..add('needsMaterial', needsMaterial)
          ..add('findings', findings))
        .toString();
  }
}

class ContentReviewBuilder
    implements Builder<ContentReview, ContentReviewBuilder> {
  _$ContentReview? _$v;

  bool? _needsMaterial;
  bool? get needsMaterial => _$this._needsMaterial;
  set needsMaterial(bool? needsMaterial) =>
      _$this._needsMaterial = needsMaterial;

  ListBuilder<ContentFinding>? _findings;
  ListBuilder<ContentFinding> get findings =>
      _$this._findings ??= ListBuilder<ContentFinding>();
  set findings(ListBuilder<ContentFinding>? findings) =>
      _$this._findings = findings;

  ContentReviewBuilder() {
    ContentReview._defaults(this);
  }

  ContentReviewBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _needsMaterial = $v.needsMaterial;
      _findings = $v.findings.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContentReview other) {
    _$v = other as _$ContentReview;
  }

  @override
  void update(void Function(ContentReviewBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ContentReview build() => _build();

  _$ContentReview _build() {
    _$ContentReview _$result;
    try {
      _$result = _$v ??
          _$ContentReview._(
            needsMaterial: BuiltValueNullFieldError.checkNotNull(
                needsMaterial, r'ContentReview', 'needsMaterial'),
            findings: findings.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'findings';
        findings.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ContentReview', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
