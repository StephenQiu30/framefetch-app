//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'analysis_request.g.dart';

/// AnalysisRequest
///
/// Properties:
/// * [skillId] - 由分析 Skill 清单提供的稳定任务标识。
/// * [outputLanguage] - 结果语言；本项目支持 zh-CN 和 en-US。
/// * [customPrompt] - 可编辑的任务要求；不能覆盖来源、安全、工具或结果结构。
@BuiltValue()
abstract class AnalysisRequest
    implements Built<AnalysisRequest, AnalysisRequestBuilder> {
  /// 由分析 Skill 清单提供的稳定任务标识。
  @BuiltValueField(wireName: r'skill_id')
  String get skillId;

  /// 结果语言；本项目支持 zh-CN 和 en-US。
  @BuiltValueField(wireName: r'output_language')
  String get outputLanguage;

  /// 可编辑的任务要求；不能覆盖来源、安全、工具或结果结构。
  @BuiltValueField(wireName: r'custom_prompt')
  String? get customPrompt;

  AnalysisRequest._();

  factory AnalysisRequest([void updates(AnalysisRequestBuilder b)]) =
      _$AnalysisRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AnalysisRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AnalysisRequest> get serializer =>
      _$AnalysisRequestSerializer();
}

class _$AnalysisRequestSerializer
    implements PrimitiveSerializer<AnalysisRequest> {
  @override
  final Iterable<Type> types = const [AnalysisRequest, _$AnalysisRequest];

  @override
  final String wireName = r'AnalysisRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AnalysisRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'skill_id';
    yield serializers.serialize(
      object.skillId,
      specifiedType: const FullType(String),
    );
    yield r'output_language';
    yield serializers.serialize(
      object.outputLanguage,
      specifiedType: const FullType(String),
    );
    if (object.customPrompt != null) {
      yield r'custom_prompt';
      yield serializers.serialize(
        object.customPrompt,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AnalysisRequest object, {
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
    required AnalysisRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'skill_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.skillId = valueDes;
          break;
        case r'output_language':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.outputLanguage = valueDes;
          break;
        case r'custom_prompt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.customPrompt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AnalysisRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnalysisRequestBuilder();
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
