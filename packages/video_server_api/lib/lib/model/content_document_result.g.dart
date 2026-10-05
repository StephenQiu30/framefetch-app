// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_document_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ContentDocumentResultDocumentTypeEnum
    _$contentDocumentResultDocumentTypeEnum_article =
    const ContentDocumentResultDocumentTypeEnum._('article');
const ContentDocumentResultDocumentTypeEnum
    _$contentDocumentResultDocumentTypeEnum_post =
    const ContentDocumentResultDocumentTypeEnum._('post');
const ContentDocumentResultDocumentTypeEnum
    _$contentDocumentResultDocumentTypeEnum_guide =
    const ContentDocumentResultDocumentTypeEnum._('guide');
const ContentDocumentResultDocumentTypeEnum
    _$contentDocumentResultDocumentTypeEnum_unknownDefaultOpenApi =
    const ContentDocumentResultDocumentTypeEnum._('unknownDefaultOpenApi');

ContentDocumentResultDocumentTypeEnum
    _$contentDocumentResultDocumentTypeEnumValueOf(String name) {
  switch (name) {
    case 'article':
      return _$contentDocumentResultDocumentTypeEnum_article;
    case 'post':
      return _$contentDocumentResultDocumentTypeEnum_post;
    case 'guide':
      return _$contentDocumentResultDocumentTypeEnum_guide;
    case 'unknownDefaultOpenApi':
      return _$contentDocumentResultDocumentTypeEnum_unknownDefaultOpenApi;
    default:
      return _$contentDocumentResultDocumentTypeEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<ContentDocumentResultDocumentTypeEnum>
    _$contentDocumentResultDocumentTypeEnumValues = BuiltSet<
        ContentDocumentResultDocumentTypeEnum>(const <ContentDocumentResultDocumentTypeEnum>[
  _$contentDocumentResultDocumentTypeEnum_article,
  _$contentDocumentResultDocumentTypeEnum_post,
  _$contentDocumentResultDocumentTypeEnum_guide,
  _$contentDocumentResultDocumentTypeEnum_unknownDefaultOpenApi,
]);

const ContentDocumentResultLanguageEnum
    _$contentDocumentResultLanguageEnum_zhCN =
    const ContentDocumentResultLanguageEnum._('zhCN');
const ContentDocumentResultLanguageEnum
    _$contentDocumentResultLanguageEnum_enUS =
    const ContentDocumentResultLanguageEnum._('enUS');
const ContentDocumentResultLanguageEnum
    _$contentDocumentResultLanguageEnum_unknownDefaultOpenApi =
    const ContentDocumentResultLanguageEnum._('unknownDefaultOpenApi');

ContentDocumentResultLanguageEnum _$contentDocumentResultLanguageEnumValueOf(
    String name) {
  switch (name) {
    case 'zhCN':
      return _$contentDocumentResultLanguageEnum_zhCN;
    case 'enUS':
      return _$contentDocumentResultLanguageEnum_enUS;
    case 'unknownDefaultOpenApi':
      return _$contentDocumentResultLanguageEnum_unknownDefaultOpenApi;
    default:
      return _$contentDocumentResultLanguageEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<ContentDocumentResultLanguageEnum>
    _$contentDocumentResultLanguageEnumValues = BuiltSet<
        ContentDocumentResultLanguageEnum>(const <ContentDocumentResultLanguageEnum>[
  _$contentDocumentResultLanguageEnum_zhCN,
  _$contentDocumentResultLanguageEnum_enUS,
  _$contentDocumentResultLanguageEnum_unknownDefaultOpenApi,
]);

const ContentDocumentResultKindEnum
    _$contentDocumentResultKindEnum_contentDocument =
    const ContentDocumentResultKindEnum._('contentDocument');
const ContentDocumentResultKindEnum
    _$contentDocumentResultKindEnum_unknownDefaultOpenApi =
    const ContentDocumentResultKindEnum._('unknownDefaultOpenApi');

ContentDocumentResultKindEnum _$contentDocumentResultKindEnumValueOf(
    String name) {
  switch (name) {
    case 'contentDocument':
      return _$contentDocumentResultKindEnum_contentDocument;
    case 'unknownDefaultOpenApi':
      return _$contentDocumentResultKindEnum_unknownDefaultOpenApi;
    default:
      return _$contentDocumentResultKindEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<ContentDocumentResultKindEnum>
    _$contentDocumentResultKindEnumValues = BuiltSet<
        ContentDocumentResultKindEnum>(const <ContentDocumentResultKindEnum>[
  _$contentDocumentResultKindEnum_contentDocument,
  _$contentDocumentResultKindEnum_unknownDefaultOpenApi,
]);

const ContentDocumentResultReviewStatusEnum
    _$contentDocumentResultReviewStatusEnum_passed =
    const ContentDocumentResultReviewStatusEnum._('passed');
const ContentDocumentResultReviewStatusEnum
    _$contentDocumentResultReviewStatusEnum_needsReview =
    const ContentDocumentResultReviewStatusEnum._('needsReview');
const ContentDocumentResultReviewStatusEnum
    _$contentDocumentResultReviewStatusEnum_needsMaterial =
    const ContentDocumentResultReviewStatusEnum._('needsMaterial');
const ContentDocumentResultReviewStatusEnum
    _$contentDocumentResultReviewStatusEnum_unknownDefaultOpenApi =
    const ContentDocumentResultReviewStatusEnum._('unknownDefaultOpenApi');

ContentDocumentResultReviewStatusEnum
    _$contentDocumentResultReviewStatusEnumValueOf(String name) {
  switch (name) {
    case 'passed':
      return _$contentDocumentResultReviewStatusEnum_passed;
    case 'needsReview':
      return _$contentDocumentResultReviewStatusEnum_needsReview;
    case 'needsMaterial':
      return _$contentDocumentResultReviewStatusEnum_needsMaterial;
    case 'unknownDefaultOpenApi':
      return _$contentDocumentResultReviewStatusEnum_unknownDefaultOpenApi;
    default:
      return _$contentDocumentResultReviewStatusEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<ContentDocumentResultReviewStatusEnum>
    _$contentDocumentResultReviewStatusEnumValues = BuiltSet<
        ContentDocumentResultReviewStatusEnum>(const <ContentDocumentResultReviewStatusEnum>[
  _$contentDocumentResultReviewStatusEnum_passed,
  _$contentDocumentResultReviewStatusEnum_needsReview,
  _$contentDocumentResultReviewStatusEnum_needsMaterial,
  _$contentDocumentResultReviewStatusEnum_unknownDefaultOpenApi,
]);

Serializer<ContentDocumentResultDocumentTypeEnum>
    _$contentDocumentResultDocumentTypeEnumSerializer =
    _$ContentDocumentResultDocumentTypeEnumSerializer();
Serializer<ContentDocumentResultLanguageEnum>
    _$contentDocumentResultLanguageEnumSerializer =
    _$ContentDocumentResultLanguageEnumSerializer();
Serializer<ContentDocumentResultKindEnum>
    _$contentDocumentResultKindEnumSerializer =
    _$ContentDocumentResultKindEnumSerializer();
Serializer<ContentDocumentResultReviewStatusEnum>
    _$contentDocumentResultReviewStatusEnumSerializer =
    _$ContentDocumentResultReviewStatusEnumSerializer();

class _$ContentDocumentResultDocumentTypeEnumSerializer
    implements PrimitiveSerializer<ContentDocumentResultDocumentTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'article': 'article',
    'post': 'post',
    'guide': 'guide',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'article': 'article',
    'post': 'post',
    'guide': 'guide',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[
    ContentDocumentResultDocumentTypeEnum
  ];
  @override
  final String wireName = 'ContentDocumentResultDocumentTypeEnum';

  @override
  Object serialize(
          Serializers serializers, ContentDocumentResultDocumentTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ContentDocumentResultDocumentTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ContentDocumentResultDocumentTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ContentDocumentResultLanguageEnumSerializer
    implements PrimitiveSerializer<ContentDocumentResultLanguageEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'zhCN': 'zh-CN',
    'enUS': 'en-US',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'zh-CN': 'zhCN',
    'en-US': 'enUS',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ContentDocumentResultLanguageEnum];
  @override
  final String wireName = 'ContentDocumentResultLanguageEnum';

  @override
  Object serialize(
          Serializers serializers, ContentDocumentResultLanguageEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ContentDocumentResultLanguageEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ContentDocumentResultLanguageEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ContentDocumentResultKindEnumSerializer
    implements PrimitiveSerializer<ContentDocumentResultKindEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'contentDocument': 'content_document',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'content_document': 'contentDocument',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ContentDocumentResultKindEnum];
  @override
  final String wireName = 'ContentDocumentResultKindEnum';

  @override
  Object serialize(
          Serializers serializers, ContentDocumentResultKindEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ContentDocumentResultKindEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ContentDocumentResultKindEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ContentDocumentResultReviewStatusEnumSerializer
    implements PrimitiveSerializer<ContentDocumentResultReviewStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'passed': 'passed',
    'needsReview': 'needs_review',
    'needsMaterial': 'needs_material',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'passed': 'passed',
    'needs_review': 'needsReview',
    'needs_material': 'needsMaterial',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[
    ContentDocumentResultReviewStatusEnum
  ];
  @override
  final String wireName = 'ContentDocumentResultReviewStatusEnum';

  @override
  Object serialize(
          Serializers serializers, ContentDocumentResultReviewStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ContentDocumentResultReviewStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ContentDocumentResultReviewStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ContentDocumentResult extends ContentDocumentResult {
  @override
  final ContentDocumentResultDocumentTypeEnum documentType;
  @override
  final ContentDocumentResultLanguageEnum language;
  @override
  final String? title;
  @override
  final BuiltList<BlocksInner> blocks;
  @override
  final BuiltList<ContentCitation> evidenceIndex;
  @override
  final ContentDocumentResultKindEnum kind;
  @override
  final String sourceSetRef;
  @override
  final ContentDocumentResultReviewStatusEnum reviewStatus;
  @override
  final BuiltList<ContentReview> reviewHistory;

  factory _$ContentDocumentResult(
          [void Function(ContentDocumentResultBuilder)? updates]) =>
      (ContentDocumentResultBuilder()..update(updates))._build();

  _$ContentDocumentResult._(
      {required this.documentType,
      required this.language,
      this.title,
      required this.blocks,
      required this.evidenceIndex,
      required this.kind,
      required this.sourceSetRef,
      required this.reviewStatus,
      required this.reviewHistory})
      : super._();
  @override
  ContentDocumentResult rebuild(
          void Function(ContentDocumentResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContentDocumentResultBuilder toBuilder() =>
      ContentDocumentResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContentDocumentResult &&
        documentType == other.documentType &&
        language == other.language &&
        title == other.title &&
        blocks == other.blocks &&
        evidenceIndex == other.evidenceIndex &&
        kind == other.kind &&
        sourceSetRef == other.sourceSetRef &&
        reviewStatus == other.reviewStatus &&
        reviewHistory == other.reviewHistory;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, documentType.hashCode);
    _$hash = $jc(_$hash, language.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, blocks.hashCode);
    _$hash = $jc(_$hash, evidenceIndex.hashCode);
    _$hash = $jc(_$hash, kind.hashCode);
    _$hash = $jc(_$hash, sourceSetRef.hashCode);
    _$hash = $jc(_$hash, reviewStatus.hashCode);
    _$hash = $jc(_$hash, reviewHistory.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ContentDocumentResult')
          ..add('documentType', documentType)
          ..add('language', language)
          ..add('title', title)
          ..add('blocks', blocks)
          ..add('evidenceIndex', evidenceIndex)
          ..add('kind', kind)
          ..add('sourceSetRef', sourceSetRef)
          ..add('reviewStatus', reviewStatus)
          ..add('reviewHistory', reviewHistory))
        .toString();
  }
}

class ContentDocumentResultBuilder
    implements Builder<ContentDocumentResult, ContentDocumentResultBuilder> {
  _$ContentDocumentResult? _$v;

  ContentDocumentResultDocumentTypeEnum? _documentType;
  ContentDocumentResultDocumentTypeEnum? get documentType =>
      _$this._documentType;
  set documentType(ContentDocumentResultDocumentTypeEnum? documentType) =>
      _$this._documentType = documentType;

  ContentDocumentResultLanguageEnum? _language;
  ContentDocumentResultLanguageEnum? get language => _$this._language;
  set language(ContentDocumentResultLanguageEnum? language) =>
      _$this._language = language;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ListBuilder<BlocksInner>? _blocks;
  ListBuilder<BlocksInner> get blocks =>
      _$this._blocks ??= ListBuilder<BlocksInner>();
  set blocks(ListBuilder<BlocksInner>? blocks) => _$this._blocks = blocks;

  ListBuilder<ContentCitation>? _evidenceIndex;
  ListBuilder<ContentCitation> get evidenceIndex =>
      _$this._evidenceIndex ??= ListBuilder<ContentCitation>();
  set evidenceIndex(ListBuilder<ContentCitation>? evidenceIndex) =>
      _$this._evidenceIndex = evidenceIndex;

  ContentDocumentResultKindEnum? _kind;
  ContentDocumentResultKindEnum? get kind => _$this._kind;
  set kind(ContentDocumentResultKindEnum? kind) => _$this._kind = kind;

  String? _sourceSetRef;
  String? get sourceSetRef => _$this._sourceSetRef;
  set sourceSetRef(String? sourceSetRef) => _$this._sourceSetRef = sourceSetRef;

  ContentDocumentResultReviewStatusEnum? _reviewStatus;
  ContentDocumentResultReviewStatusEnum? get reviewStatus =>
      _$this._reviewStatus;
  set reviewStatus(ContentDocumentResultReviewStatusEnum? reviewStatus) =>
      _$this._reviewStatus = reviewStatus;

  ListBuilder<ContentReview>? _reviewHistory;
  ListBuilder<ContentReview> get reviewHistory =>
      _$this._reviewHistory ??= ListBuilder<ContentReview>();
  set reviewHistory(ListBuilder<ContentReview>? reviewHistory) =>
      _$this._reviewHistory = reviewHistory;

  ContentDocumentResultBuilder() {
    ContentDocumentResult._defaults(this);
  }

  ContentDocumentResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _documentType = $v.documentType;
      _language = $v.language;
      _title = $v.title;
      _blocks = $v.blocks.toBuilder();
      _evidenceIndex = $v.evidenceIndex.toBuilder();
      _kind = $v.kind;
      _sourceSetRef = $v.sourceSetRef;
      _reviewStatus = $v.reviewStatus;
      _reviewHistory = $v.reviewHistory.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContentDocumentResult other) {
    _$v = other as _$ContentDocumentResult;
  }

  @override
  void update(void Function(ContentDocumentResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ContentDocumentResult build() => _build();

  _$ContentDocumentResult _build() {
    _$ContentDocumentResult _$result;
    try {
      _$result = _$v ??
          _$ContentDocumentResult._(
            documentType: BuiltValueNullFieldError.checkNotNull(
                documentType, r'ContentDocumentResult', 'documentType'),
            language: BuiltValueNullFieldError.checkNotNull(
                language, r'ContentDocumentResult', 'language'),
            title: title,
            blocks: blocks.build(),
            evidenceIndex: evidenceIndex.build(),
            kind: BuiltValueNullFieldError.checkNotNull(
                kind, r'ContentDocumentResult', 'kind'),
            sourceSetRef: BuiltValueNullFieldError.checkNotNull(
                sourceSetRef, r'ContentDocumentResult', 'sourceSetRef'),
            reviewStatus: BuiltValueNullFieldError.checkNotNull(
                reviewStatus, r'ContentDocumentResult', 'reviewStatus'),
            reviewHistory: reviewHistory.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'blocks';
        blocks.build();
        _$failedField = 'evidenceIndex';
        evidenceIndex.build();

        _$failedField = 'reviewHistory';
        reviewHistory.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ContentDocumentResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
