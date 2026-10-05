// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_finding.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ContentFindingSeverityEnum _$contentFindingSeverityEnum_blocking =
    const ContentFindingSeverityEnum._('blocking');
const ContentFindingSeverityEnum _$contentFindingSeverityEnum_major =
    const ContentFindingSeverityEnum._('major');
const ContentFindingSeverityEnum _$contentFindingSeverityEnum_minor =
    const ContentFindingSeverityEnum._('minor');
const ContentFindingSeverityEnum
    _$contentFindingSeverityEnum_unknownDefaultOpenApi =
    const ContentFindingSeverityEnum._('unknownDefaultOpenApi');

ContentFindingSeverityEnum _$contentFindingSeverityEnumValueOf(String name) {
  switch (name) {
    case 'blocking':
      return _$contentFindingSeverityEnum_blocking;
    case 'major':
      return _$contentFindingSeverityEnum_major;
    case 'minor':
      return _$contentFindingSeverityEnum_minor;
    case 'unknownDefaultOpenApi':
      return _$contentFindingSeverityEnum_unknownDefaultOpenApi;
    default:
      return _$contentFindingSeverityEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<ContentFindingSeverityEnum> _$contentFindingSeverityEnumValues =
    BuiltSet<ContentFindingSeverityEnum>(const <ContentFindingSeverityEnum>[
  _$contentFindingSeverityEnum_blocking,
  _$contentFindingSeverityEnum_major,
  _$contentFindingSeverityEnum_minor,
  _$contentFindingSeverityEnum_unknownDefaultOpenApi,
]);

const ContentFindingCategoryEnum _$contentFindingCategoryEnum_fact =
    const ContentFindingCategoryEnum._('fact');
const ContentFindingCategoryEnum _$contentFindingCategoryEnum_purpose =
    const ContentFindingCategoryEnum._('purpose');
const ContentFindingCategoryEnum _$contentFindingCategoryEnum_structure =
    const ContentFindingCategoryEnum._('structure');
const ContentFindingCategoryEnum _$contentFindingCategoryEnum_expression =
    const ContentFindingCategoryEnum._('expression');
const ContentFindingCategoryEnum _$contentFindingCategoryEnum_missingMaterial =
    const ContentFindingCategoryEnum._('missingMaterial');
const ContentFindingCategoryEnum
    _$contentFindingCategoryEnum_unknownDefaultOpenApi =
    const ContentFindingCategoryEnum._('unknownDefaultOpenApi');

ContentFindingCategoryEnum _$contentFindingCategoryEnumValueOf(String name) {
  switch (name) {
    case 'fact':
      return _$contentFindingCategoryEnum_fact;
    case 'purpose':
      return _$contentFindingCategoryEnum_purpose;
    case 'structure':
      return _$contentFindingCategoryEnum_structure;
    case 'expression':
      return _$contentFindingCategoryEnum_expression;
    case 'missingMaterial':
      return _$contentFindingCategoryEnum_missingMaterial;
    case 'unknownDefaultOpenApi':
      return _$contentFindingCategoryEnum_unknownDefaultOpenApi;
    default:
      return _$contentFindingCategoryEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<ContentFindingCategoryEnum> _$contentFindingCategoryEnumValues =
    BuiltSet<ContentFindingCategoryEnum>(const <ContentFindingCategoryEnum>[
  _$contentFindingCategoryEnum_fact,
  _$contentFindingCategoryEnum_purpose,
  _$contentFindingCategoryEnum_structure,
  _$contentFindingCategoryEnum_expression,
  _$contentFindingCategoryEnum_missingMaterial,
  _$contentFindingCategoryEnum_unknownDefaultOpenApi,
]);

Serializer<ContentFindingSeverityEnum> _$contentFindingSeverityEnumSerializer =
    _$ContentFindingSeverityEnumSerializer();
Serializer<ContentFindingCategoryEnum> _$contentFindingCategoryEnumSerializer =
    _$ContentFindingCategoryEnumSerializer();

class _$ContentFindingSeverityEnumSerializer
    implements PrimitiveSerializer<ContentFindingSeverityEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'blocking': 'blocking',
    'major': 'major',
    'minor': 'minor',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'blocking': 'blocking',
    'major': 'major',
    'minor': 'minor',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ContentFindingSeverityEnum];
  @override
  final String wireName = 'ContentFindingSeverityEnum';

  @override
  Object serialize(Serializers serializers, ContentFindingSeverityEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ContentFindingSeverityEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ContentFindingSeverityEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ContentFindingCategoryEnumSerializer
    implements PrimitiveSerializer<ContentFindingCategoryEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'fact': 'fact',
    'purpose': 'purpose',
    'structure': 'structure',
    'expression': 'expression',
    'missingMaterial': 'missing_material',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'fact': 'fact',
    'purpose': 'purpose',
    'structure': 'structure',
    'expression': 'expression',
    'missing_material': 'missingMaterial',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ContentFindingCategoryEnum];
  @override
  final String wireName = 'ContentFindingCategoryEnum';

  @override
  Object serialize(Serializers serializers, ContentFindingCategoryEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ContentFindingCategoryEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ContentFindingCategoryEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ContentFinding extends ContentFinding {
  @override
  final String blockId;
  @override
  final ContentFindingSeverityEnum severity;
  @override
  final ContentFindingCategoryEnum category;
  @override
  final String problem;
  @override
  final String correction;

  factory _$ContentFinding([void Function(ContentFindingBuilder)? updates]) =>
      (ContentFindingBuilder()..update(updates))._build();

  _$ContentFinding._(
      {required this.blockId,
      required this.severity,
      required this.category,
      required this.problem,
      required this.correction})
      : super._();
  @override
  ContentFinding rebuild(void Function(ContentFindingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContentFindingBuilder toBuilder() => ContentFindingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContentFinding &&
        blockId == other.blockId &&
        severity == other.severity &&
        category == other.category &&
        problem == other.problem &&
        correction == other.correction;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, blockId.hashCode);
    _$hash = $jc(_$hash, severity.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, problem.hashCode);
    _$hash = $jc(_$hash, correction.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ContentFinding')
          ..add('blockId', blockId)
          ..add('severity', severity)
          ..add('category', category)
          ..add('problem', problem)
          ..add('correction', correction))
        .toString();
  }
}

class ContentFindingBuilder
    implements Builder<ContentFinding, ContentFindingBuilder> {
  _$ContentFinding? _$v;

  String? _blockId;
  String? get blockId => _$this._blockId;
  set blockId(String? blockId) => _$this._blockId = blockId;

  ContentFindingSeverityEnum? _severity;
  ContentFindingSeverityEnum? get severity => _$this._severity;
  set severity(ContentFindingSeverityEnum? severity) =>
      _$this._severity = severity;

  ContentFindingCategoryEnum? _category;
  ContentFindingCategoryEnum? get category => _$this._category;
  set category(ContentFindingCategoryEnum? category) =>
      _$this._category = category;

  String? _problem;
  String? get problem => _$this._problem;
  set problem(String? problem) => _$this._problem = problem;

  String? _correction;
  String? get correction => _$this._correction;
  set correction(String? correction) => _$this._correction = correction;

  ContentFindingBuilder() {
    ContentFinding._defaults(this);
  }

  ContentFindingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _blockId = $v.blockId;
      _severity = $v.severity;
      _category = $v.category;
      _problem = $v.problem;
      _correction = $v.correction;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContentFinding other) {
    _$v = other as _$ContentFinding;
  }

  @override
  void update(void Function(ContentFindingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ContentFinding build() => _build();

  _$ContentFinding _build() {
    final _$result = _$v ??
        _$ContentFinding._(
          blockId: BuiltValueNullFieldError.checkNotNull(
              blockId, r'ContentFinding', 'blockId'),
          severity: BuiltValueNullFieldError.checkNotNull(
              severity, r'ContentFinding', 'severity'),
          category: BuiltValueNullFieldError.checkNotNull(
              category, r'ContentFinding', 'category'),
          problem: BuiltValueNullFieldError.checkNotNull(
              problem, r'ContentFinding', 'problem'),
          correction: BuiltValueNullFieldError.checkNotNull(
              correction, r'ContentFinding', 'correction'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
