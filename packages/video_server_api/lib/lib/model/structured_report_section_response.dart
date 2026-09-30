//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/video_article_evidence_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'structured_report_section_response.g.dart';

/// StructuredReportSectionResponse
///
/// Properties:
/// * [id]
/// * [heading]
/// * [body]
/// * [items]
/// * [evidence]
@BuiltValue()
abstract class StructuredReportSectionResponse
    implements
        Built<StructuredReportSectionResponse,
            StructuredReportSectionResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'heading')
  String get heading;

  @BuiltValueField(wireName: r'body')
  String get body;

  @BuiltValueField(wireName: r'items')
  BuiltList<String> get items;

  @BuiltValueField(wireName: r'evidence')
  BuiltList<VideoArticleEvidenceResponse> get evidence;

  StructuredReportSectionResponse._();

  factory StructuredReportSectionResponse(
          [void updates(StructuredReportSectionResponseBuilder b)]) =
      _$StructuredReportSectionResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StructuredReportSectionResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StructuredReportSectionResponse> get serializer =>
      _$StructuredReportSectionResponseSerializer();
}

class _$StructuredReportSectionResponseSerializer
    implements PrimitiveSerializer<StructuredReportSectionResponse> {
  @override
  final Iterable<Type> types = const [
    StructuredReportSectionResponse,
    _$StructuredReportSectionResponse
  ];

  @override
  final String wireName = r'StructuredReportSectionResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StructuredReportSectionResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'heading';
    yield serializers.serialize(
      object.heading,
      specifiedType: const FullType(String),
    );
    yield r'body';
    yield serializers.serialize(
      object.body,
      specifiedType: const FullType(String),
    );
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'evidence';
    yield serializers.serialize(
      object.evidence,
      specifiedType:
          const FullType(BuiltList, [FullType(VideoArticleEvidenceResponse)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    StructuredReportSectionResponse object, {
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
    required StructuredReportSectionResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'heading':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.heading = valueDes;
          break;
        case r'body':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.body = valueDes;
          break;
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.items.replace(valueDes);
          break;
        case r'evidence':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(VideoArticleEvidenceResponse)]),
          ) as BuiltList<VideoArticleEvidenceResponse>;
          result.evidence.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StructuredReportSectionResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StructuredReportSectionResponseBuilder();
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
