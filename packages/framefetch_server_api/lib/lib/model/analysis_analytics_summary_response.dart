//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'analysis_analytics_summary_response.g.dart';

/// AnalysisAnalyticsSummaryResponse
///
/// Properties:
/// * [total] - 保留的分析执行次数，不代表模型请求次数。
/// * [succeeded]
/// * [failed]
/// * [cancelled]
/// * [active] - queued、running、retry_wait 的执行数量。
/// * [averageDurationSeconds] - 终态执行的 finished_at-started_at 均值，包含重试与发布；只纳入两时间齐全且非负的样本，没有有效样本时为 null。
/// * [completedDurationCount] - 平均执行耗时的有效终态样本数。
@BuiltValue()
abstract class AnalysisAnalyticsSummaryResponse
    implements
        Built<AnalysisAnalyticsSummaryResponse,
            AnalysisAnalyticsSummaryResponseBuilder> {
  /// 保留的分析执行次数，不代表模型请求次数。
  @BuiltValueField(wireName: r'total')
  int get total;

  @BuiltValueField(wireName: r'succeeded')
  int get succeeded;

  @BuiltValueField(wireName: r'failed')
  int get failed;

  @BuiltValueField(wireName: r'cancelled')
  int get cancelled;

  /// queued、running、retry_wait 的执行数量。
  @BuiltValueField(wireName: r'active')
  int get active;

  /// 终态执行的 finished_at-started_at 均值，包含重试与发布；只纳入两时间齐全且非负的样本，没有有效样本时为 null。
  @BuiltValueField(wireName: r'average_duration_seconds')
  num? get averageDurationSeconds;

  /// 平均执行耗时的有效终态样本数。
  @BuiltValueField(wireName: r'completed_duration_count')
  int get completedDurationCount;

  AnalysisAnalyticsSummaryResponse._();

  factory AnalysisAnalyticsSummaryResponse(
          [void updates(AnalysisAnalyticsSummaryResponseBuilder b)]) =
      _$AnalysisAnalyticsSummaryResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AnalysisAnalyticsSummaryResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AnalysisAnalyticsSummaryResponse> get serializer =>
      _$AnalysisAnalyticsSummaryResponseSerializer();
}

class _$AnalysisAnalyticsSummaryResponseSerializer
    implements PrimitiveSerializer<AnalysisAnalyticsSummaryResponse> {
  @override
  final Iterable<Type> types = const [
    AnalysisAnalyticsSummaryResponse,
    _$AnalysisAnalyticsSummaryResponse
  ];

  @override
  final String wireName = r'AnalysisAnalyticsSummaryResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AnalysisAnalyticsSummaryResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'total';
    yield serializers.serialize(
      object.total,
      specifiedType: const FullType(int),
    );
    yield r'succeeded';
    yield serializers.serialize(
      object.succeeded,
      specifiedType: const FullType(int),
    );
    yield r'failed';
    yield serializers.serialize(
      object.failed,
      specifiedType: const FullType(int),
    );
    yield r'cancelled';
    yield serializers.serialize(
      object.cancelled,
      specifiedType: const FullType(int),
    );
    yield r'active';
    yield serializers.serialize(
      object.active,
      specifiedType: const FullType(int),
    );
    yield r'average_duration_seconds';
    yield object.averageDurationSeconds == null
        ? null
        : serializers.serialize(
            object.averageDurationSeconds,
            specifiedType: const FullType.nullable(num),
          );
    yield r'completed_duration_count';
    yield serializers.serialize(
      object.completedDurationCount,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AnalysisAnalyticsSummaryResponse object, {
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
    required AnalysisAnalyticsSummaryResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        case r'succeeded':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.succeeded = valueDes;
          break;
        case r'failed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.failed = valueDes;
          break;
        case r'cancelled':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.cancelled = valueDes;
          break;
        case r'active':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.active = valueDes;
          break;
        case r'average_duration_seconds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.averageDurationSeconds = valueDes;
          break;
        case r'completed_duration_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.completedDurationCount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AnalysisAnalyticsSummaryResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnalysisAnalyticsSummaryResponseBuilder();
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
