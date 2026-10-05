//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/content_finding.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'content_review.g.dart';

/// ContentReview
///
/// Properties:
/// * [needsMaterial]
/// * [findings]
@BuiltValue()
abstract class ContentReview
    implements Built<ContentReview, ContentReviewBuilder> {
  @BuiltValueField(wireName: r'needs_material')
  bool get needsMaterial;

  @BuiltValueField(wireName: r'findings')
  BuiltList<ContentFinding> get findings;

  ContentReview._();

  factory ContentReview([void updates(ContentReviewBuilder b)]) =
      _$ContentReview;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ContentReviewBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ContentReview> get serializer =>
      _$ContentReviewSerializer();
}

class _$ContentReviewSerializer implements PrimitiveSerializer<ContentReview> {
  @override
  final Iterable<Type> types = const [ContentReview, _$ContentReview];

  @override
  final String wireName = r'ContentReview';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ContentReview object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'needs_material';
    yield serializers.serialize(
      object.needsMaterial,
      specifiedType: const FullType(bool),
    );
    yield r'findings';
    yield serializers.serialize(
      object.findings,
      specifiedType: const FullType(BuiltList, [FullType(ContentFinding)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ContentReview object, {
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
    required ContentReviewBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'needs_material':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.needsMaterial = valueDes;
          break;
        case r'findings':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(ContentFinding)]),
          ) as BuiltList<ContentFinding>;
          result.findings.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ContentReview deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ContentReviewBuilder();
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
