//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'structured_report_citation_response.g.dart';

/// StructuredReportCitationResponse
///
/// Properties:
/// * [sourceSha256]
/// * [start]
/// * [end]
/// * [quote]
@BuiltValue()
abstract class StructuredReportCitationResponse
    implements
        Built<StructuredReportCitationResponse,
            StructuredReportCitationResponseBuilder> {
  @BuiltValueField(wireName: r'source_sha256')
  String get sourceSha256;

  @BuiltValueField(wireName: r'start')
  int get start;

  @BuiltValueField(wireName: r'end')
  int get end;

  @BuiltValueField(wireName: r'quote')
  String get quote;

  StructuredReportCitationResponse._();

  factory StructuredReportCitationResponse(
          [void updates(StructuredReportCitationResponseBuilder b)]) =
      _$StructuredReportCitationResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StructuredReportCitationResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StructuredReportCitationResponse> get serializer =>
      _$StructuredReportCitationResponseSerializer();
}

class _$StructuredReportCitationResponseSerializer
    implements PrimitiveSerializer<StructuredReportCitationResponse> {
  @override
  final Iterable<Type> types = const [
    StructuredReportCitationResponse,
    _$StructuredReportCitationResponse
  ];

  @override
  final String wireName = r'StructuredReportCitationResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StructuredReportCitationResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'source_sha256';
    yield serializers.serialize(
      object.sourceSha256,
      specifiedType: const FullType(String),
    );
    yield r'start';
    yield serializers.serialize(
      object.start,
      specifiedType: const FullType(int),
    );
    yield r'end';
    yield serializers.serialize(
      object.end,
      specifiedType: const FullType(int),
    );
    yield r'quote';
    yield serializers.serialize(
      object.quote,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    StructuredReportCitationResponse object, {
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
    required StructuredReportCitationResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'source_sha256':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sourceSha256 = valueDes;
          break;
        case r'start':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.start = valueDes;
          break;
        case r'end':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.end = valueDes;
          break;
        case r'quote':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.quote = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StructuredReportCitationResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StructuredReportCitationResponseBuilder();
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
