// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parse_history_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ParseHistoryRecordResponseNextActionEnum
    _$parseHistoryRecordResponseNextActionEnum_none =
    const ParseHistoryRecordResponseNextActionEnum._('none');
const ParseHistoryRecordResponseNextActionEnum
    _$parseHistoryRecordResponseNextActionEnum_wait =
    const ParseHistoryRecordResponseNextActionEnum._('wait');
const ParseHistoryRecordResponseNextActionEnum
    _$parseHistoryRecordResponseNextActionEnum_refreshResult =
    const ParseHistoryRecordResponseNextActionEnum._('refreshResult');
const ParseHistoryRecordResponseNextActionEnum
    _$parseHistoryRecordResponseNextActionEnum_importFile =
    const ParseHistoryRecordResponseNextActionEnum._('importFile');
const ParseHistoryRecordResponseNextActionEnum
    _$parseHistoryRecordResponseNextActionEnum_unknownDefaultOpenApi =
    const ParseHistoryRecordResponseNextActionEnum._('unknownDefaultOpenApi');

ParseHistoryRecordResponseNextActionEnum
    _$parseHistoryRecordResponseNextActionEnumValueOf(String name) {
  switch (name) {
    case 'none':
      return _$parseHistoryRecordResponseNextActionEnum_none;
    case 'wait':
      return _$parseHistoryRecordResponseNextActionEnum_wait;
    case 'refreshResult':
      return _$parseHistoryRecordResponseNextActionEnum_refreshResult;
    case 'importFile':
      return _$parseHistoryRecordResponseNextActionEnum_importFile;
    case 'unknownDefaultOpenApi':
      return _$parseHistoryRecordResponseNextActionEnum_unknownDefaultOpenApi;
    default:
      return _$parseHistoryRecordResponseNextActionEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<ParseHistoryRecordResponseNextActionEnum>
    _$parseHistoryRecordResponseNextActionEnumValues = BuiltSet<
        ParseHistoryRecordResponseNextActionEnum>(const <ParseHistoryRecordResponseNextActionEnum>[
  _$parseHistoryRecordResponseNextActionEnum_none,
  _$parseHistoryRecordResponseNextActionEnum_wait,
  _$parseHistoryRecordResponseNextActionEnum_refreshResult,
  _$parseHistoryRecordResponseNextActionEnum_importFile,
  _$parseHistoryRecordResponseNextActionEnum_unknownDefaultOpenApi,
]);

const ParseHistoryRecordResponseRecordTypeEnum
    _$parseHistoryRecordResponseRecordTypeEnum_parse =
    const ParseHistoryRecordResponseRecordTypeEnum._('parse');
const ParseHistoryRecordResponseRecordTypeEnum
    _$parseHistoryRecordResponseRecordTypeEnum_unknownDefaultOpenApi =
    const ParseHistoryRecordResponseRecordTypeEnum._('unknownDefaultOpenApi');

ParseHistoryRecordResponseRecordTypeEnum
    _$parseHistoryRecordResponseRecordTypeEnumValueOf(String name) {
  switch (name) {
    case 'parse':
      return _$parseHistoryRecordResponseRecordTypeEnum_parse;
    case 'unknownDefaultOpenApi':
      return _$parseHistoryRecordResponseRecordTypeEnum_unknownDefaultOpenApi;
    default:
      return _$parseHistoryRecordResponseRecordTypeEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<ParseHistoryRecordResponseRecordTypeEnum>
    _$parseHistoryRecordResponseRecordTypeEnumValues = BuiltSet<
        ParseHistoryRecordResponseRecordTypeEnum>(const <ParseHistoryRecordResponseRecordTypeEnum>[
  _$parseHistoryRecordResponseRecordTypeEnum_parse,
  _$parseHistoryRecordResponseRecordTypeEnum_unknownDefaultOpenApi,
]);

Serializer<ParseHistoryRecordResponseNextActionEnum>
    _$parseHistoryRecordResponseNextActionEnumSerializer =
    _$ParseHistoryRecordResponseNextActionEnumSerializer();
Serializer<ParseHistoryRecordResponseRecordTypeEnum>
    _$parseHistoryRecordResponseRecordTypeEnumSerializer =
    _$ParseHistoryRecordResponseRecordTypeEnumSerializer();

class _$ParseHistoryRecordResponseNextActionEnumSerializer
    implements PrimitiveSerializer<ParseHistoryRecordResponseNextActionEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'none': 'none',
    'wait': 'wait',
    'refreshResult': 'refresh_result',
    'importFile': 'import_file',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'none': 'none',
    'wait': 'wait',
    'refresh_result': 'refreshResult',
    'import_file': 'importFile',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[
    ParseHistoryRecordResponseNextActionEnum
  ];
  @override
  final String wireName = 'ParseHistoryRecordResponseNextActionEnum';

  @override
  Object serialize(Serializers serializers,
          ParseHistoryRecordResponseNextActionEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ParseHistoryRecordResponseNextActionEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ParseHistoryRecordResponseNextActionEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ParseHistoryRecordResponseRecordTypeEnumSerializer
    implements PrimitiveSerializer<ParseHistoryRecordResponseRecordTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'parse': 'parse',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'parse': 'parse',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[
    ParseHistoryRecordResponseRecordTypeEnum
  ];
  @override
  final String wireName = 'ParseHistoryRecordResponseRecordTypeEnum';

  @override
  Object serialize(Serializers serializers,
          ParseHistoryRecordResponseRecordTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ParseHistoryRecordResponseRecordTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ParseHistoryRecordResponseRecordTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ParseHistoryRecordResponse extends ParseHistoryRecordResponse {
  @override
  final DateTime updatedAt;
  @override
  final HistoryStatusGroup statusGroup;
  @override
  final HistoryAvailability sourceAvailability;
  @override
  final HistoryAvailability resultAvailability;
  @override
  final String id;
  @override
  final int version;
  @override
  final IntentStatus status;
  @override
  final String? reasonCode;
  @override
  final IntentFailureResponse? failure;
  @override
  final ParseHistoryRecordResponseNextActionEnum? nextAction;
  @override
  final DateTime deadline;
  @override
  final String? inspectionId;
  @override
  final String? jobId;
  @override
  final DateTime createdAt;
  @override
  final String? title;
  @override
  final ParseHistoryRecordResponseRecordTypeEnum recordType;

  factory _$ParseHistoryRecordResponse(
          [void Function(ParseHistoryRecordResponseBuilder)? updates]) =>
      (ParseHistoryRecordResponseBuilder()..update(updates))._build();

  _$ParseHistoryRecordResponse._(
      {required this.updatedAt,
      required this.statusGroup,
      required this.sourceAvailability,
      required this.resultAvailability,
      required this.id,
      required this.version,
      required this.status,
      this.reasonCode,
      this.failure,
      this.nextAction,
      required this.deadline,
      this.inspectionId,
      this.jobId,
      required this.createdAt,
      this.title,
      required this.recordType})
      : super._();
  @override
  ParseHistoryRecordResponse rebuild(
          void Function(ParseHistoryRecordResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ParseHistoryRecordResponseBuilder toBuilder() =>
      ParseHistoryRecordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ParseHistoryRecordResponse &&
        updatedAt == other.updatedAt &&
        statusGroup == other.statusGroup &&
        sourceAvailability == other.sourceAvailability &&
        resultAvailability == other.resultAvailability &&
        id == other.id &&
        version == other.version &&
        status == other.status &&
        reasonCode == other.reasonCode &&
        failure == other.failure &&
        nextAction == other.nextAction &&
        deadline == other.deadline &&
        inspectionId == other.inspectionId &&
        jobId == other.jobId &&
        createdAt == other.createdAt &&
        title == other.title &&
        recordType == other.recordType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, statusGroup.hashCode);
    _$hash = $jc(_$hash, sourceAvailability.hashCode);
    _$hash = $jc(_$hash, resultAvailability.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, reasonCode.hashCode);
    _$hash = $jc(_$hash, failure.hashCode);
    _$hash = $jc(_$hash, nextAction.hashCode);
    _$hash = $jc(_$hash, deadline.hashCode);
    _$hash = $jc(_$hash, inspectionId.hashCode);
    _$hash = $jc(_$hash, jobId.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, recordType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ParseHistoryRecordResponse')
          ..add('updatedAt', updatedAt)
          ..add('statusGroup', statusGroup)
          ..add('sourceAvailability', sourceAvailability)
          ..add('resultAvailability', resultAvailability)
          ..add('id', id)
          ..add('version', version)
          ..add('status', status)
          ..add('reasonCode', reasonCode)
          ..add('failure', failure)
          ..add('nextAction', nextAction)
          ..add('deadline', deadline)
          ..add('inspectionId', inspectionId)
          ..add('jobId', jobId)
          ..add('createdAt', createdAt)
          ..add('title', title)
          ..add('recordType', recordType))
        .toString();
  }
}

class ParseHistoryRecordResponseBuilder
    implements
        Builder<ParseHistoryRecordResponse, ParseHistoryRecordResponseBuilder> {
  _$ParseHistoryRecordResponse? _$v;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  HistoryStatusGroup? _statusGroup;
  HistoryStatusGroup? get statusGroup => _$this._statusGroup;
  set statusGroup(HistoryStatusGroup? statusGroup) =>
      _$this._statusGroup = statusGroup;

  HistoryAvailability? _sourceAvailability;
  HistoryAvailability? get sourceAvailability => _$this._sourceAvailability;
  set sourceAvailability(HistoryAvailability? sourceAvailability) =>
      _$this._sourceAvailability = sourceAvailability;

  HistoryAvailability? _resultAvailability;
  HistoryAvailability? get resultAvailability => _$this._resultAvailability;
  set resultAvailability(HistoryAvailability? resultAvailability) =>
      _$this._resultAvailability = resultAvailability;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _version;
  int? get version => _$this._version;
  set version(int? version) => _$this._version = version;

  IntentStatus? _status;
  IntentStatus? get status => _$this._status;
  set status(IntentStatus? status) => _$this._status = status;

  String? _reasonCode;
  String? get reasonCode => _$this._reasonCode;
  set reasonCode(String? reasonCode) => _$this._reasonCode = reasonCode;

  IntentFailureResponseBuilder? _failure;
  IntentFailureResponseBuilder get failure =>
      _$this._failure ??= IntentFailureResponseBuilder();
  set failure(IntentFailureResponseBuilder? failure) =>
      _$this._failure = failure;

  ParseHistoryRecordResponseNextActionEnum? _nextAction;
  ParseHistoryRecordResponseNextActionEnum? get nextAction =>
      _$this._nextAction;
  set nextAction(ParseHistoryRecordResponseNextActionEnum? nextAction) =>
      _$this._nextAction = nextAction;

  DateTime? _deadline;
  DateTime? get deadline => _$this._deadline;
  set deadline(DateTime? deadline) => _$this._deadline = deadline;

  String? _inspectionId;
  String? get inspectionId => _$this._inspectionId;
  set inspectionId(String? inspectionId) => _$this._inspectionId = inspectionId;

  String? _jobId;
  String? get jobId => _$this._jobId;
  set jobId(String? jobId) => _$this._jobId = jobId;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ParseHistoryRecordResponseRecordTypeEnum? _recordType;
  ParseHistoryRecordResponseRecordTypeEnum? get recordType =>
      _$this._recordType;
  set recordType(ParseHistoryRecordResponseRecordTypeEnum? recordType) =>
      _$this._recordType = recordType;

  ParseHistoryRecordResponseBuilder() {
    ParseHistoryRecordResponse._defaults(this);
  }

  ParseHistoryRecordResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _updatedAt = $v.updatedAt;
      _statusGroup = $v.statusGroup;
      _sourceAvailability = $v.sourceAvailability;
      _resultAvailability = $v.resultAvailability;
      _id = $v.id;
      _version = $v.version;
      _status = $v.status;
      _reasonCode = $v.reasonCode;
      _failure = $v.failure?.toBuilder();
      _nextAction = $v.nextAction;
      _deadline = $v.deadline;
      _inspectionId = $v.inspectionId;
      _jobId = $v.jobId;
      _createdAt = $v.createdAt;
      _title = $v.title;
      _recordType = $v.recordType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ParseHistoryRecordResponse other) {
    _$v = other as _$ParseHistoryRecordResponse;
  }

  @override
  void update(void Function(ParseHistoryRecordResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ParseHistoryRecordResponse build() => _build();

  _$ParseHistoryRecordResponse _build() {
    _$ParseHistoryRecordResponse _$result;
    try {
      _$result = _$v ??
          _$ParseHistoryRecordResponse._(
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'ParseHistoryRecordResponse', 'updatedAt'),
            statusGroup: BuiltValueNullFieldError.checkNotNull(
                statusGroup, r'ParseHistoryRecordResponse', 'statusGroup'),
            sourceAvailability: BuiltValueNullFieldError.checkNotNull(
                sourceAvailability,
                r'ParseHistoryRecordResponse',
                'sourceAvailability'),
            resultAvailability: BuiltValueNullFieldError.checkNotNull(
                resultAvailability,
                r'ParseHistoryRecordResponse',
                'resultAvailability'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ParseHistoryRecordResponse', 'id'),
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'ParseHistoryRecordResponse', 'version'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'ParseHistoryRecordResponse', 'status'),
            reasonCode: reasonCode,
            failure: _failure?.build(),
            nextAction: nextAction,
            deadline: BuiltValueNullFieldError.checkNotNull(
                deadline, r'ParseHistoryRecordResponse', 'deadline'),
            inspectionId: inspectionId,
            jobId: jobId,
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'ParseHistoryRecordResponse', 'createdAt'),
            title: title,
            recordType: BuiltValueNullFieldError.checkNotNull(
                recordType, r'ParseHistoryRecordResponse', 'recordType'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'failure';
        _failure?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ParseHistoryRecordResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
