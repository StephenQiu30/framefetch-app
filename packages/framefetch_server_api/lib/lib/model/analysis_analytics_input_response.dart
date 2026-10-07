//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:framefetch_server_api/lib/model/analysis_input_kind.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'analysis_analytics_input_response.g.dart';

/// AnalysisAnalyticsInputResponse
///
/// Properties:
/// * [inputKind]
/// * [total]
@BuiltValue()
abstract class AnalysisAnalyticsInputResponse
    implements
        Built<AnalysisAnalyticsInputResponse,
            AnalysisAnalyticsInputResponseBuilder> {
  @BuiltValueField(wireName: r'input_kind')
  AnalysisInputKind get inputKind;
  // enum inputKindEnum {  video,  screenplay,  content,  skill,  };

  @BuiltValueField(wireName: r'total')
  int get total;

  AnalysisAnalyticsInputResponse._();

  factory AnalysisAnalyticsInputResponse(
          [void updates(AnalysisAnalyticsInputResponseBuilder b)]) =
      _$AnalysisAnalyticsInputResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AnalysisAnalyticsInputResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AnalysisAnalyticsInputResponse> get serializer =>
      _$AnalysisAnalyticsInputResponseSerializer();
}

class _$AnalysisAnalyticsInputResponseSerializer
    implements PrimitiveSerializer<AnalysisAnalyticsInputResponse> {
  @override
  final Iterable<Type> types = const [
    AnalysisAnalyticsInputResponse,
    _$AnalysisAnalyticsInputResponse
  ];

  @override
  final String wireName = r'AnalysisAnalyticsInputResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AnalysisAnalyticsInputResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'input_kind';
    yield serializers.serialize(
      object.inputKind,
      specifiedType: const FullType(AnalysisInputKind),
    );
    yield r'total';
    yield serializers.serialize(
      object.total,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AnalysisAnalyticsInputResponse object, {
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
    required AnalysisAnalyticsInputResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'input_kind':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AnalysisInputKind),
          ) as AnalysisInputKind;
          result.inputKind = valueDes;
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AnalysisAnalyticsInputResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnalysisAnalyticsInputResponseBuilder();
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
