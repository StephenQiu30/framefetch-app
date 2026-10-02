//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/history_availability.dart';
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/import_status.dart';
import 'package:video_server_api/lib/model/history_status_group.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'document_parse_history_record_response.g.dart';

/// DocumentParseHistoryRecordResponse
///
/// Properties:
/// * [updatedAt]
/// * [statusGroup]
/// * [sourceAvailability]
/// * [resultAvailability]
/// * [recordType]
/// * [id]
/// * [documentId]
/// * [title]
/// * [status]
/// * [sourceFormat]
/// * [createdAt]
/// * [version]
/// * [errorCode]
@BuiltValue()
abstract class DocumentParseHistoryRecordResponse
    implements
        Built<DocumentParseHistoryRecordResponse,
            DocumentParseHistoryRecordResponseBuilder> {
  @BuiltValueField(wireName: r'updated_at')
  DateTime get updatedAt;

  @BuiltValueField(wireName: r'status_group')
  HistoryStatusGroup get statusGroup;
  // enum statusGroupEnum {  processing,  completed,  failed,  cancelled,  expired,  };

  @BuiltValueField(wireName: r'source_availability')
  HistoryAvailability get sourceAvailability;
  // enum sourceAvailabilityEnum {  available,  unavailable,  unknown,  not_applicable,  };

  @BuiltValueField(wireName: r'result_availability')
  HistoryAvailability get resultAvailability;
  // enum resultAvailabilityEnum {  available,  unavailable,  unknown,  not_applicable,  };

  @BuiltValueField(wireName: r'record_type')
  DocumentParseHistoryRecordResponseRecordTypeEnum get recordType;
  // enum recordTypeEnum {  document_parse,  };

  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'document_id')
  String get documentId;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'status')
  ImportStatus get status;
  // enum statusEnum {  uploading,  verifying,  ready,  failed,  cancelled,  expired,  };

  @BuiltValueField(wireName: r'source_format')
  String get sourceFormat;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'version')
  int get version;

  @BuiltValueField(wireName: r'error_code')
  String? get errorCode;

  DocumentParseHistoryRecordResponse._();

  factory DocumentParseHistoryRecordResponse(
          [void updates(DocumentParseHistoryRecordResponseBuilder b)]) =
      _$DocumentParseHistoryRecordResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DocumentParseHistoryRecordResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DocumentParseHistoryRecordResponse> get serializer =>
      _$DocumentParseHistoryRecordResponseSerializer();
}

class _$DocumentParseHistoryRecordResponseSerializer
    implements PrimitiveSerializer<DocumentParseHistoryRecordResponse> {
  @override
  final Iterable<Type> types = const [
    DocumentParseHistoryRecordResponse,
    _$DocumentParseHistoryRecordResponse
  ];

  @override
  final String wireName = r'DocumentParseHistoryRecordResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DocumentParseHistoryRecordResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'updated_at';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'status_group';
    yield serializers.serialize(
      object.statusGroup,
      specifiedType: const FullType(HistoryStatusGroup),
    );
    yield r'source_availability';
    yield serializers.serialize(
      object.sourceAvailability,
      specifiedType: const FullType(HistoryAvailability),
    );
    yield r'result_availability';
    yield serializers.serialize(
      object.resultAvailability,
      specifiedType: const FullType(HistoryAvailability),
    );
    yield r'record_type';
    yield serializers.serialize(
      object.recordType,
      specifiedType:
          const FullType(DocumentParseHistoryRecordResponseRecordTypeEnum),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'document_id';
    yield serializers.serialize(
      object.documentId,
      specifiedType: const FullType(String),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(ImportStatus),
    );
    yield r'source_format';
    yield serializers.serialize(
      object.sourceFormat,
      specifiedType: const FullType(String),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'version';
    yield serializers.serialize(
      object.version,
      specifiedType: const FullType(int),
    );
    yield r'error_code';
    yield object.errorCode == null
        ? null
        : serializers.serialize(
            object.errorCode,
            specifiedType: const FullType.nullable(String),
          );
  }

  @override
  Object serialize(
    Serializers serializers,
    DocumentParseHistoryRecordResponse object, {
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
    required DocumentParseHistoryRecordResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        case r'status_group':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(HistoryStatusGroup),
          ) as HistoryStatusGroup;
          result.statusGroup = valueDes;
          break;
        case r'source_availability':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(HistoryAvailability),
          ) as HistoryAvailability;
          result.sourceAvailability = valueDes;
          break;
        case r'result_availability':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(HistoryAvailability),
          ) as HistoryAvailability;
          result.resultAvailability = valueDes;
          break;
        case r'record_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                DocumentParseHistoryRecordResponseRecordTypeEnum),
          ) as DocumentParseHistoryRecordResponseRecordTypeEnum;
          result.recordType = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'document_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.documentId = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ImportStatus),
          ) as ImportStatus;
          result.status = valueDes;
          break;
        case r'source_format':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sourceFormat = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.version = valueDes;
          break;
        case r'error_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.errorCode = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DocumentParseHistoryRecordResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DocumentParseHistoryRecordResponseBuilder();
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

class DocumentParseHistoryRecordResponseRecordTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'document_parse')
  static const DocumentParseHistoryRecordResponseRecordTypeEnum documentParse =
      _$documentParseHistoryRecordResponseRecordTypeEnum_documentParse;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const DocumentParseHistoryRecordResponseRecordTypeEnum
      unknownDefaultOpenApi =
      _$documentParseHistoryRecordResponseRecordTypeEnum_unknownDefaultOpenApi;

  static Serializer<DocumentParseHistoryRecordResponseRecordTypeEnum>
      get serializer =>
          _$documentParseHistoryRecordResponseRecordTypeEnumSerializer;

  const DocumentParseHistoryRecordResponseRecordTypeEnum._(String name)
      : super(name);

  static BuiltSet<DocumentParseHistoryRecordResponseRecordTypeEnum>
      get values => _$documentParseHistoryRecordResponseRecordTypeEnumValues;
  static DocumentParseHistoryRecordResponseRecordTypeEnum valueOf(
          String name) =>
      _$documentParseHistoryRecordResponseRecordTypeEnumValueOf(name);
}
