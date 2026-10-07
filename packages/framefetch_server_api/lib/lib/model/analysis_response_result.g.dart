// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_response_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AnalysisResponseResultKindEnum
    _$analysisResponseResultKindEnum_structuredReport =
    const AnalysisResponseResultKindEnum._('structuredReport');
const AnalysisResponseResultKindEnum
    _$analysisResponseResultKindEnum_unknownDefaultOpenApi =
    const AnalysisResponseResultKindEnum._('unknownDefaultOpenApi');

AnalysisResponseResultKindEnum _$analysisResponseResultKindEnumValueOf(
    String name) {
  switch (name) {
    case 'structuredReport':
      return _$analysisResponseResultKindEnum_structuredReport;
    case 'unknownDefaultOpenApi':
      return _$analysisResponseResultKindEnum_unknownDefaultOpenApi;
    default:
      return _$analysisResponseResultKindEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<AnalysisResponseResultKindEnum>
    _$analysisResponseResultKindEnumValues = BuiltSet<
        AnalysisResponseResultKindEnum>(const <AnalysisResponseResultKindEnum>[
  _$analysisResponseResultKindEnum_structuredReport,
  _$analysisResponseResultKindEnum_unknownDefaultOpenApi,
]);

const AnalysisResponseResultSchemaVersionEnum
    _$analysisResponseResultSchemaVersionEnum_number1 =
    const AnalysisResponseResultSchemaVersionEnum._('number1');
const AnalysisResponseResultSchemaVersionEnum
    _$analysisResponseResultSchemaVersionEnum_unknownDefaultOpenApi =
    const AnalysisResponseResultSchemaVersionEnum._('unknownDefaultOpenApi');

AnalysisResponseResultSchemaVersionEnum
    _$analysisResponseResultSchemaVersionEnumValueOf(String name) {
  switch (name) {
    case 'number1':
      return _$analysisResponseResultSchemaVersionEnum_number1;
    case 'unknownDefaultOpenApi':
      return _$analysisResponseResultSchemaVersionEnum_unknownDefaultOpenApi;
    default:
      return _$analysisResponseResultSchemaVersionEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<AnalysisResponseResultSchemaVersionEnum>
    _$analysisResponseResultSchemaVersionEnumValues = BuiltSet<
        AnalysisResponseResultSchemaVersionEnum>(const <AnalysisResponseResultSchemaVersionEnum>[
  _$analysisResponseResultSchemaVersionEnum_number1,
  _$analysisResponseResultSchemaVersionEnum_unknownDefaultOpenApi,
]);

const AnalysisResponseResultDocumentTypeEnum
    _$analysisResponseResultDocumentTypeEnum_article =
    const AnalysisResponseResultDocumentTypeEnum._('article');
const AnalysisResponseResultDocumentTypeEnum
    _$analysisResponseResultDocumentTypeEnum_post =
    const AnalysisResponseResultDocumentTypeEnum._('post');
const AnalysisResponseResultDocumentTypeEnum
    _$analysisResponseResultDocumentTypeEnum_guide =
    const AnalysisResponseResultDocumentTypeEnum._('guide');
const AnalysisResponseResultDocumentTypeEnum
    _$analysisResponseResultDocumentTypeEnum_unknownDefaultOpenApi =
    const AnalysisResponseResultDocumentTypeEnum._('unknownDefaultOpenApi');

AnalysisResponseResultDocumentTypeEnum
    _$analysisResponseResultDocumentTypeEnumValueOf(String name) {
  switch (name) {
    case 'article':
      return _$analysisResponseResultDocumentTypeEnum_article;
    case 'post':
      return _$analysisResponseResultDocumentTypeEnum_post;
    case 'guide':
      return _$analysisResponseResultDocumentTypeEnum_guide;
    case 'unknownDefaultOpenApi':
      return _$analysisResponseResultDocumentTypeEnum_unknownDefaultOpenApi;
    default:
      return _$analysisResponseResultDocumentTypeEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<AnalysisResponseResultDocumentTypeEnum>
    _$analysisResponseResultDocumentTypeEnumValues = BuiltSet<
        AnalysisResponseResultDocumentTypeEnum>(const <AnalysisResponseResultDocumentTypeEnum>[
  _$analysisResponseResultDocumentTypeEnum_article,
  _$analysisResponseResultDocumentTypeEnum_post,
  _$analysisResponseResultDocumentTypeEnum_guide,
  _$analysisResponseResultDocumentTypeEnum_unknownDefaultOpenApi,
]);

const AnalysisResponseResultReviewStatusEnum
    _$analysisResponseResultReviewStatusEnum_notReviewed =
    const AnalysisResponseResultReviewStatusEnum._('notReviewed');
const AnalysisResponseResultReviewStatusEnum
    _$analysisResponseResultReviewStatusEnum_passed =
    const AnalysisResponseResultReviewStatusEnum._('passed');
const AnalysisResponseResultReviewStatusEnum
    _$analysisResponseResultReviewStatusEnum_needsReview =
    const AnalysisResponseResultReviewStatusEnum._('needsReview');
const AnalysisResponseResultReviewStatusEnum
    _$analysisResponseResultReviewStatusEnum_needsMaterial =
    const AnalysisResponseResultReviewStatusEnum._('needsMaterial');
const AnalysisResponseResultReviewStatusEnum
    _$analysisResponseResultReviewStatusEnum_unknownDefaultOpenApi =
    const AnalysisResponseResultReviewStatusEnum._('unknownDefaultOpenApi');

AnalysisResponseResultReviewStatusEnum
    _$analysisResponseResultReviewStatusEnumValueOf(String name) {
  switch (name) {
    case 'notReviewed':
      return _$analysisResponseResultReviewStatusEnum_notReviewed;
    case 'passed':
      return _$analysisResponseResultReviewStatusEnum_passed;
    case 'needsReview':
      return _$analysisResponseResultReviewStatusEnum_needsReview;
    case 'needsMaterial':
      return _$analysisResponseResultReviewStatusEnum_needsMaterial;
    case 'unknownDefaultOpenApi':
      return _$analysisResponseResultReviewStatusEnum_unknownDefaultOpenApi;
    default:
      return _$analysisResponseResultReviewStatusEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<AnalysisResponseResultReviewStatusEnum>
    _$analysisResponseResultReviewStatusEnumValues = BuiltSet<
        AnalysisResponseResultReviewStatusEnum>(const <AnalysisResponseResultReviewStatusEnum>[
  _$analysisResponseResultReviewStatusEnum_notReviewed,
  _$analysisResponseResultReviewStatusEnum_passed,
  _$analysisResponseResultReviewStatusEnum_needsReview,
  _$analysisResponseResultReviewStatusEnum_needsMaterial,
  _$analysisResponseResultReviewStatusEnum_unknownDefaultOpenApi,
]);

Serializer<AnalysisResponseResultKindEnum>
    _$analysisResponseResultKindEnumSerializer =
    _$AnalysisResponseResultKindEnumSerializer();
Serializer<AnalysisResponseResultSchemaVersionEnum>
    _$analysisResponseResultSchemaVersionEnumSerializer =
    _$AnalysisResponseResultSchemaVersionEnumSerializer();
Serializer<AnalysisResponseResultDocumentTypeEnum>
    _$analysisResponseResultDocumentTypeEnumSerializer =
    _$AnalysisResponseResultDocumentTypeEnumSerializer();
Serializer<AnalysisResponseResultReviewStatusEnum>
    _$analysisResponseResultReviewStatusEnumSerializer =
    _$AnalysisResponseResultReviewStatusEnumSerializer();

class _$AnalysisResponseResultKindEnumSerializer
    implements PrimitiveSerializer<AnalysisResponseResultKindEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'structuredReport': 'structured_report',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'structured_report': 'structuredReport',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[AnalysisResponseResultKindEnum];
  @override
  final String wireName = 'AnalysisResponseResultKindEnum';

  @override
  Object serialize(
          Serializers serializers, AnalysisResponseResultKindEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AnalysisResponseResultKindEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AnalysisResponseResultKindEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AnalysisResponseResultSchemaVersionEnumSerializer
    implements PrimitiveSerializer<AnalysisResponseResultSchemaVersionEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'number1': 1,
    'unknownDefaultOpenApi': 11184809,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    1: 'number1',
    11184809: 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[
    AnalysisResponseResultSchemaVersionEnum
  ];
  @override
  final String wireName = 'AnalysisResponseResultSchemaVersionEnum';

  @override
  Object serialize(Serializers serializers,
          AnalysisResponseResultSchemaVersionEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AnalysisResponseResultSchemaVersionEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AnalysisResponseResultSchemaVersionEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AnalysisResponseResultDocumentTypeEnumSerializer
    implements PrimitiveSerializer<AnalysisResponseResultDocumentTypeEnum> {
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
    AnalysisResponseResultDocumentTypeEnum
  ];
  @override
  final String wireName = 'AnalysisResponseResultDocumentTypeEnum';

  @override
  Object serialize(Serializers serializers,
          AnalysisResponseResultDocumentTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AnalysisResponseResultDocumentTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AnalysisResponseResultDocumentTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AnalysisResponseResultReviewStatusEnumSerializer
    implements PrimitiveSerializer<AnalysisResponseResultReviewStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'notReviewed': 'not_reviewed',
    'passed': 'passed',
    'needsReview': 'needs_review',
    'needsMaterial': 'needs_material',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'not_reviewed': 'notReviewed',
    'passed': 'passed',
    'needs_review': 'needsReview',
    'needs_material': 'needsMaterial',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[
    AnalysisResponseResultReviewStatusEnum
  ];
  @override
  final String wireName = 'AnalysisResponseResultReviewStatusEnum';

  @override
  Object serialize(Serializers serializers,
          AnalysisResponseResultReviewStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AnalysisResponseResultReviewStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AnalysisResponseResultReviewStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AnalysisResponseResult extends AnalysisResponseResult {
  @override
  final OneOf oneOf;

  factory _$AnalysisResponseResult(
          [void Function(AnalysisResponseResultBuilder)? updates]) =>
      (AnalysisResponseResultBuilder()..update(updates))._build();

  _$AnalysisResponseResult._({required this.oneOf}) : super._();
  @override
  AnalysisResponseResult rebuild(
          void Function(AnalysisResponseResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnalysisResponseResultBuilder toBuilder() =>
      AnalysisResponseResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnalysisResponseResult && oneOf == other.oneOf;
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
    return (newBuiltValueToStringHelper(r'AnalysisResponseResult')
          ..add('oneOf', oneOf))
        .toString();
  }
}

class AnalysisResponseResultBuilder
    implements Builder<AnalysisResponseResult, AnalysisResponseResultBuilder> {
  _$AnalysisResponseResult? _$v;

  OneOf? _oneOf;
  OneOf? get oneOf => _$this._oneOf;
  set oneOf(OneOf? oneOf) => _$this._oneOf = oneOf;

  AnalysisResponseResultBuilder() {
    AnalysisResponseResult._defaults(this);
  }

  AnalysisResponseResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _oneOf = $v.oneOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnalysisResponseResult other) {
    _$v = other as _$AnalysisResponseResult;
  }

  @override
  void update(void Function(AnalysisResponseResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnalysisResponseResult build() => _build();

  _$AnalysisResponseResult _build() {
    final _$result = _$v ??
        _$AnalysisResponseResult._(
          oneOf: BuiltValueNullFieldError.checkNotNull(
              oneOf, r'AnalysisResponseResult', 'oneOf'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
