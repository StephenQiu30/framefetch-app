//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:framefetch_server_api/lib/model/content_citation.dart';
import 'package:built_collection/built_collection.dart';
import 'package:framefetch_server_api/lib/model/content_review.dart';
import 'package:framefetch_server_api/lib/model/blocks_inner.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'content_document_result.g.dart';

/// ContentDocumentResult
///
/// Properties:
/// * [documentType]
/// * [language]
/// * [title]
/// * [blocks]
/// * [evidenceIndex]
/// * [kind]
/// * [sourceSetRef]
/// * [reviewStatus]
/// * [reviewHistory]
@BuiltValue()
abstract class ContentDocumentResult
    implements Built<ContentDocumentResult, ContentDocumentResultBuilder> {
  @BuiltValueField(wireName: r'document_type')
  ContentDocumentResultDocumentTypeEnum get documentType;
  // enum documentTypeEnum {  article,  post,  guide,  };

  @BuiltValueField(wireName: r'language')
  ContentDocumentResultLanguageEnum get language;
  // enum languageEnum {  zh-CN,  en-US,  };

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'blocks')
  BuiltList<BlocksInner> get blocks;

  @BuiltValueField(wireName: r'evidence_index')
  BuiltList<ContentCitation> get evidenceIndex;

  @BuiltValueField(wireName: r'kind')
  ContentDocumentResultKindEnum get kind;
  // enum kindEnum {  content_document,  };

  @BuiltValueField(wireName: r'source_set_ref')
  String get sourceSetRef;

  @BuiltValueField(wireName: r'review_status')
  ContentDocumentResultReviewStatusEnum get reviewStatus;
  // enum reviewStatusEnum {  passed,  needs_review,  needs_material,  };

  @BuiltValueField(wireName: r'review_history')
  BuiltList<ContentReview> get reviewHistory;

  ContentDocumentResult._();

  factory ContentDocumentResult(
      [void updates(ContentDocumentResultBuilder b)]) = _$ContentDocumentResult;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ContentDocumentResultBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ContentDocumentResult> get serializer =>
      _$ContentDocumentResultSerializer();
}

class _$ContentDocumentResultSerializer
    implements PrimitiveSerializer<ContentDocumentResult> {
  @override
  final Iterable<Type> types = const [
    ContentDocumentResult,
    _$ContentDocumentResult
  ];

  @override
  final String wireName = r'ContentDocumentResult';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ContentDocumentResult object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'document_type';
    yield serializers.serialize(
      object.documentType,
      specifiedType: const FullType(ContentDocumentResultDocumentTypeEnum),
    );
    yield r'language';
    yield serializers.serialize(
      object.language,
      specifiedType: const FullType(ContentDocumentResultLanguageEnum),
    );
    yield r'title';
    yield object.title == null
        ? null
        : serializers.serialize(
            object.title,
            specifiedType: const FullType.nullable(String),
          );
    yield r'blocks';
    yield serializers.serialize(
      object.blocks,
      specifiedType: const FullType(BuiltList, [FullType(BlocksInner)]),
    );
    yield r'evidence_index';
    yield serializers.serialize(
      object.evidenceIndex,
      specifiedType: const FullType(BuiltList, [FullType(ContentCitation)]),
    );
    yield r'kind';
    yield serializers.serialize(
      object.kind,
      specifiedType: const FullType(ContentDocumentResultKindEnum),
    );
    yield r'source_set_ref';
    yield serializers.serialize(
      object.sourceSetRef,
      specifiedType: const FullType(String),
    );
    yield r'review_status';
    yield serializers.serialize(
      object.reviewStatus,
      specifiedType: const FullType(ContentDocumentResultReviewStatusEnum),
    );
    yield r'review_history';
    yield serializers.serialize(
      object.reviewHistory,
      specifiedType: const FullType(BuiltList, [FullType(ContentReview)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ContentDocumentResult object, {
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
    required ContentDocumentResultBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'document_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(ContentDocumentResultDocumentTypeEnum),
          ) as ContentDocumentResultDocumentTypeEnum;
          result.documentType = valueDes;
          break;
        case r'language':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ContentDocumentResultLanguageEnum),
          ) as ContentDocumentResultLanguageEnum;
          result.language = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.title = valueDes;
          break;
        case r'blocks':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(BlocksInner)]),
          ) as BuiltList<BlocksInner>;
          result.blocks.replace(valueDes);
          break;
        case r'evidence_index':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(ContentCitation)]),
          ) as BuiltList<ContentCitation>;
          result.evidenceIndex.replace(valueDes);
          break;
        case r'kind':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ContentDocumentResultKindEnum),
          ) as ContentDocumentResultKindEnum;
          result.kind = valueDes;
          break;
        case r'source_set_ref':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sourceSetRef = valueDes;
          break;
        case r'review_status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(ContentDocumentResultReviewStatusEnum),
          ) as ContentDocumentResultReviewStatusEnum;
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
  ContentDocumentResult deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ContentDocumentResultBuilder();
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

class ContentDocumentResultDocumentTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'article')
  static const ContentDocumentResultDocumentTypeEnum article =
      _$contentDocumentResultDocumentTypeEnum_article;
  @BuiltValueEnumConst(wireName: r'post')
  static const ContentDocumentResultDocumentTypeEnum post =
      _$contentDocumentResultDocumentTypeEnum_post;
  @BuiltValueEnumConst(wireName: r'guide')
  static const ContentDocumentResultDocumentTypeEnum guide =
      _$contentDocumentResultDocumentTypeEnum_guide;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ContentDocumentResultDocumentTypeEnum unknownDefaultOpenApi =
      _$contentDocumentResultDocumentTypeEnum_unknownDefaultOpenApi;

  static Serializer<ContentDocumentResultDocumentTypeEnum> get serializer =>
      _$contentDocumentResultDocumentTypeEnumSerializer;

  const ContentDocumentResultDocumentTypeEnum._(String name) : super(name);

  static BuiltSet<ContentDocumentResultDocumentTypeEnum> get values =>
      _$contentDocumentResultDocumentTypeEnumValues;
  static ContentDocumentResultDocumentTypeEnum valueOf(String name) =>
      _$contentDocumentResultDocumentTypeEnumValueOf(name);
}

class ContentDocumentResultLanguageEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'zh-CN')
  static const ContentDocumentResultLanguageEnum zhCN =
      _$contentDocumentResultLanguageEnum_zhCN;
  @BuiltValueEnumConst(wireName: r'en-US')
  static const ContentDocumentResultLanguageEnum enUS =
      _$contentDocumentResultLanguageEnum_enUS;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ContentDocumentResultLanguageEnum unknownDefaultOpenApi =
      _$contentDocumentResultLanguageEnum_unknownDefaultOpenApi;

  static Serializer<ContentDocumentResultLanguageEnum> get serializer =>
      _$contentDocumentResultLanguageEnumSerializer;

  const ContentDocumentResultLanguageEnum._(String name) : super(name);

  static BuiltSet<ContentDocumentResultLanguageEnum> get values =>
      _$contentDocumentResultLanguageEnumValues;
  static ContentDocumentResultLanguageEnum valueOf(String name) =>
      _$contentDocumentResultLanguageEnumValueOf(name);
}

class ContentDocumentResultKindEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'content_document')
  static const ContentDocumentResultKindEnum contentDocument =
      _$contentDocumentResultKindEnum_contentDocument;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ContentDocumentResultKindEnum unknownDefaultOpenApi =
      _$contentDocumentResultKindEnum_unknownDefaultOpenApi;

  static Serializer<ContentDocumentResultKindEnum> get serializer =>
      _$contentDocumentResultKindEnumSerializer;

  const ContentDocumentResultKindEnum._(String name) : super(name);

  static BuiltSet<ContentDocumentResultKindEnum> get values =>
      _$contentDocumentResultKindEnumValues;
  static ContentDocumentResultKindEnum valueOf(String name) =>
      _$contentDocumentResultKindEnumValueOf(name);
}

class ContentDocumentResultReviewStatusEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'passed')
  static const ContentDocumentResultReviewStatusEnum passed =
      _$contentDocumentResultReviewStatusEnum_passed;
  @BuiltValueEnumConst(wireName: r'needs_review')
  static const ContentDocumentResultReviewStatusEnum needsReview =
      _$contentDocumentResultReviewStatusEnum_needsReview;
  @BuiltValueEnumConst(wireName: r'needs_material')
  static const ContentDocumentResultReviewStatusEnum needsMaterial =
      _$contentDocumentResultReviewStatusEnum_needsMaterial;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ContentDocumentResultReviewStatusEnum unknownDefaultOpenApi =
      _$contentDocumentResultReviewStatusEnum_unknownDefaultOpenApi;

  static Serializer<ContentDocumentResultReviewStatusEnum> get serializer =>
      _$contentDocumentResultReviewStatusEnumSerializer;

  const ContentDocumentResultReviewStatusEnum._(String name) : super(name);

  static BuiltSet<ContentDocumentResultReviewStatusEnum> get values =>
      _$contentDocumentResultReviewStatusEnumValues;
  static ContentDocumentResultReviewStatusEnum valueOf(String name) =>
      _$contentDocumentResultReviewStatusEnumValueOf(name);
}
