//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'analysis_report_status.g.dart';

class AnalysisReportStatus extends EnumClass {
  @BuiltValueEnumConst(wireName: r'validated')
  static const AnalysisReportStatus validated = _$validated;
  @BuiltValueEnumConst(wireName: r'publishing')
  static const AnalysisReportStatus publishing = _$publishing;
  @BuiltValueEnumConst(wireName: r'available')
  static const AnalysisReportStatus available = _$available;
  @BuiltValueEnumConst(wireName: r'publish_failed')
  static const AnalysisReportStatus publishFailed = _$publishFailed;
  @BuiltValueEnumConst(wireName: r'delete_pending')
  static const AnalysisReportStatus deletePending = _$deletePending;
  @BuiltValueEnumConst(wireName: r'deleted')
  static const AnalysisReportStatus deleted = _$deleted;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const AnalysisReportStatus unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<AnalysisReportStatus> get serializer =>
      _$analysisReportStatusSerializer;

  const AnalysisReportStatus._(String name) : super(name);

  static BuiltSet<AnalysisReportStatus> get values => _$values;
  static AnalysisReportStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class AnalysisReportStatusMixin = Object
    with _$AnalysisReportStatusMixin;
