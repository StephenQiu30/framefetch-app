//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'history_availability.g.dart';

class HistoryAvailability extends EnumClass {
  @BuiltValueEnumConst(wireName: r'available')
  static const HistoryAvailability available = _$available;
  @BuiltValueEnumConst(wireName: r'unavailable')
  static const HistoryAvailability unavailable = _$unavailable;
  @BuiltValueEnumConst(wireName: r'unknown')
  static const HistoryAvailability unknown = _$unknown;
  @BuiltValueEnumConst(wireName: r'not_applicable')
  static const HistoryAvailability notApplicable = _$notApplicable;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const HistoryAvailability unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<HistoryAvailability> get serializer =>
      _$historyAvailabilitySerializer;

  const HistoryAvailability._(String name) : super(name);

  static BuiltSet<HistoryAvailability> get values => _$values;
  static HistoryAvailability valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class HistoryAvailabilityMixin = Object
    with _$HistoryAvailabilityMixin;
