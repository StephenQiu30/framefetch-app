// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_citation.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ContentCitation extends ContentCitation {
  @override
  final String blockId;
  @override
  final String materialId;
  @override
  final String segmentId;
  @override
  final String quote;

  factory _$ContentCitation([void Function(ContentCitationBuilder)? updates]) =>
      (ContentCitationBuilder()..update(updates))._build();

  _$ContentCitation._(
      {required this.blockId,
      required this.materialId,
      required this.segmentId,
      required this.quote})
      : super._();
  @override
  ContentCitation rebuild(void Function(ContentCitationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContentCitationBuilder toBuilder() => ContentCitationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContentCitation &&
        blockId == other.blockId &&
        materialId == other.materialId &&
        segmentId == other.segmentId &&
        quote == other.quote;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, blockId.hashCode);
    _$hash = $jc(_$hash, materialId.hashCode);
    _$hash = $jc(_$hash, segmentId.hashCode);
    _$hash = $jc(_$hash, quote.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ContentCitation')
          ..add('blockId', blockId)
          ..add('materialId', materialId)
          ..add('segmentId', segmentId)
          ..add('quote', quote))
        .toString();
  }
}

class ContentCitationBuilder
    implements Builder<ContentCitation, ContentCitationBuilder> {
  _$ContentCitation? _$v;

  String? _blockId;
  String? get blockId => _$this._blockId;
  set blockId(String? blockId) => _$this._blockId = blockId;

  String? _materialId;
  String? get materialId => _$this._materialId;
  set materialId(String? materialId) => _$this._materialId = materialId;

  String? _segmentId;
  String? get segmentId => _$this._segmentId;
  set segmentId(String? segmentId) => _$this._segmentId = segmentId;

  String? _quote;
  String? get quote => _$this._quote;
  set quote(String? quote) => _$this._quote = quote;

  ContentCitationBuilder() {
    ContentCitation._defaults(this);
  }

  ContentCitationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _blockId = $v.blockId;
      _materialId = $v.materialId;
      _segmentId = $v.segmentId;
      _quote = $v.quote;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContentCitation other) {
    _$v = other as _$ContentCitation;
  }

  @override
  void update(void Function(ContentCitationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ContentCitation build() => _build();

  _$ContentCitation _build() {
    final _$result = _$v ??
        _$ContentCitation._(
          blockId: BuiltValueNullFieldError.checkNotNull(
              blockId, r'ContentCitation', 'blockId'),
          materialId: BuiltValueNullFieldError.checkNotNull(
              materialId, r'ContentCitation', 'materialId'),
          segmentId: BuiltValueNullFieldError.checkNotNull(
              segmentId, r'ContentCitation', 'segmentId'),
          quote: BuiltValueNullFieldError.checkNotNull(
              quote, r'ContentCitation', 'quote'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
