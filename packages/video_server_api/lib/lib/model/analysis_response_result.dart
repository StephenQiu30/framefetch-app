//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/content_document_result.dart';
import 'package:video_server_api/lib/model/screenplay_analysis_result_response.dart';
import 'package:video_server_api/lib/model/video_analysis_result_response.dart';
import 'package:video_server_api/lib/model/screenplay_rewrite_result_response.dart';
import 'package:video_server_api/lib/model/structured_report_result_response.dart';
import 'package:video_server_api/lib/model/video_article_result_response.dart';
import 'package:video_server_api/lib/model/skill_report_result.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'analysis_response_result.g.dart';

/// AnalysisResponseResult
///
/// Properties:
/// * [kind]
/// * [schemaVersion]
/// * [skillId]
/// * [language]
/// * [title]
/// * [summary]
/// * [body]
/// * [evidence]
/// * [mediaEvidence]
/// * [limitations]
/// * [data]
/// * [documentType]
/// * [blocks]
/// * [evidenceIndex]
/// * [sourceSetRef]
/// * [reviewStatus]
/// * [reviewHistory]
/// * [media]
/// * [shotCount]
/// * [shots]
/// * [scenes]
/// * [highlights]
/// * [assets]
/// * [productionAdvice]
/// * [lead]
/// * [sections]
/// * [keyPoints]
/// * [closing]
/// * [logline]
/// * [synopsis]
/// * [structure]
/// * [characters]
/// * [dialogueFindings]
/// * [strengths]
/// * [priorityRevisions]
/// * [sourceLanguage]
/// * [targetLanguage]
/// * [sourceSceneCount]
/// * [outputSceneCount]
/// * [glossary]
/// * [changeSummary]
@BuiltValue()
abstract class AnalysisResponseResult
    implements Built<AnalysisResponseResult, AnalysisResponseResultBuilder> {
  /// One Of [ContentDocumentResult], [ScreenplayAnalysisResultResponse], [ScreenplayRewriteResultResponse], [SkillReportResult], [StructuredReportResultResponse], [VideoAnalysisResultResponse], [VideoArticleResultResponse]
  OneOf get oneOf;

  static const String discriminatorFieldName = r'kind';

  static const Map<String, Type> discriminatorMapping = {
    r'content_document': ContentDocumentResult,
    r'screenplay_analysis': ScreenplayAnalysisResultResponse,
    r'screenplay_rewrite': ScreenplayRewriteResultResponse,
    r'skill_report': SkillReportResult,
    r'structured_report': StructuredReportResultResponse,
    r'video_article': VideoArticleResultResponse,
    r'video_visual_analysis': VideoAnalysisResultResponse,
  };

  AnalysisResponseResult._();

  factory AnalysisResponseResult(
          [void updates(AnalysisResponseResultBuilder b)]) =
      _$AnalysisResponseResult;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AnalysisResponseResultBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AnalysisResponseResult> get serializer =>
      _$AnalysisResponseResultSerializer();
}

extension AnalysisResponseResultDiscriminatorExt on AnalysisResponseResult {
  String? get discriminatorValue {
    if (this is ContentDocumentResult) {
      return r'content_document';
    }
    if (this is ScreenplayAnalysisResultResponse) {
      return r'screenplay_analysis';
    }
    if (this is ScreenplayRewriteResultResponse) {
      return r'screenplay_rewrite';
    }
    if (this is SkillReportResult) {
      return r'skill_report';
    }
    if (this is StructuredReportResultResponse) {
      return r'structured_report';
    }
    if (this is VideoArticleResultResponse) {
      return r'video_article';
    }
    if (this is VideoAnalysisResultResponse) {
      return r'video_visual_analysis';
    }
    return null;
  }
}

extension AnalysisResponseResultBuilderDiscriminatorExt
    on AnalysisResponseResultBuilder {
  String? get discriminatorValue {
    if (this is ContentDocumentResultBuilder) {
      return r'content_document';
    }
    if (this is ScreenplayAnalysisResultResponseBuilder) {
      return r'screenplay_analysis';
    }
    if (this is ScreenplayRewriteResultResponseBuilder) {
      return r'screenplay_rewrite';
    }
    if (this is SkillReportResultBuilder) {
      return r'skill_report';
    }
    if (this is StructuredReportResultResponseBuilder) {
      return r'structured_report';
    }
    if (this is VideoArticleResultResponseBuilder) {
      return r'video_article';
    }
    if (this is VideoAnalysisResultResponseBuilder) {
      return r'video_visual_analysis';
    }
    return null;
  }
}

class _$AnalysisResponseResultSerializer
    implements PrimitiveSerializer<AnalysisResponseResult> {
  @override
  final Iterable<Type> types = const [
    AnalysisResponseResult,
    _$AnalysisResponseResult
  ];

  @override
  final String wireName = r'AnalysisResponseResult';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AnalysisResponseResult object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {}

  @override
  Object serialize(
    Serializers serializers,
    AnalysisResponseResult object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(oneOf.value,
        specifiedType: FullType(oneOf.valueType))!;
  }

  @override
  AnalysisResponseResult deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnalysisResponseResultBuilder();
    Object? oneOfDataSrc;
    final serializedList = (serialized as Iterable<Object?>).toList();
    final discIndex =
        serializedList.indexOf(AnalysisResponseResult.discriminatorFieldName) +
            1;
    final discValue = serializers.deserialize(serializedList[discIndex],
        specifiedType: FullType(String)) as String;
    oneOfDataSrc = serialized;
    final oneOfTypes = [
      ContentDocumentResult,
      ScreenplayAnalysisResultResponse,
      ScreenplayRewriteResultResponse,
      SkillReportResult,
      StructuredReportResultResponse,
      VideoArticleResultResponse,
      VideoAnalysisResultResponse,
    ];
    Object oneOfResult;
    Type oneOfType;
    switch (discValue) {
      case r'content_document':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(ContentDocumentResult),
        ) as ContentDocumentResult;
        oneOfType = ContentDocumentResult;
        break;
      case r'screenplay_analysis':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(ScreenplayAnalysisResultResponse),
        ) as ScreenplayAnalysisResultResponse;
        oneOfType = ScreenplayAnalysisResultResponse;
        break;
      case r'screenplay_rewrite':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(ScreenplayRewriteResultResponse),
        ) as ScreenplayRewriteResultResponse;
        oneOfType = ScreenplayRewriteResultResponse;
        break;
      case r'skill_report':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(SkillReportResult),
        ) as SkillReportResult;
        oneOfType = SkillReportResult;
        break;
      case r'structured_report':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(StructuredReportResultResponse),
        ) as StructuredReportResultResponse;
        oneOfType = StructuredReportResultResponse;
        break;
      case r'video_article':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(VideoArticleResultResponse),
        ) as VideoArticleResultResponse;
        oneOfType = VideoArticleResultResponse;
        break;
      case r'video_visual_analysis':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(VideoAnalysisResultResponse),
        ) as VideoAnalysisResultResponse;
        oneOfType = VideoAnalysisResultResponse;
        break;
      default:
        throw UnsupportedError(
            "Couldn't deserialize oneOf for the discriminator value: ${discValue}");
    }
    result.oneOf = OneOfDynamic(
        typeIndex: oneOfTypes.indexOf(oneOfType),
        types: oneOfTypes,
        value: oneOfResult);
    return result.build();
  }
}

class AnalysisResponseResultKindEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'structured_report')
  static const AnalysisResponseResultKindEnum structuredReport =
      _$analysisResponseResultKindEnum_structuredReport;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const AnalysisResponseResultKindEnum unknownDefaultOpenApi =
      _$analysisResponseResultKindEnum_unknownDefaultOpenApi;

  static Serializer<AnalysisResponseResultKindEnum> get serializer =>
      _$analysisResponseResultKindEnumSerializer;

  const AnalysisResponseResultKindEnum._(String name) : super(name);

  static BuiltSet<AnalysisResponseResultKindEnum> get values =>
      _$analysisResponseResultKindEnumValues;
  static AnalysisResponseResultKindEnum valueOf(String name) =>
      _$analysisResponseResultKindEnumValueOf(name);
}

class AnalysisResponseResultSchemaVersionEnum extends EnumClass {
  @BuiltValueEnumConst(wireNumber: 1)
  static const AnalysisResponseResultSchemaVersionEnum number1 =
      _$analysisResponseResultSchemaVersionEnum_number1;
  @BuiltValueEnumConst(wireNumber: 11184809, fallback: true)
  static const AnalysisResponseResultSchemaVersionEnum unknownDefaultOpenApi =
      _$analysisResponseResultSchemaVersionEnum_unknownDefaultOpenApi;

  static Serializer<AnalysisResponseResultSchemaVersionEnum> get serializer =>
      _$analysisResponseResultSchemaVersionEnumSerializer;

  const AnalysisResponseResultSchemaVersionEnum._(String name) : super(name);

  static BuiltSet<AnalysisResponseResultSchemaVersionEnum> get values =>
      _$analysisResponseResultSchemaVersionEnumValues;
  static AnalysisResponseResultSchemaVersionEnum valueOf(String name) =>
      _$analysisResponseResultSchemaVersionEnumValueOf(name);
}

class AnalysisResponseResultDocumentTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'article')
  static const AnalysisResponseResultDocumentTypeEnum article =
      _$analysisResponseResultDocumentTypeEnum_article;
  @BuiltValueEnumConst(wireName: r'post')
  static const AnalysisResponseResultDocumentTypeEnum post =
      _$analysisResponseResultDocumentTypeEnum_post;
  @BuiltValueEnumConst(wireName: r'guide')
  static const AnalysisResponseResultDocumentTypeEnum guide =
      _$analysisResponseResultDocumentTypeEnum_guide;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const AnalysisResponseResultDocumentTypeEnum unknownDefaultOpenApi =
      _$analysisResponseResultDocumentTypeEnum_unknownDefaultOpenApi;

  static Serializer<AnalysisResponseResultDocumentTypeEnum> get serializer =>
      _$analysisResponseResultDocumentTypeEnumSerializer;

  const AnalysisResponseResultDocumentTypeEnum._(String name) : super(name);

  static BuiltSet<AnalysisResponseResultDocumentTypeEnum> get values =>
      _$analysisResponseResultDocumentTypeEnumValues;
  static AnalysisResponseResultDocumentTypeEnum valueOf(String name) =>
      _$analysisResponseResultDocumentTypeEnumValueOf(name);
}

class AnalysisResponseResultReviewStatusEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'not_reviewed')
  static const AnalysisResponseResultReviewStatusEnum notReviewed =
      _$analysisResponseResultReviewStatusEnum_notReviewed;
  @BuiltValueEnumConst(wireName: r'passed')
  static const AnalysisResponseResultReviewStatusEnum passed =
      _$analysisResponseResultReviewStatusEnum_passed;
  @BuiltValueEnumConst(wireName: r'needs_review')
  static const AnalysisResponseResultReviewStatusEnum needsReview =
      _$analysisResponseResultReviewStatusEnum_needsReview;
  @BuiltValueEnumConst(wireName: r'needs_material')
  static const AnalysisResponseResultReviewStatusEnum needsMaterial =
      _$analysisResponseResultReviewStatusEnum_needsMaterial;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const AnalysisResponseResultReviewStatusEnum unknownDefaultOpenApi =
      _$analysisResponseResultReviewStatusEnum_unknownDefaultOpenApi;

  static Serializer<AnalysisResponseResultReviewStatusEnum> get serializer =>
      _$analysisResponseResultReviewStatusEnumSerializer;

  const AnalysisResponseResultReviewStatusEnum._(String name) : super(name);

  static BuiltSet<AnalysisResponseResultReviewStatusEnum> get values =>
      _$analysisResponseResultReviewStatusEnumValues;
  static AnalysisResponseResultReviewStatusEnum valueOf(String name) =>
      _$analysisResponseResultReviewStatusEnumValueOf(name);
}
