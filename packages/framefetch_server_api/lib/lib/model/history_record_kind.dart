//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'history_record_kind.g.dart';

class HistoryRecordKind extends EnumClass {
  @BuiltValueEnumConst(wireName: r'parse')
  static const HistoryRecordKind parse = _$parse;
  @BuiltValueEnumConst(wireName: r'video_analysis')
  static const HistoryRecordKind videoAnalysis = _$videoAnalysis;
  @BuiltValueEnumConst(wireName: r'document_parse')
  static const HistoryRecordKind documentParse = _$documentParse;
  @BuiltValueEnumConst(wireName: r'screenplay_analysis')
  static const HistoryRecordKind screenplayAnalysis = _$screenplayAnalysis;
  @BuiltValueEnumConst(wireName: r'content_creation')
  static const HistoryRecordKind contentCreation = _$contentCreation;
  @BuiltValueEnumConst(wireName: r'skill_analysis')
  static const HistoryRecordKind skillAnalysis = _$skillAnalysis;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const HistoryRecordKind unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<HistoryRecordKind> get serializer =>
      _$historyRecordKindSerializer;

  const HistoryRecordKind._(String name) : super(name);

  static BuiltSet<HistoryRecordKind> get values => _$values;
  static HistoryRecordKind valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class HistoryRecordKindMixin = Object with _$HistoryRecordKindMixin;
