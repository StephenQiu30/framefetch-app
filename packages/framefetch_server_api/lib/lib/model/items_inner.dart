//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:framefetch_server_api/lib/model/content_creation_history_record_response.dart';
import 'package:framefetch_server_api/lib/model/document_parse_history_record_response.dart';
import 'package:framefetch_server_api/lib/model/parse_history_record_response.dart';
import 'package:framefetch_server_api/lib/model/video_analysis_history_record_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:framefetch_server_api/lib/model/skill_analysis_history_record_response.dart';
import 'package:framefetch_server_api/lib/model/screenplay_analysis_history_record_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'items_inner.g.dart';

/// ItemsInner
///
/// Properties:
/// * [updatedAt]
/// * [statusGroup]
/// * [sourceAvailability]
/// * [resultAvailability]
/// * [id]
/// * [version]
/// * [status]
/// * [reasonCode]
/// * [failure]
/// * [nextAction]
/// * [deadline]
/// * [inspectionId]
/// * [jobId]
/// * [createdAt]
/// * [title]
/// * [recordType]
/// * [documentId]
/// * [artifactId]
/// * [outputLanguage]
/// * [resultContract]
/// * [currentRunNo]
/// * [cancelRequestedAt]
/// * [allowedActions]
/// * [actionUnavailableReason]
/// * [downloadId]
/// * [skillId]
/// * [progress]
/// * [stage]
/// * [errorCode]
/// * [sourceFormat]
@BuiltValue()
abstract class ItemsInner implements Built<ItemsInner, ItemsInnerBuilder> {
  /// One Of [ContentCreationHistoryRecordResponse], [DocumentParseHistoryRecordResponse], [ParseHistoryRecordResponse], [ScreenplayAnalysisHistoryRecordResponse], [SkillAnalysisHistoryRecordResponse], [VideoAnalysisHistoryRecordResponse]
  OneOf get oneOf;

  static const String discriminatorFieldName = r'record_type';

  static const Map<String, Type> discriminatorMapping = {
    r'content_creation': ContentCreationHistoryRecordResponse,
    r'document_parse': DocumentParseHistoryRecordResponse,
    r'parse': ParseHistoryRecordResponse,
    r'screenplay_analysis': ScreenplayAnalysisHistoryRecordResponse,
    r'skill_analysis': SkillAnalysisHistoryRecordResponse,
    r'video_analysis': VideoAnalysisHistoryRecordResponse,
  };

  ItemsInner._();

  factory ItemsInner([void updates(ItemsInnerBuilder b)]) = _$ItemsInner;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ItemsInnerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ItemsInner> get serializer => _$ItemsInnerSerializer();
}

extension ItemsInnerDiscriminatorExt on ItemsInner {
  String? get discriminatorValue {
    if (this is ContentCreationHistoryRecordResponse) {
      return r'content_creation';
    }
    if (this is DocumentParseHistoryRecordResponse) {
      return r'document_parse';
    }
    if (this is ParseHistoryRecordResponse) {
      return r'parse';
    }
    if (this is ScreenplayAnalysisHistoryRecordResponse) {
      return r'screenplay_analysis';
    }
    if (this is SkillAnalysisHistoryRecordResponse) {
      return r'skill_analysis';
    }
    if (this is VideoAnalysisHistoryRecordResponse) {
      return r'video_analysis';
    }
    return null;
  }
}

extension ItemsInnerBuilderDiscriminatorExt on ItemsInnerBuilder {
  String? get discriminatorValue {
    if (this is ContentCreationHistoryRecordResponseBuilder) {
      return r'content_creation';
    }
    if (this is DocumentParseHistoryRecordResponseBuilder) {
      return r'document_parse';
    }
    if (this is ParseHistoryRecordResponseBuilder) {
      return r'parse';
    }
    if (this is ScreenplayAnalysisHistoryRecordResponseBuilder) {
      return r'screenplay_analysis';
    }
    if (this is SkillAnalysisHistoryRecordResponseBuilder) {
      return r'skill_analysis';
    }
    if (this is VideoAnalysisHistoryRecordResponseBuilder) {
      return r'video_analysis';
    }
    return null;
  }
}

class _$ItemsInnerSerializer implements PrimitiveSerializer<ItemsInner> {
  @override
  final Iterable<Type> types = const [ItemsInner, _$ItemsInner];

  @override
  final String wireName = r'ItemsInner';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ItemsInner object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {}

  @override
  Object serialize(
    Serializers serializers,
    ItemsInner object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(oneOf.value,
        specifiedType: FullType(oneOf.valueType))!;
  }

  @override
  ItemsInner deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ItemsInnerBuilder();
    Object? oneOfDataSrc;
    final serializedList = (serialized as Iterable<Object?>).toList();
    final discIndex =
        serializedList.indexOf(ItemsInner.discriminatorFieldName) + 1;
    final discValue = serializers.deserialize(serializedList[discIndex],
        specifiedType: FullType(String)) as String;
    oneOfDataSrc = serialized;
    final oneOfTypes = [
      ContentCreationHistoryRecordResponse,
      DocumentParseHistoryRecordResponse,
      ParseHistoryRecordResponse,
      ScreenplayAnalysisHistoryRecordResponse,
      SkillAnalysisHistoryRecordResponse,
      VideoAnalysisHistoryRecordResponse,
    ];
    Object oneOfResult;
    Type oneOfType;
    switch (discValue) {
      case r'content_creation':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(ContentCreationHistoryRecordResponse),
        ) as ContentCreationHistoryRecordResponse;
        oneOfType = ContentCreationHistoryRecordResponse;
        break;
      case r'document_parse':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(DocumentParseHistoryRecordResponse),
        ) as DocumentParseHistoryRecordResponse;
        oneOfType = DocumentParseHistoryRecordResponse;
        break;
      case r'parse':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(ParseHistoryRecordResponse),
        ) as ParseHistoryRecordResponse;
        oneOfType = ParseHistoryRecordResponse;
        break;
      case r'screenplay_analysis':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(ScreenplayAnalysisHistoryRecordResponse),
        ) as ScreenplayAnalysisHistoryRecordResponse;
        oneOfType = ScreenplayAnalysisHistoryRecordResponse;
        break;
      case r'skill_analysis':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(SkillAnalysisHistoryRecordResponse),
        ) as SkillAnalysisHistoryRecordResponse;
        oneOfType = SkillAnalysisHistoryRecordResponse;
        break;
      case r'video_analysis':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(VideoAnalysisHistoryRecordResponse),
        ) as VideoAnalysisHistoryRecordResponse;
        oneOfType = VideoAnalysisHistoryRecordResponse;
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

class ItemsInnerNextActionEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'none')
  static const ItemsInnerNextActionEnum none = _$itemsInnerNextActionEnum_none;
  @BuiltValueEnumConst(wireName: r'wait')
  static const ItemsInnerNextActionEnum wait = _$itemsInnerNextActionEnum_wait;
  @BuiltValueEnumConst(wireName: r'refresh_result')
  static const ItemsInnerNextActionEnum refreshResult =
      _$itemsInnerNextActionEnum_refreshResult;
  @BuiltValueEnumConst(wireName: r'import_file')
  static const ItemsInnerNextActionEnum importFile =
      _$itemsInnerNextActionEnum_importFile;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ItemsInnerNextActionEnum unknownDefaultOpenApi =
      _$itemsInnerNextActionEnum_unknownDefaultOpenApi;

  static Serializer<ItemsInnerNextActionEnum> get serializer =>
      _$itemsInnerNextActionEnumSerializer;

  const ItemsInnerNextActionEnum._(String name) : super(name);

  static BuiltSet<ItemsInnerNextActionEnum> get values =>
      _$itemsInnerNextActionEnumValues;
  static ItemsInnerNextActionEnum valueOf(String name) =>
      _$itemsInnerNextActionEnumValueOf(name);
}

class ItemsInnerRecordTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'document_parse')
  static const ItemsInnerRecordTypeEnum documentParse =
      _$itemsInnerRecordTypeEnum_documentParse;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ItemsInnerRecordTypeEnum unknownDefaultOpenApi =
      _$itemsInnerRecordTypeEnum_unknownDefaultOpenApi;

  static Serializer<ItemsInnerRecordTypeEnum> get serializer =>
      _$itemsInnerRecordTypeEnumSerializer;

  const ItemsInnerRecordTypeEnum._(String name) : super(name);

  static BuiltSet<ItemsInnerRecordTypeEnum> get values =>
      _$itemsInnerRecordTypeEnumValues;
  static ItemsInnerRecordTypeEnum valueOf(String name) =>
      _$itemsInnerRecordTypeEnumValueOf(name);
}

class ItemsInnerAllowedActionsEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'view')
  static const ItemsInnerAllowedActionsEnum view =
      _$itemsInnerAllowedActionsEnum_view;
  @BuiltValueEnumConst(wireName: r'retry')
  static const ItemsInnerAllowedActionsEnum retry =
      _$itemsInnerAllowedActionsEnum_retry;
  @BuiltValueEnumConst(wireName: r'cancel')
  static const ItemsInnerAllowedActionsEnum cancel =
      _$itemsInnerAllowedActionsEnum_cancel;
  @BuiltValueEnumConst(wireName: r'delete')
  static const ItemsInnerAllowedActionsEnum delete =
      _$itemsInnerAllowedActionsEnum_delete;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ItemsInnerAllowedActionsEnum unknownDefaultOpenApi =
      _$itemsInnerAllowedActionsEnum_unknownDefaultOpenApi;

  static Serializer<ItemsInnerAllowedActionsEnum> get serializer =>
      _$itemsInnerAllowedActionsEnumSerializer;

  const ItemsInnerAllowedActionsEnum._(String name) : super(name);

  static BuiltSet<ItemsInnerAllowedActionsEnum> get values =>
      _$itemsInnerAllowedActionsEnumValues;
  static ItemsInnerAllowedActionsEnum valueOf(String name) =>
      _$itemsInnerAllowedActionsEnumValueOf(name);
}
