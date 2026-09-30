// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_report_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AnalysisReportStatus _$validated =
    const AnalysisReportStatus._('validated');
const AnalysisReportStatus _$publishing =
    const AnalysisReportStatus._('publishing');
const AnalysisReportStatus _$available =
    const AnalysisReportStatus._('available');
const AnalysisReportStatus _$publishFailed =
    const AnalysisReportStatus._('publishFailed');
const AnalysisReportStatus _$deletePending =
    const AnalysisReportStatus._('deletePending');
const AnalysisReportStatus _$deleted = const AnalysisReportStatus._('deleted');
const AnalysisReportStatus _$unknownDefaultOpenApi =
    const AnalysisReportStatus._('unknownDefaultOpenApi');

AnalysisReportStatus _$valueOf(String name) {
  switch (name) {
    case 'validated':
      return _$validated;
    case 'publishing':
      return _$publishing;
    case 'available':
      return _$available;
    case 'publishFailed':
      return _$publishFailed;
    case 'deletePending':
      return _$deletePending;
    case 'deleted':
      return _$deleted;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<AnalysisReportStatus> _$values =
    BuiltSet<AnalysisReportStatus>(const <AnalysisReportStatus>[
  _$validated,
  _$publishing,
  _$available,
  _$publishFailed,
  _$deletePending,
  _$deleted,
  _$unknownDefaultOpenApi,
]);

class _$AnalysisReportStatusMeta {
  const _$AnalysisReportStatusMeta();
  AnalysisReportStatus get validated => _$validated;
  AnalysisReportStatus get publishing => _$publishing;
  AnalysisReportStatus get available => _$available;
  AnalysisReportStatus get publishFailed => _$publishFailed;
  AnalysisReportStatus get deletePending => _$deletePending;
  AnalysisReportStatus get deleted => _$deleted;
  AnalysisReportStatus get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  AnalysisReportStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<AnalysisReportStatus> get values => _$values;
}

mixin _$AnalysisReportStatusMixin {
  // ignore: non_constant_identifier_names
  _$AnalysisReportStatusMeta get AnalysisReportStatus =>
      const _$AnalysisReportStatusMeta();
}

Serializer<AnalysisReportStatus> _$analysisReportStatusSerializer =
    _$AnalysisReportStatusSerializer();

class _$AnalysisReportStatusSerializer
    implements PrimitiveSerializer<AnalysisReportStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'validated': 'validated',
    'publishing': 'publishing',
    'available': 'available',
    'publishFailed': 'publish_failed',
    'deletePending': 'delete_pending',
    'deleted': 'deleted',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'validated': 'validated',
    'publishing': 'publishing',
    'available': 'available',
    'publish_failed': 'publishFailed',
    'delete_pending': 'deletePending',
    'deleted': 'deleted',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[AnalysisReportStatus];
  @override
  final String wireName = 'AnalysisReportStatus';

  @override
  Object serialize(Serializers serializers, AnalysisReportStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AnalysisReportStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AnalysisReportStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
