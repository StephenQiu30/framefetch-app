// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structured_report_result_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const StructuredReportResultResponseKindEnum
    _$structuredReportResultResponseKindEnum_structuredReport =
    const StructuredReportResultResponseKindEnum._('structuredReport');
const StructuredReportResultResponseKindEnum
    _$structuredReportResultResponseKindEnum_unknownDefaultOpenApi =
    const StructuredReportResultResponseKindEnum._('unknownDefaultOpenApi');

StructuredReportResultResponseKindEnum
    _$structuredReportResultResponseKindEnumValueOf(String name) {
  switch (name) {
    case 'structuredReport':
      return _$structuredReportResultResponseKindEnum_structuredReport;
    case 'unknownDefaultOpenApi':
      return _$structuredReportResultResponseKindEnum_unknownDefaultOpenApi;
    default:
      return _$structuredReportResultResponseKindEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<StructuredReportResultResponseKindEnum>
    _$structuredReportResultResponseKindEnumValues = BuiltSet<
        StructuredReportResultResponseKindEnum>(const <StructuredReportResultResponseKindEnum>[
  _$structuredReportResultResponseKindEnum_structuredReport,
  _$structuredReportResultResponseKindEnum_unknownDefaultOpenApi,
]);

Serializer<StructuredReportResultResponseKindEnum>
    _$structuredReportResultResponseKindEnumSerializer =
    _$StructuredReportResultResponseKindEnumSerializer();

class _$StructuredReportResultResponseKindEnumSerializer
    implements PrimitiveSerializer<StructuredReportResultResponseKindEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'structuredReport': 'structured_report',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'structured_report': 'structuredReport',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[
    StructuredReportResultResponseKindEnum
  ];
  @override
  final String wireName = 'StructuredReportResultResponseKindEnum';

  @override
  Object serialize(Serializers serializers,
          StructuredReportResultResponseKindEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  StructuredReportResultResponseKindEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      StructuredReportResultResponseKindEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$StructuredReportResultResponse extends StructuredReportResultResponse {
  @override
  final StructuredReportResultResponseKindEnum kind;
  @override
  final String language;
  @override
  final String title;
  @override
  final String summary;
  @override
  final BuiltList<StructuredReportSectionResponse> sections;
  @override
  final BuiltList<String> limitations;
  @override
  final AnalysisMediaResponse media;

  factory _$StructuredReportResultResponse(
          [void Function(StructuredReportResultResponseBuilder)? updates]) =>
      (StructuredReportResultResponseBuilder()..update(updates))._build();

  _$StructuredReportResultResponse._(
      {required this.kind,
      required this.language,
      required this.title,
      required this.summary,
      required this.sections,
      required this.limitations,
      required this.media})
      : super._();
  @override
  StructuredReportResultResponse rebuild(
          void Function(StructuredReportResultResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StructuredReportResultResponseBuilder toBuilder() =>
      StructuredReportResultResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StructuredReportResultResponse &&
        kind == other.kind &&
        language == other.language &&
        title == other.title &&
        summary == other.summary &&
        sections == other.sections &&
        limitations == other.limitations &&
        media == other.media;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, kind.hashCode);
    _$hash = $jc(_$hash, language.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, sections.hashCode);
    _$hash = $jc(_$hash, limitations.hashCode);
    _$hash = $jc(_$hash, media.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StructuredReportResultResponse')
          ..add('kind', kind)
          ..add('language', language)
          ..add('title', title)
          ..add('summary', summary)
          ..add('sections', sections)
          ..add('limitations', limitations)
          ..add('media', media))
        .toString();
  }
}

class StructuredReportResultResponseBuilder
    implements
        Builder<StructuredReportResultResponse,
            StructuredReportResultResponseBuilder> {
  _$StructuredReportResultResponse? _$v;

  StructuredReportResultResponseKindEnum? _kind;
  StructuredReportResultResponseKindEnum? get kind => _$this._kind;
  set kind(StructuredReportResultResponseKindEnum? kind) => _$this._kind = kind;

  String? _language;
  String? get language => _$this._language;
  set language(String? language) => _$this._language = language;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  ListBuilder<StructuredReportSectionResponse>? _sections;
  ListBuilder<StructuredReportSectionResponse> get sections =>
      _$this._sections ??= ListBuilder<StructuredReportSectionResponse>();
  set sections(ListBuilder<StructuredReportSectionResponse>? sections) =>
      _$this._sections = sections;

  ListBuilder<String>? _limitations;
  ListBuilder<String> get limitations =>
      _$this._limitations ??= ListBuilder<String>();
  set limitations(ListBuilder<String>? limitations) =>
      _$this._limitations = limitations;

  AnalysisMediaResponseBuilder? _media;
  AnalysisMediaResponseBuilder get media =>
      _$this._media ??= AnalysisMediaResponseBuilder();
  set media(AnalysisMediaResponseBuilder? media) => _$this._media = media;

  StructuredReportResultResponseBuilder() {
    StructuredReportResultResponse._defaults(this);
  }

  StructuredReportResultResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _kind = $v.kind;
      _language = $v.language;
      _title = $v.title;
      _summary = $v.summary;
      _sections = $v.sections.toBuilder();
      _limitations = $v.limitations.toBuilder();
      _media = $v.media.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StructuredReportResultResponse other) {
    _$v = other as _$StructuredReportResultResponse;
  }

  @override
  void update(void Function(StructuredReportResultResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StructuredReportResultResponse build() => _build();

  _$StructuredReportResultResponse _build() {
    _$StructuredReportResultResponse _$result;
    try {
      _$result = _$v ??
          _$StructuredReportResultResponse._(
            kind: BuiltValueNullFieldError.checkNotNull(
                kind, r'StructuredReportResultResponse', 'kind'),
            language: BuiltValueNullFieldError.checkNotNull(
                language, r'StructuredReportResultResponse', 'language'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'StructuredReportResultResponse', 'title'),
            summary: BuiltValueNullFieldError.checkNotNull(
                summary, r'StructuredReportResultResponse', 'summary'),
            sections: sections.build(),
            limitations: limitations.build(),
            media: media.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sections';
        sections.build();
        _$failedField = 'limitations';
        limitations.build();
        _$failedField = 'media';
        media.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'StructuredReportResultResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
