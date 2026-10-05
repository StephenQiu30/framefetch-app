//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/content_review.dart';
import 'package:video_server_api/lib/model/structured_report_section_response.dart';
import 'package:video_server_api/lib/model/analysis_media_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'structured_report_result_response.g.dart';

/// StructuredReportResultResponse
///
/// Properties:
/// * [kind]
/// * [language]
/// * [title]
/// * [summary]
/// * [sections]
/// * [limitations]
/// * [media]
/// * [reviewStatus]
/// * [reviewHistory]
@BuiltValue()
abstract class StructuredReportResultResponse
    implements
        Built<StructuredReportResultResponse,
            StructuredReportResultResponseBuilder> {
  @BuiltValueField(wireName: r'kind')
  StructuredReportResultResponseKindEnum get kind;
  // enum kindEnum {  structured_report,  };

  @BuiltValueField(wireName: r'language')
  String get language;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'summary')
  String get summary;

  @BuiltValueField(wireName: r'sections')
  BuiltList<StructuredReportSectionResponse> get sections;

  @BuiltValueField(wireName: r'limitations')
  BuiltList<String> get limitations;

  @BuiltValueField(wireName: r'media')
  AnalysisMediaResponse? get media;

  @BuiltValueField(wireName: r'review_status')
  StructuredReportResultResponseReviewStatusEnum? get reviewStatus;
  // enum reviewStatusEnum {  not_reviewed,  passed,  needs_review,  needs_material,  };

  @BuiltValueField(wireName: r'review_history')
  BuiltList<ContentReview>? get reviewHistory;

  StructuredReportResultResponse._();

  factory StructuredReportResultResponse(
          [void updates(StructuredReportResultResponseBuilder b)]) =
      _$StructuredReportResultResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StructuredReportResultResponseBuilder b) =>
      b..reviewHistory = ListBuilder();

  @BuiltValueSerializer(custom: true)
  static Serializer<StructuredReportResultResponse> get serializer =>
      _$StructuredReportResultResponseSerializer();
}

class _$StructuredReportResultResponseSerializer
    implements PrimitiveSerializer<StructuredReportResultResponse> {
  @override
  final Iterable<Type> types = const [
    StructuredReportResultResponse,
    _$StructuredReportResultResponse
  ];

  @override
  final String wireName = r'StructuredReportResultResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StructuredReportResultResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'kind';
    yield serializers.serialize(
      object.kind,
      specifiedType: const FullType(StructuredReportResultResponseKindEnum),
    );
    yield r'language';
    yield serializers.serialize(
      object.language,
      specifiedType: const FullType(String),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'summary';
    yield serializers.serialize(
      object.summary,
      specifiedType: const FullType(String),
    );
    yield r'sections';
    yield serializers.serialize(
      object.sections,
      specifiedType: const FullType(
          BuiltList, [FullType(StructuredReportSectionResponse)]),
    );
    yield r'limitations';
    yield serializers.serialize(
      object.limitations,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'media';
    yield object.media == null
        ? null
        : serializers.serialize(
            object.media,
            specifiedType: const FullType.nullable(AnalysisMediaResponse),
          );
    if (object.reviewStatus != null) {
      yield r'review_status';
      yield serializers.serialize(
        object.reviewStatus,
        specifiedType:
            const FullType(StructuredReportResultResponseReviewStatusEnum),
      );
    }
    if (object.reviewHistory != null) {
      yield r'review_history';
      yield serializers.serialize(
        object.reviewHistory,
        specifiedType: const FullType(BuiltList, [FullType(ContentReview)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    StructuredReportResultResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required StructuredReportResultResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'kind':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(StructuredReportResultResponseKindEnum),
          ) as StructuredReportResultResponseKindEnum;
          result.kind = valueDes;
          break;
        case r'language':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.language = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.summary = valueDes;
          break;
        case r'sections':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(StructuredReportSectionResponse)]),
          ) as BuiltList<StructuredReportSectionResponse>;
          result.sections.replace(valueDes);
          break;
        case r'limitations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.limitations.replace(valueDes);
          break;
        case r'media':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AnalysisMediaResponse),
          ) as AnalysisMediaResponse?;
          if (valueDes == null) continue;
          result.media.replace(valueDes);
          break;
        case r'review_status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(StructuredReportResultResponseReviewStatusEnum),
          ) as StructuredReportResultResponseReviewStatusEnum;
          result.reviewStatus = valueDes;
          break;
        case r'review_history':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ContentReview)]),
          ) as BuiltList<ContentReview>;
          result.reviewHistory.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StructuredReportResultResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StructuredReportResultResponseBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

class StructuredReportResultResponseKindEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'structured_report')
  static const StructuredReportResultResponseKindEnum structuredReport =
      _$structuredReportResultResponseKindEnum_structuredReport;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const StructuredReportResultResponseKindEnum unknownDefaultOpenApi =
      _$structuredReportResultResponseKindEnum_unknownDefaultOpenApi;

  static Serializer<StructuredReportResultResponseKindEnum> get serializer =>
      _$structuredReportResultResponseKindEnumSerializer;

  const StructuredReportResultResponseKindEnum._(String name) : super(name);

  static BuiltSet<StructuredReportResultResponseKindEnum> get values =>
      _$structuredReportResultResponseKindEnumValues;
  static StructuredReportResultResponseKindEnum valueOf(String name) =>
      _$structuredReportResultResponseKindEnumValueOf(name);
}

class StructuredReportResultResponseReviewStatusEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'not_reviewed')
  static const StructuredReportResultResponseReviewStatusEnum notReviewed =
      _$structuredReportResultResponseReviewStatusEnum_notReviewed;
  @BuiltValueEnumConst(wireName: r'passed')
  static const StructuredReportResultResponseReviewStatusEnum passed =
      _$structuredReportResultResponseReviewStatusEnum_passed;
  @BuiltValueEnumConst(wireName: r'needs_review')
  static const StructuredReportResultResponseReviewStatusEnum needsReview =
      _$structuredReportResultResponseReviewStatusEnum_needsReview;
  @BuiltValueEnumConst(wireName: r'needs_material')
  static const StructuredReportResultResponseReviewStatusEnum needsMaterial =
      _$structuredReportResultResponseReviewStatusEnum_needsMaterial;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const StructuredReportResultResponseReviewStatusEnum
      unknownDefaultOpenApi =
      _$structuredReportResultResponseReviewStatusEnum_unknownDefaultOpenApi;

  static Serializer<StructuredReportResultResponseReviewStatusEnum>
      get serializer =>
          _$structuredReportResultResponseReviewStatusEnumSerializer;

  const StructuredReportResultResponseReviewStatusEnum._(String name)
      : super(name);

  static BuiltSet<StructuredReportResultResponseReviewStatusEnum> get values =>
      _$structuredReportResultResponseReviewStatusEnumValues;
  static StructuredReportResultResponseReviewStatusEnum valueOf(String name) =>
      _$structuredReportResultResponseReviewStatusEnumValueOf(name);
}
