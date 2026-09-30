// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structured_report_section_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StructuredReportSectionResponse
    extends StructuredReportSectionResponse {
  @override
  final String id;
  @override
  final String heading;
  @override
  final String body;
  @override
  final BuiltList<String> items;
  @override
  final BuiltList<VideoArticleEvidenceResponse> evidence;

  factory _$StructuredReportSectionResponse(
          [void Function(StructuredReportSectionResponseBuilder)? updates]) =>
      (StructuredReportSectionResponseBuilder()..update(updates))._build();

  _$StructuredReportSectionResponse._(
      {required this.id,
      required this.heading,
      required this.body,
      required this.items,
      required this.evidence})
      : super._();
  @override
  StructuredReportSectionResponse rebuild(
          void Function(StructuredReportSectionResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StructuredReportSectionResponseBuilder toBuilder() =>
      StructuredReportSectionResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StructuredReportSectionResponse &&
        id == other.id &&
        heading == other.heading &&
        body == other.body &&
        items == other.items &&
        evidence == other.evidence;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, heading.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, evidence.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StructuredReportSectionResponse')
          ..add('id', id)
          ..add('heading', heading)
          ..add('body', body)
          ..add('items', items)
          ..add('evidence', evidence))
        .toString();
  }
}

class StructuredReportSectionResponseBuilder
    implements
        Builder<StructuredReportSectionResponse,
            StructuredReportSectionResponseBuilder> {
  _$StructuredReportSectionResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _heading;
  String? get heading => _$this._heading;
  set heading(String? heading) => _$this._heading = heading;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  ListBuilder<String>? _items;
  ListBuilder<String> get items => _$this._items ??= ListBuilder<String>();
  set items(ListBuilder<String>? items) => _$this._items = items;

  ListBuilder<VideoArticleEvidenceResponse>? _evidence;
  ListBuilder<VideoArticleEvidenceResponse> get evidence =>
      _$this._evidence ??= ListBuilder<VideoArticleEvidenceResponse>();
  set evidence(ListBuilder<VideoArticleEvidenceResponse>? evidence) =>
      _$this._evidence = evidence;

  StructuredReportSectionResponseBuilder() {
    StructuredReportSectionResponse._defaults(this);
  }

  StructuredReportSectionResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _heading = $v.heading;
      _body = $v.body;
      _items = $v.items.toBuilder();
      _evidence = $v.evidence.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StructuredReportSectionResponse other) {
    _$v = other as _$StructuredReportSectionResponse;
  }

  @override
  void update(void Function(StructuredReportSectionResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StructuredReportSectionResponse build() => _build();

  _$StructuredReportSectionResponse _build() {
    _$StructuredReportSectionResponse _$result;
    try {
      _$result = _$v ??
          _$StructuredReportSectionResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'StructuredReportSectionResponse', 'id'),
            heading: BuiltValueNullFieldError.checkNotNull(
                heading, r'StructuredReportSectionResponse', 'heading'),
            body: BuiltValueNullFieldError.checkNotNull(
                body, r'StructuredReportSectionResponse', 'body'),
            items: items.build(),
            evidence: evidence.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
        _$failedField = 'evidence';
        evidence.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'StructuredReportSectionResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
