//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:framefetch_server_api/lib/model/analysis_run_history_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'analysis_run_history_page_response.g.dart';

/// AnalysisRunHistoryPageResponse
///
/// Properties:
/// * [items]
/// * [nextBeforeRunNo]
@BuiltValue()
abstract class AnalysisRunHistoryPageResponse
    implements
        Built<AnalysisRunHistoryPageResponse,
            AnalysisRunHistoryPageResponseBuilder> {
  @BuiltValueField(wireName: r'items')
  BuiltList<AnalysisRunHistoryResponse> get items;

  @BuiltValueField(wireName: r'next_before_run_no')
  int? get nextBeforeRunNo;

  AnalysisRunHistoryPageResponse._();

  factory AnalysisRunHistoryPageResponse(
          [void updates(AnalysisRunHistoryPageResponseBuilder b)]) =
      _$AnalysisRunHistoryPageResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AnalysisRunHistoryPageResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AnalysisRunHistoryPageResponse> get serializer =>
      _$AnalysisRunHistoryPageResponseSerializer();
}

class _$AnalysisRunHistoryPageResponseSerializer
    implements PrimitiveSerializer<AnalysisRunHistoryPageResponse> {
  @override
  final Iterable<Type> types = const [
    AnalysisRunHistoryPageResponse,
    _$AnalysisRunHistoryPageResponse
  ];

  @override
  final String wireName = r'AnalysisRunHistoryPageResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AnalysisRunHistoryPageResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType:
          const FullType(BuiltList, [FullType(AnalysisRunHistoryResponse)]),
    );
    yield r'next_before_run_no';
    yield object.nextBeforeRunNo == null
        ? null
        : serializers.serialize(
            object.nextBeforeRunNo,
            specifiedType: const FullType.nullable(int),
          );
  }

  @override
  Object serialize(
    Serializers serializers,
    AnalysisRunHistoryPageResponse object, {
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
    required AnalysisRunHistoryPageResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(AnalysisRunHistoryResponse)]),
          ) as BuiltList<AnalysisRunHistoryResponse>;
          result.items.replace(valueDes);
          break;
        case r'next_before_run_no':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.nextBeforeRunNo = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AnalysisRunHistoryPageResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnalysisRunHistoryPageResponseBuilder();
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
