//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/analysis_analytics_daily_response.dart';
import 'package:video_server_api/lib/model/analysis_analytics_input_response.dart';
import 'package:video_server_api/lib/model/analysis_analytics_summary_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'analysis_analytics_response.g.dart';

/// AnalysisAnalyticsResponse
///
/// Properties:
/// * [periodDays]
/// * [start] - UTC 窗口起始日零时，含此时刻。
/// * [end] - 查询时刻，含此时刻。
/// * [summary]
/// * [daily]
/// * [inputs]
@BuiltValue()
abstract class AnalysisAnalyticsResponse
    implements
        Built<AnalysisAnalyticsResponse, AnalysisAnalyticsResponseBuilder> {
  @BuiltValueField(wireName: r'period_days')
  int get periodDays;

  /// UTC 窗口起始日零时，含此时刻。
  @BuiltValueField(wireName: r'start')
  DateTime get start;

  /// 查询时刻，含此时刻。
  @BuiltValueField(wireName: r'end')
  DateTime get end;

  @BuiltValueField(wireName: r'summary')
  AnalysisAnalyticsSummaryResponse get summary;

  @BuiltValueField(wireName: r'daily')
  BuiltList<AnalysisAnalyticsDailyResponse> get daily;

  @BuiltValueField(wireName: r'inputs')
  BuiltList<AnalysisAnalyticsInputResponse> get inputs;

  AnalysisAnalyticsResponse._();

  factory AnalysisAnalyticsResponse(
          [void updates(AnalysisAnalyticsResponseBuilder b)]) =
      _$AnalysisAnalyticsResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AnalysisAnalyticsResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AnalysisAnalyticsResponse> get serializer =>
      _$AnalysisAnalyticsResponseSerializer();
}

class _$AnalysisAnalyticsResponseSerializer
    implements PrimitiveSerializer<AnalysisAnalyticsResponse> {
  @override
  final Iterable<Type> types = const [
    AnalysisAnalyticsResponse,
    _$AnalysisAnalyticsResponse
  ];

  @override
  final String wireName = r'AnalysisAnalyticsResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AnalysisAnalyticsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'period_days';
    yield serializers.serialize(
      object.periodDays,
      specifiedType: const FullType(int),
    );
    yield r'start';
    yield serializers.serialize(
      object.start,
      specifiedType: const FullType(DateTime),
    );
    yield r'end';
    yield serializers.serialize(
      object.end,
      specifiedType: const FullType(DateTime),
    );
    yield r'summary';
    yield serializers.serialize(
      object.summary,
      specifiedType: const FullType(AnalysisAnalyticsSummaryResponse),
    );
    yield r'daily';
    yield serializers.serialize(
      object.daily,
      specifiedType:
          const FullType(BuiltList, [FullType(AnalysisAnalyticsDailyResponse)]),
    );
    yield r'inputs';
    yield serializers.serialize(
      object.inputs,
      specifiedType:
          const FullType(BuiltList, [FullType(AnalysisAnalyticsInputResponse)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AnalysisAnalyticsResponse object, {
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
    required AnalysisAnalyticsResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'period_days':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.periodDays = valueDes;
          break;
        case r'start':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.start = valueDes;
          break;
        case r'end':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.end = valueDes;
          break;
        case r'summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AnalysisAnalyticsSummaryResponse),
          ) as AnalysisAnalyticsSummaryResponse;
          result.summary.replace(valueDes);
          break;
        case r'daily':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(AnalysisAnalyticsDailyResponse)]),
          ) as BuiltList<AnalysisAnalyticsDailyResponse>;
          result.daily.replace(valueDes);
          break;
        case r'inputs':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(AnalysisAnalyticsInputResponse)]),
          ) as BuiltList<AnalysisAnalyticsInputResponse>;
          result.inputs.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AnalysisAnalyticsResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnalysisAnalyticsResponseBuilder();
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
