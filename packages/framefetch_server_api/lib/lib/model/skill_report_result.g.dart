// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_report_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SkillReportResultKindEnum _$skillReportResultKindEnum_skillReport =
    const SkillReportResultKindEnum._('skillReport');
const SkillReportResultKindEnum
    _$skillReportResultKindEnum_unknownDefaultOpenApi =
    const SkillReportResultKindEnum._('unknownDefaultOpenApi');

SkillReportResultKindEnum _$skillReportResultKindEnumValueOf(String name) {
  switch (name) {
    case 'skillReport':
      return _$skillReportResultKindEnum_skillReport;
    case 'unknownDefaultOpenApi':
      return _$skillReportResultKindEnum_unknownDefaultOpenApi;
    default:
      return _$skillReportResultKindEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<SkillReportResultKindEnum> _$skillReportResultKindEnumValues =
    BuiltSet<SkillReportResultKindEnum>(const <SkillReportResultKindEnum>[
  _$skillReportResultKindEnum_skillReport,
  _$skillReportResultKindEnum_unknownDefaultOpenApi,
]);

const SkillReportResultSchemaVersionEnum
    _$skillReportResultSchemaVersionEnum_number1 =
    const SkillReportResultSchemaVersionEnum._('number1');
const SkillReportResultSchemaVersionEnum
    _$skillReportResultSchemaVersionEnum_unknownDefaultOpenApi =
    const SkillReportResultSchemaVersionEnum._('unknownDefaultOpenApi');

SkillReportResultSchemaVersionEnum _$skillReportResultSchemaVersionEnumValueOf(
    String name) {
  switch (name) {
    case 'number1':
      return _$skillReportResultSchemaVersionEnum_number1;
    case 'unknownDefaultOpenApi':
      return _$skillReportResultSchemaVersionEnum_unknownDefaultOpenApi;
    default:
      return _$skillReportResultSchemaVersionEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<SkillReportResultSchemaVersionEnum>
    _$skillReportResultSchemaVersionEnumValues = BuiltSet<
        SkillReportResultSchemaVersionEnum>(const <SkillReportResultSchemaVersionEnum>[
  _$skillReportResultSchemaVersionEnum_number1,
  _$skillReportResultSchemaVersionEnum_unknownDefaultOpenApi,
]);

const SkillReportResultLanguageEnum _$skillReportResultLanguageEnum_zhCN =
    const SkillReportResultLanguageEnum._('zhCN');
const SkillReportResultLanguageEnum
    _$skillReportResultLanguageEnum_unknownDefaultOpenApi =
    const SkillReportResultLanguageEnum._('unknownDefaultOpenApi');

SkillReportResultLanguageEnum _$skillReportResultLanguageEnumValueOf(
    String name) {
  switch (name) {
    case 'zhCN':
      return _$skillReportResultLanguageEnum_zhCN;
    case 'unknownDefaultOpenApi':
      return _$skillReportResultLanguageEnum_unknownDefaultOpenApi;
    default:
      return _$skillReportResultLanguageEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<SkillReportResultLanguageEnum>
    _$skillReportResultLanguageEnumValues = BuiltSet<
        SkillReportResultLanguageEnum>(const <SkillReportResultLanguageEnum>[
  _$skillReportResultLanguageEnum_zhCN,
  _$skillReportResultLanguageEnum_unknownDefaultOpenApi,
]);

Serializer<SkillReportResultKindEnum> _$skillReportResultKindEnumSerializer =
    _$SkillReportResultKindEnumSerializer();
Serializer<SkillReportResultSchemaVersionEnum>
    _$skillReportResultSchemaVersionEnumSerializer =
    _$SkillReportResultSchemaVersionEnumSerializer();
Serializer<SkillReportResultLanguageEnum>
    _$skillReportResultLanguageEnumSerializer =
    _$SkillReportResultLanguageEnumSerializer();

class _$SkillReportResultKindEnumSerializer
    implements PrimitiveSerializer<SkillReportResultKindEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'skillReport': 'skill_report',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'skill_report': 'skillReport',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[SkillReportResultKindEnum];
  @override
  final String wireName = 'SkillReportResultKindEnum';

  @override
  Object serialize(Serializers serializers, SkillReportResultKindEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SkillReportResultKindEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SkillReportResultKindEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$SkillReportResultSchemaVersionEnumSerializer
    implements PrimitiveSerializer<SkillReportResultSchemaVersionEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'number1': 1,
    'unknownDefaultOpenApi': 11184809,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    1: 'number1',
    11184809: 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[SkillReportResultSchemaVersionEnum];
  @override
  final String wireName = 'SkillReportResultSchemaVersionEnum';

  @override
  Object serialize(
          Serializers serializers, SkillReportResultSchemaVersionEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SkillReportResultSchemaVersionEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SkillReportResultSchemaVersionEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$SkillReportResultLanguageEnumSerializer
    implements PrimitiveSerializer<SkillReportResultLanguageEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'zhCN': 'zh-CN',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'zh-CN': 'zhCN',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[SkillReportResultLanguageEnum];
  @override
  final String wireName = 'SkillReportResultLanguageEnum';

  @override
  Object serialize(
          Serializers serializers, SkillReportResultLanguageEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SkillReportResultLanguageEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SkillReportResultLanguageEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$SkillReportResult extends SkillReportResult {
  @override
  final SkillReportResultKindEnum kind;
  @override
  final SkillReportResultSchemaVersionEnum? schemaVersion;
  @override
  final String skillId;
  @override
  final SkillReportResultLanguageEnum? language;
  @override
  final String title;
  @override
  final String summary;
  @override
  final String body;
  @override
  final BuiltList<SkillTextEvidence>? evidence;
  @override
  final BuiltList<SkillMediaEvidence>? mediaEvidence;
  @override
  final BuiltList<String?>? limitations;
  @override
  final BuiltMap<String, JsonObject?>? data;

  factory _$SkillReportResult(
          [void Function(SkillReportResultBuilder)? updates]) =>
      (SkillReportResultBuilder()..update(updates))._build();

  _$SkillReportResult._(
      {required this.kind,
      this.schemaVersion,
      required this.skillId,
      this.language,
      required this.title,
      required this.summary,
      required this.body,
      this.evidence,
      this.mediaEvidence,
      this.limitations,
      this.data})
      : super._();
  @override
  SkillReportResult rebuild(void Function(SkillReportResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SkillReportResultBuilder toBuilder() =>
      SkillReportResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SkillReportResult &&
        kind == other.kind &&
        schemaVersion == other.schemaVersion &&
        skillId == other.skillId &&
        language == other.language &&
        title == other.title &&
        summary == other.summary &&
        body == other.body &&
        evidence == other.evidence &&
        mediaEvidence == other.mediaEvidence &&
        limitations == other.limitations &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, kind.hashCode);
    _$hash = $jc(_$hash, schemaVersion.hashCode);
    _$hash = $jc(_$hash, skillId.hashCode);
    _$hash = $jc(_$hash, language.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, evidence.hashCode);
    _$hash = $jc(_$hash, mediaEvidence.hashCode);
    _$hash = $jc(_$hash, limitations.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SkillReportResult')
          ..add('kind', kind)
          ..add('schemaVersion', schemaVersion)
          ..add('skillId', skillId)
          ..add('language', language)
          ..add('title', title)
          ..add('summary', summary)
          ..add('body', body)
          ..add('evidence', evidence)
          ..add('mediaEvidence', mediaEvidence)
          ..add('limitations', limitations)
          ..add('data', data))
        .toString();
  }
}

class SkillReportResultBuilder
    implements Builder<SkillReportResult, SkillReportResultBuilder> {
  _$SkillReportResult? _$v;

  SkillReportResultKindEnum? _kind;
  SkillReportResultKindEnum? get kind => _$this._kind;
  set kind(SkillReportResultKindEnum? kind) => _$this._kind = kind;

  SkillReportResultSchemaVersionEnum? _schemaVersion;
  SkillReportResultSchemaVersionEnum? get schemaVersion =>
      _$this._schemaVersion;
  set schemaVersion(SkillReportResultSchemaVersionEnum? schemaVersion) =>
      _$this._schemaVersion = schemaVersion;

  String? _skillId;
  String? get skillId => _$this._skillId;
  set skillId(String? skillId) => _$this._skillId = skillId;

  SkillReportResultLanguageEnum? _language;
  SkillReportResultLanguageEnum? get language => _$this._language;
  set language(SkillReportResultLanguageEnum? language) =>
      _$this._language = language;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  ListBuilder<SkillTextEvidence>? _evidence;
  ListBuilder<SkillTextEvidence> get evidence =>
      _$this._evidence ??= ListBuilder<SkillTextEvidence>();
  set evidence(ListBuilder<SkillTextEvidence>? evidence) =>
      _$this._evidence = evidence;

  ListBuilder<SkillMediaEvidence>? _mediaEvidence;
  ListBuilder<SkillMediaEvidence> get mediaEvidence =>
      _$this._mediaEvidence ??= ListBuilder<SkillMediaEvidence>();
  set mediaEvidence(ListBuilder<SkillMediaEvidence>? mediaEvidence) =>
      _$this._mediaEvidence = mediaEvidence;

  ListBuilder<String?>? _limitations;
  ListBuilder<String?> get limitations =>
      _$this._limitations ??= ListBuilder<String?>();
  set limitations(ListBuilder<String?>? limitations) =>
      _$this._limitations = limitations;

  MapBuilder<String, JsonObject?>? _data;
  MapBuilder<String, JsonObject?> get data =>
      _$this._data ??= MapBuilder<String, JsonObject?>();
  set data(MapBuilder<String, JsonObject?>? data) => _$this._data = data;

  SkillReportResultBuilder() {
    SkillReportResult._defaults(this);
  }

  SkillReportResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _kind = $v.kind;
      _schemaVersion = $v.schemaVersion;
      _skillId = $v.skillId;
      _language = $v.language;
      _title = $v.title;
      _summary = $v.summary;
      _body = $v.body;
      _evidence = $v.evidence?.toBuilder();
      _mediaEvidence = $v.mediaEvidence?.toBuilder();
      _limitations = $v.limitations?.toBuilder();
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SkillReportResult other) {
    _$v = other as _$SkillReportResult;
  }

  @override
  void update(void Function(SkillReportResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SkillReportResult build() => _build();

  _$SkillReportResult _build() {
    _$SkillReportResult _$result;
    try {
      _$result = _$v ??
          _$SkillReportResult._(
            kind: BuiltValueNullFieldError.checkNotNull(
                kind, r'SkillReportResult', 'kind'),
            schemaVersion: schemaVersion,
            skillId: BuiltValueNullFieldError.checkNotNull(
                skillId, r'SkillReportResult', 'skillId'),
            language: language,
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'SkillReportResult', 'title'),
            summary: BuiltValueNullFieldError.checkNotNull(
                summary, r'SkillReportResult', 'summary'),
            body: BuiltValueNullFieldError.checkNotNull(
                body, r'SkillReportResult', 'body'),
            evidence: _evidence?.build(),
            mediaEvidence: _mediaEvidence?.build(),
            limitations: _limitations?.build(),
            data: _data?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'evidence';
        _evidence?.build();
        _$failedField = 'mediaEvidence';
        _mediaEvidence?.build();
        _$failedField = 'limitations';
        _limitations?.build();
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'SkillReportResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
