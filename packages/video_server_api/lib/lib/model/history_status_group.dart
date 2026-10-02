//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'history_status_group.g.dart';

class HistoryStatusGroup extends EnumClass {
  @BuiltValueEnumConst(wireName: r'processing')
  static const HistoryStatusGroup processing = _$processing;
  @BuiltValueEnumConst(wireName: r'completed')
  static const HistoryStatusGroup completed = _$completed;
  @BuiltValueEnumConst(wireName: r'failed')
  static const HistoryStatusGroup failed = _$failed;
  @BuiltValueEnumConst(wireName: r'cancelled')
  static const HistoryStatusGroup cancelled = _$cancelled;
  @BuiltValueEnumConst(wireName: r'expired')
  static const HistoryStatusGroup expired = _$expired;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const HistoryStatusGroup unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<HistoryStatusGroup> get serializer =>
      _$historyStatusGroupSerializer;

  const HistoryStatusGroup._(String name) : super(name);

  static BuiltSet<HistoryStatusGroup> get values => _$values;
  static HistoryStatusGroup valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class HistoryStatusGroupMixin = Object with _$HistoryStatusGroupMixin;
