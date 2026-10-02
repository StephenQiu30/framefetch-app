// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_log_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const OperationLogResponseOutcomeEnum
    _$operationLogResponseOutcomeEnum_started =
    const OperationLogResponseOutcomeEnum._('started');
const OperationLogResponseOutcomeEnum
    _$operationLogResponseOutcomeEnum_succeeded =
    const OperationLogResponseOutcomeEnum._('succeeded');
const OperationLogResponseOutcomeEnum _$operationLogResponseOutcomeEnum_failed =
    const OperationLogResponseOutcomeEnum._('failed');
const OperationLogResponseOutcomeEnum
    _$operationLogResponseOutcomeEnum_unknownDefaultOpenApi =
    const OperationLogResponseOutcomeEnum._('unknownDefaultOpenApi');

OperationLogResponseOutcomeEnum _$operationLogResponseOutcomeEnumValueOf(
    String name) {
  switch (name) {
    case 'started':
      return _$operationLogResponseOutcomeEnum_started;
    case 'succeeded':
      return _$operationLogResponseOutcomeEnum_succeeded;
    case 'failed':
      return _$operationLogResponseOutcomeEnum_failed;
    case 'unknownDefaultOpenApi':
      return _$operationLogResponseOutcomeEnum_unknownDefaultOpenApi;
    default:
      return _$operationLogResponseOutcomeEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<OperationLogResponseOutcomeEnum>
    _$operationLogResponseOutcomeEnumValues = BuiltSet<
        OperationLogResponseOutcomeEnum>(const <OperationLogResponseOutcomeEnum>[
  _$operationLogResponseOutcomeEnum_started,
  _$operationLogResponseOutcomeEnum_succeeded,
  _$operationLogResponseOutcomeEnum_failed,
  _$operationLogResponseOutcomeEnum_unknownDefaultOpenApi,
]);

const OperationLogResponseSource_Enum _$operationLogResponseSourceEnum_request =
    const OperationLogResponseSource_Enum._('request');
const OperationLogResponseSource_Enum _$operationLogResponseSourceEnum_task =
    const OperationLogResponseSource_Enum._('task');
const OperationLogResponseSource_Enum
    _$operationLogResponseSourceEnum_unknownDefaultOpenApi =
    const OperationLogResponseSource_Enum._('unknownDefaultOpenApi');

OperationLogResponseSource_Enum _$operationLogResponseSourceEnumValueOf(
    String name) {
  switch (name) {
    case 'request':
      return _$operationLogResponseSourceEnum_request;
    case 'task':
      return _$operationLogResponseSourceEnum_task;
    case 'unknownDefaultOpenApi':
      return _$operationLogResponseSourceEnum_unknownDefaultOpenApi;
    default:
      return _$operationLogResponseSourceEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<OperationLogResponseSource_Enum>
    _$operationLogResponseSourceEnumValues = BuiltSet<
        OperationLogResponseSource_Enum>(const <OperationLogResponseSource_Enum>[
  _$operationLogResponseSourceEnum_request,
  _$operationLogResponseSourceEnum_task,
  _$operationLogResponseSourceEnum_unknownDefaultOpenApi,
]);

Serializer<OperationLogResponseOutcomeEnum>
    _$operationLogResponseOutcomeEnumSerializer =
    _$OperationLogResponseOutcomeEnumSerializer();
Serializer<OperationLogResponseSource_Enum>
    _$operationLogResponseSourceEnumSerializer =
    _$OperationLogResponseSource_EnumSerializer();

class _$OperationLogResponseOutcomeEnumSerializer
    implements PrimitiveSerializer<OperationLogResponseOutcomeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'started': 'started',
    'succeeded': 'succeeded',
    'failed': 'failed',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'started': 'started',
    'succeeded': 'succeeded',
    'failed': 'failed',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[OperationLogResponseOutcomeEnum];
  @override
  final String wireName = 'OperationLogResponseOutcomeEnum';

  @override
  Object serialize(
          Serializers serializers, OperationLogResponseOutcomeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  OperationLogResponseOutcomeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      OperationLogResponseOutcomeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$OperationLogResponseSource_EnumSerializer
    implements PrimitiveSerializer<OperationLogResponseSource_Enum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'request': 'request',
    'task': 'task',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'request': 'request',
    'task': 'task',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[OperationLogResponseSource_Enum];
  @override
  final String wireName = 'OperationLogResponseSource_Enum';

  @override
  Object serialize(
          Serializers serializers, OperationLogResponseSource_Enum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  OperationLogResponseSource_Enum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      OperationLogResponseSource_Enum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$OperationLogResponse extends OperationLogResponse {
  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final DateTime? finishedAt;
  @override
  final String? actorId;
  @override
  final String? actorName;
  @override
  final String operation;
  @override
  final String description;
  @override
  final String method;
  @override
  final String route;
  @override
  final String? resourceId;
  @override
  final String? resourceKey;
  @override
  final OperationLogResponseOutcomeEnum outcome;
  @override
  final OperationLogResponseSource_Enum source_;
  @override
  final String? taskState;
  @override
  final int? statusCode;
  @override
  final String? errorCode;

  factory _$OperationLogResponse(
          [void Function(OperationLogResponseBuilder)? updates]) =>
      (OperationLogResponseBuilder()..update(updates))._build();

  _$OperationLogResponse._(
      {required this.id,
      required this.createdAt,
      this.finishedAt,
      this.actorId,
      this.actorName,
      required this.operation,
      required this.description,
      required this.method,
      required this.route,
      this.resourceId,
      this.resourceKey,
      required this.outcome,
      required this.source_,
      this.taskState,
      this.statusCode,
      this.errorCode})
      : super._();
  @override
  OperationLogResponse rebuild(
          void Function(OperationLogResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OperationLogResponseBuilder toBuilder() =>
      OperationLogResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OperationLogResponse &&
        id == other.id &&
        createdAt == other.createdAt &&
        finishedAt == other.finishedAt &&
        actorId == other.actorId &&
        actorName == other.actorName &&
        operation == other.operation &&
        description == other.description &&
        method == other.method &&
        route == other.route &&
        resourceId == other.resourceId &&
        resourceKey == other.resourceKey &&
        outcome == other.outcome &&
        source_ == other.source_ &&
        taskState == other.taskState &&
        statusCode == other.statusCode &&
        errorCode == other.errorCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, finishedAt.hashCode);
    _$hash = $jc(_$hash, actorId.hashCode);
    _$hash = $jc(_$hash, actorName.hashCode);
    _$hash = $jc(_$hash, operation.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, method.hashCode);
    _$hash = $jc(_$hash, route.hashCode);
    _$hash = $jc(_$hash, resourceId.hashCode);
    _$hash = $jc(_$hash, resourceKey.hashCode);
    _$hash = $jc(_$hash, outcome.hashCode);
    _$hash = $jc(_$hash, source_.hashCode);
    _$hash = $jc(_$hash, taskState.hashCode);
    _$hash = $jc(_$hash, statusCode.hashCode);
    _$hash = $jc(_$hash, errorCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OperationLogResponse')
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('finishedAt', finishedAt)
          ..add('actorId', actorId)
          ..add('actorName', actorName)
          ..add('operation', operation)
          ..add('description', description)
          ..add('method', method)
          ..add('route', route)
          ..add('resourceId', resourceId)
          ..add('resourceKey', resourceKey)
          ..add('outcome', outcome)
          ..add('source_', source_)
          ..add('taskState', taskState)
          ..add('statusCode', statusCode)
          ..add('errorCode', errorCode))
        .toString();
  }
}

class OperationLogResponseBuilder
    implements Builder<OperationLogResponse, OperationLogResponseBuilder> {
  _$OperationLogResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _finishedAt;
  DateTime? get finishedAt => _$this._finishedAt;
  set finishedAt(DateTime? finishedAt) => _$this._finishedAt = finishedAt;

  String? _actorId;
  String? get actorId => _$this._actorId;
  set actorId(String? actorId) => _$this._actorId = actorId;

  String? _actorName;
  String? get actorName => _$this._actorName;
  set actorName(String? actorName) => _$this._actorName = actorName;

  String? _operation;
  String? get operation => _$this._operation;
  set operation(String? operation) => _$this._operation = operation;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _method;
  String? get method => _$this._method;
  set method(String? method) => _$this._method = method;

  String? _route;
  String? get route => _$this._route;
  set route(String? route) => _$this._route = route;

  String? _resourceId;
  String? get resourceId => _$this._resourceId;
  set resourceId(String? resourceId) => _$this._resourceId = resourceId;

  String? _resourceKey;
  String? get resourceKey => _$this._resourceKey;
  set resourceKey(String? resourceKey) => _$this._resourceKey = resourceKey;

  OperationLogResponseOutcomeEnum? _outcome;
  OperationLogResponseOutcomeEnum? get outcome => _$this._outcome;
  set outcome(OperationLogResponseOutcomeEnum? outcome) =>
      _$this._outcome = outcome;

  OperationLogResponseSource_Enum? _source_;
  OperationLogResponseSource_Enum? get source_ => _$this._source_;
  set source_(OperationLogResponseSource_Enum? source_) =>
      _$this._source_ = source_;

  String? _taskState;
  String? get taskState => _$this._taskState;
  set taskState(String? taskState) => _$this._taskState = taskState;

  int? _statusCode;
  int? get statusCode => _$this._statusCode;
  set statusCode(int? statusCode) => _$this._statusCode = statusCode;

  String? _errorCode;
  String? get errorCode => _$this._errorCode;
  set errorCode(String? errorCode) => _$this._errorCode = errorCode;

  OperationLogResponseBuilder() {
    OperationLogResponse._defaults(this);
  }

  OperationLogResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _createdAt = $v.createdAt;
      _finishedAt = $v.finishedAt;
      _actorId = $v.actorId;
      _actorName = $v.actorName;
      _operation = $v.operation;
      _description = $v.description;
      _method = $v.method;
      _route = $v.route;
      _resourceId = $v.resourceId;
      _resourceKey = $v.resourceKey;
      _outcome = $v.outcome;
      _source_ = $v.source_;
      _taskState = $v.taskState;
      _statusCode = $v.statusCode;
      _errorCode = $v.errorCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OperationLogResponse other) {
    _$v = other as _$OperationLogResponse;
  }

  @override
  void update(void Function(OperationLogResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OperationLogResponse build() => _build();

  _$OperationLogResponse _build() {
    final _$result = _$v ??
        _$OperationLogResponse._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'OperationLogResponse', 'id'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'OperationLogResponse', 'createdAt'),
          finishedAt: finishedAt,
          actorId: actorId,
          actorName: actorName,
          operation: BuiltValueNullFieldError.checkNotNull(
              operation, r'OperationLogResponse', 'operation'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'OperationLogResponse', 'description'),
          method: BuiltValueNullFieldError.checkNotNull(
              method, r'OperationLogResponse', 'method'),
          route: BuiltValueNullFieldError.checkNotNull(
              route, r'OperationLogResponse', 'route'),
          resourceId: resourceId,
          resourceKey: resourceKey,
          outcome: BuiltValueNullFieldError.checkNotNull(
              outcome, r'OperationLogResponse', 'outcome'),
          source_: BuiltValueNullFieldError.checkNotNull(
              source_, r'OperationLogResponse', 'source_'),
          taskState: taskState,
          statusCode: statusCode,
          errorCode: errorCode,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
