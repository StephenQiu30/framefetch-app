//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/video_analysis_history_record_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/content_creation_history_record_response.dart';
import 'package:video_server_api/lib/model/skill_analysis_history_record_response.dart';
import 'package:video_server_api/lib/model/screenplay_analysis_history_record_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'data.g.dart';

/// 成功时为业务数据，错误时为 null。
///
/// Properties:
/// * [updatedAt]
/// * [statusGroup]
/// * [sourceAvailability]
/// * [resultAvailability]
/// * [recordType]
/// * [documentId]
/// * [artifactId]
/// * [outputLanguage]
/// * [resultContract]
/// * [currentRunNo]
/// * [cancelRequestedAt]
/// * [version]
/// * [allowedActions]
/// * [actionUnavailableReason]
/// * [id]
/// * [downloadId]
/// * [title]
/// * [skillId]
/// * [createdAt]
/// * [status]
/// * [progress]
/// * [stage]
/// * [errorCode]
@BuiltValue()
abstract class Data implements Built<Data, DataBuilder> {
  /// One Of [ContentCreationHistoryRecordResponse], [ScreenplayAnalysisHistoryRecordResponse], [SkillAnalysisHistoryRecordResponse], [VideoAnalysisHistoryRecordResponse]
  OneOf get oneOf;

  static const String discriminatorFieldName = r'record_type';

  static const Map<String, Type> discriminatorMapping = {
    r'content_creation': ContentCreationHistoryRecordResponse,
    r'screenplay_analysis': ScreenplayAnalysisHistoryRecordResponse,
    r'skill_analysis': SkillAnalysisHistoryRecordResponse,
    r'video_analysis': VideoAnalysisHistoryRecordResponse,
  };

  Data._();

  factory Data([void updates(DataBuilder b)]) = _$Data;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Data> get serializer => _$DataSerializer();
}

extension DataDiscriminatorExt on Data {
  String? get discriminatorValue {
    if (this is ContentCreationHistoryRecordResponse) {
      return r'content_creation';
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

extension DataBuilderDiscriminatorExt on DataBuilder {
  String? get discriminatorValue {
    if (this is ContentCreationHistoryRecordResponseBuilder) {
      return r'content_creation';
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

class _$DataSerializer implements PrimitiveSerializer<Data> {
  @override
  final Iterable<Type> types = const [Data, _$Data];

  @override
  final String wireName = r'Data';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Data object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {}

  @override
  Object serialize(
    Serializers serializers,
    Data object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(oneOf.value,
        specifiedType: FullType(oneOf.valueType))!;
  }

  @override
  Data deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DataBuilder();
    Object? oneOfDataSrc;
    final serializedList = (serialized as Iterable<Object?>).toList();
    final discIndex = serializedList.indexOf(Data.discriminatorFieldName) + 1;
    final discValue = serializers.deserialize(serializedList[discIndex],
        specifiedType: FullType(String)) as String;
    oneOfDataSrc = serialized;
    final oneOfTypes = [
      ContentCreationHistoryRecordResponse,
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

class DataRecordTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'skill_analysis')
  static const DataRecordTypeEnum skillAnalysis =
      _$dataRecordTypeEnum_skillAnalysis;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const DataRecordTypeEnum unknownDefaultOpenApi =
      _$dataRecordTypeEnum_unknownDefaultOpenApi;

  static Serializer<DataRecordTypeEnum> get serializer =>
      _$dataRecordTypeEnumSerializer;

  const DataRecordTypeEnum._(String name) : super(name);

  static BuiltSet<DataRecordTypeEnum> get values => _$dataRecordTypeEnumValues;
  static DataRecordTypeEnum valueOf(String name) =>
      _$dataRecordTypeEnumValueOf(name);
}

class DataAllowedActionsEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'view')
  static const DataAllowedActionsEnum view = _$dataAllowedActionsEnum_view;
  @BuiltValueEnumConst(wireName: r'retry')
  static const DataAllowedActionsEnum retry = _$dataAllowedActionsEnum_retry;
  @BuiltValueEnumConst(wireName: r'cancel')
  static const DataAllowedActionsEnum cancel = _$dataAllowedActionsEnum_cancel;
  @BuiltValueEnumConst(wireName: r'delete')
  static const DataAllowedActionsEnum delete = _$dataAllowedActionsEnum_delete;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const DataAllowedActionsEnum unknownDefaultOpenApi =
      _$dataAllowedActionsEnum_unknownDefaultOpenApi;

  static Serializer<DataAllowedActionsEnum> get serializer =>
      _$dataAllowedActionsEnumSerializer;

  const DataAllowedActionsEnum._(String name) : super(name);

  static BuiltSet<DataAllowedActionsEnum> get values =>
      _$dataAllowedActionsEnumValues;
  static DataAllowedActionsEnum valueOf(String name) =>
      _$dataAllowedActionsEnumValueOf(name);
}
