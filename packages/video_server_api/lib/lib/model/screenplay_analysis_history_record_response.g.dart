// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screenplay_analysis_history_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ScreenplayAnalysisHistoryRecordResponseRecordTypeEnum
    _$screenplayAnalysisHistoryRecordResponseRecordTypeEnum_screenplayAnalysis =
    const ScreenplayAnalysisHistoryRecordResponseRecordTypeEnum._(
        'screenplayAnalysis');
const ScreenplayAnalysisHistoryRecordResponseRecordTypeEnum
    _$screenplayAnalysisHistoryRecordResponseRecordTypeEnum_unknownDefaultOpenApi =
    const ScreenplayAnalysisHistoryRecordResponseRecordTypeEnum._(
        'unknownDefaultOpenApi');

ScreenplayAnalysisHistoryRecordResponseRecordTypeEnum
    _$screenplayAnalysisHistoryRecordResponseRecordTypeEnumValueOf(
        String name) {
  switch (name) {
    case 'screenplayAnalysis':
      return _$screenplayAnalysisHistoryRecordResponseRecordTypeEnum_screenplayAnalysis;
    case 'unknownDefaultOpenApi':
      return _$screenplayAnalysisHistoryRecordResponseRecordTypeEnum_unknownDefaultOpenApi;
    default:
      return _$screenplayAnalysisHistoryRecordResponseRecordTypeEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<ScreenplayAnalysisHistoryRecordResponseRecordTypeEnum>
    _$screenplayAnalysisHistoryRecordResponseRecordTypeEnumValues = BuiltSet<
        ScreenplayAnalysisHistoryRecordResponseRecordTypeEnum>(const <ScreenplayAnalysisHistoryRecordResponseRecordTypeEnum>[
  _$screenplayAnalysisHistoryRecordResponseRecordTypeEnum_screenplayAnalysis,
  _$screenplayAnalysisHistoryRecordResponseRecordTypeEnum_unknownDefaultOpenApi,
]);

const ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum
    _$screenplayAnalysisHistoryRecordResponseAllowedActionsEnum_view =
    const ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum._('view');
const ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum
    _$screenplayAnalysisHistoryRecordResponseAllowedActionsEnum_retry =
    const ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum._('retry');
const ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum
    _$screenplayAnalysisHistoryRecordResponseAllowedActionsEnum_cancel =
    const ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum._('cancel');
const ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum
    _$screenplayAnalysisHistoryRecordResponseAllowedActionsEnum_delete =
    const ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum._('delete');
const ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum
    _$screenplayAnalysisHistoryRecordResponseAllowedActionsEnum_unknownDefaultOpenApi =
    const ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum._(
        'unknownDefaultOpenApi');

ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum
    _$screenplayAnalysisHistoryRecordResponseAllowedActionsEnumValueOf(
        String name) {
  switch (name) {
    case 'view':
      return _$screenplayAnalysisHistoryRecordResponseAllowedActionsEnum_view;
    case 'retry':
      return _$screenplayAnalysisHistoryRecordResponseAllowedActionsEnum_retry;
    case 'cancel':
      return _$screenplayAnalysisHistoryRecordResponseAllowedActionsEnum_cancel;
    case 'delete':
      return _$screenplayAnalysisHistoryRecordResponseAllowedActionsEnum_delete;
    case 'unknownDefaultOpenApi':
      return _$screenplayAnalysisHistoryRecordResponseAllowedActionsEnum_unknownDefaultOpenApi;
    default:
      return _$screenplayAnalysisHistoryRecordResponseAllowedActionsEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum>
    _$screenplayAnalysisHistoryRecordResponseAllowedActionsEnumValues =
    BuiltSet<
        ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum>(const <ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum>[
  _$screenplayAnalysisHistoryRecordResponseAllowedActionsEnum_view,
  _$screenplayAnalysisHistoryRecordResponseAllowedActionsEnum_retry,
  _$screenplayAnalysisHistoryRecordResponseAllowedActionsEnum_cancel,
  _$screenplayAnalysisHistoryRecordResponseAllowedActionsEnum_delete,
  _$screenplayAnalysisHistoryRecordResponseAllowedActionsEnum_unknownDefaultOpenApi,
]);

Serializer<ScreenplayAnalysisHistoryRecordResponseRecordTypeEnum>
    _$screenplayAnalysisHistoryRecordResponseRecordTypeEnumSerializer =
    _$ScreenplayAnalysisHistoryRecordResponseRecordTypeEnumSerializer();
Serializer<ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum>
    _$screenplayAnalysisHistoryRecordResponseAllowedActionsEnumSerializer =
    _$ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnumSerializer();

class _$ScreenplayAnalysisHistoryRecordResponseRecordTypeEnumSerializer
    implements
        PrimitiveSerializer<
            ScreenplayAnalysisHistoryRecordResponseRecordTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'screenplayAnalysis': 'screenplay_analysis',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'screenplay_analysis': 'screenplayAnalysis',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[
    ScreenplayAnalysisHistoryRecordResponseRecordTypeEnum
  ];
  @override
  final String wireName =
      'ScreenplayAnalysisHistoryRecordResponseRecordTypeEnum';

  @override
  Object serialize(Serializers serializers,
          ScreenplayAnalysisHistoryRecordResponseRecordTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ScreenplayAnalysisHistoryRecordResponseRecordTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ScreenplayAnalysisHistoryRecordResponseRecordTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnumSerializer
    implements
        PrimitiveSerializer<
            ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'view': 'view',
    'retry': 'retry',
    'cancel': 'cancel',
    'delete': 'delete',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'view': 'view',
    'retry': 'retry',
    'cancel': 'cancel',
    'delete': 'delete',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[
    ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum
  ];
  @override
  final String wireName =
      'ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum';

  @override
  Object serialize(Serializers serializers,
          ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ScreenplayAnalysisHistoryRecordResponse
    extends ScreenplayAnalysisHistoryRecordResponse {
  @override
  final DateTime updatedAt;
  @override
  final HistoryStatusGroup statusGroup;
  @override
  final HistoryAvailability sourceAvailability;
  @override
  final HistoryAvailability resultAvailability;
  @override
  final ScreenplayAnalysisHistoryRecordResponseRecordTypeEnum recordType;
  @override
  final String? documentId;
  @override
  final String? artifactId;
  @override
  final String outputLanguage;
  @override
  final AnalysisResultContract resultContract;
  @override
  final int currentRunNo;
  @override
  final DateTime? cancelRequestedAt;
  @override
  final int version;
  @override
  final BuiltList<ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum>
      allowedActions;
  @override
  final String? actionUnavailableReason;
  @override
  final String id;
  @override
  final String? downloadId;
  @override
  final String title;
  @override
  final String skillId;
  @override
  final DateTime createdAt;
  @override
  final AnalysisStatus status;
  @override
  final int progress;
  @override
  final AnalysisStage? stage;
  @override
  final AnalysisErrorCode? errorCode;

  factory _$ScreenplayAnalysisHistoryRecordResponse(
          [void Function(ScreenplayAnalysisHistoryRecordResponseBuilder)?
              updates]) =>
      (ScreenplayAnalysisHistoryRecordResponseBuilder()..update(updates))
          ._build();

  _$ScreenplayAnalysisHistoryRecordResponse._(
      {required this.updatedAt,
      required this.statusGroup,
      required this.sourceAvailability,
      required this.resultAvailability,
      required this.recordType,
      this.documentId,
      this.artifactId,
      required this.outputLanguage,
      required this.resultContract,
      required this.currentRunNo,
      this.cancelRequestedAt,
      required this.version,
      required this.allowedActions,
      this.actionUnavailableReason,
      required this.id,
      this.downloadId,
      required this.title,
      required this.skillId,
      required this.createdAt,
      required this.status,
      required this.progress,
      this.stage,
      this.errorCode})
      : super._();
  @override
  ScreenplayAnalysisHistoryRecordResponse rebuild(
          void Function(ScreenplayAnalysisHistoryRecordResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScreenplayAnalysisHistoryRecordResponseBuilder toBuilder() =>
      ScreenplayAnalysisHistoryRecordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScreenplayAnalysisHistoryRecordResponse &&
        updatedAt == other.updatedAt &&
        statusGroup == other.statusGroup &&
        sourceAvailability == other.sourceAvailability &&
        resultAvailability == other.resultAvailability &&
        recordType == other.recordType &&
        documentId == other.documentId &&
        artifactId == other.artifactId &&
        outputLanguage == other.outputLanguage &&
        resultContract == other.resultContract &&
        currentRunNo == other.currentRunNo &&
        cancelRequestedAt == other.cancelRequestedAt &&
        version == other.version &&
        allowedActions == other.allowedActions &&
        actionUnavailableReason == other.actionUnavailableReason &&
        id == other.id &&
        downloadId == other.downloadId &&
        title == other.title &&
        skillId == other.skillId &&
        createdAt == other.createdAt &&
        status == other.status &&
        progress == other.progress &&
        stage == other.stage &&
        errorCode == other.errorCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, statusGroup.hashCode);
    _$hash = $jc(_$hash, sourceAvailability.hashCode);
    _$hash = $jc(_$hash, resultAvailability.hashCode);
    _$hash = $jc(_$hash, recordType.hashCode);
    _$hash = $jc(_$hash, documentId.hashCode);
    _$hash = $jc(_$hash, artifactId.hashCode);
    _$hash = $jc(_$hash, outputLanguage.hashCode);
    _$hash = $jc(_$hash, resultContract.hashCode);
    _$hash = $jc(_$hash, currentRunNo.hashCode);
    _$hash = $jc(_$hash, cancelRequestedAt.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, allowedActions.hashCode);
    _$hash = $jc(_$hash, actionUnavailableReason.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, downloadId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, skillId.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, progress.hashCode);
    _$hash = $jc(_$hash, stage.hashCode);
    _$hash = $jc(_$hash, errorCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'ScreenplayAnalysisHistoryRecordResponse')
          ..add('updatedAt', updatedAt)
          ..add('statusGroup', statusGroup)
          ..add('sourceAvailability', sourceAvailability)
          ..add('resultAvailability', resultAvailability)
          ..add('recordType', recordType)
          ..add('documentId', documentId)
          ..add('artifactId', artifactId)
          ..add('outputLanguage', outputLanguage)
          ..add('resultContract', resultContract)
          ..add('currentRunNo', currentRunNo)
          ..add('cancelRequestedAt', cancelRequestedAt)
          ..add('version', version)
          ..add('allowedActions', allowedActions)
          ..add('actionUnavailableReason', actionUnavailableReason)
          ..add('id', id)
          ..add('downloadId', downloadId)
          ..add('title', title)
          ..add('skillId', skillId)
          ..add('createdAt', createdAt)
          ..add('status', status)
          ..add('progress', progress)
          ..add('stage', stage)
          ..add('errorCode', errorCode))
        .toString();
  }
}

class ScreenplayAnalysisHistoryRecordResponseBuilder
    implements
        Builder<ScreenplayAnalysisHistoryRecordResponse,
            ScreenplayAnalysisHistoryRecordResponseBuilder> {
  _$ScreenplayAnalysisHistoryRecordResponse? _$v;

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

  ScreenplayAnalysisHistoryRecordResponseRecordTypeEnum? _recordType;
  ScreenplayAnalysisHistoryRecordResponseRecordTypeEnum? get recordType =>
      _$this._recordType;
  set recordType(
          ScreenplayAnalysisHistoryRecordResponseRecordTypeEnum? recordType) =>
      _$this._recordType = recordType;

  String? _documentId;
  String? get documentId => _$this._documentId;
  set documentId(String? documentId) => _$this._documentId = documentId;

  String? _artifactId;
  String? get artifactId => _$this._artifactId;
  set artifactId(String? artifactId) => _$this._artifactId = artifactId;

  String? _outputLanguage;
  String? get outputLanguage => _$this._outputLanguage;
  set outputLanguage(String? outputLanguage) =>
      _$this._outputLanguage = outputLanguage;

  AnalysisResultContract? _resultContract;
  AnalysisResultContract? get resultContract => _$this._resultContract;
  set resultContract(AnalysisResultContract? resultContract) =>
      _$this._resultContract = resultContract;

  int? _currentRunNo;
  int? get currentRunNo => _$this._currentRunNo;
  set currentRunNo(int? currentRunNo) => _$this._currentRunNo = currentRunNo;

  DateTime? _cancelRequestedAt;
  DateTime? get cancelRequestedAt => _$this._cancelRequestedAt;
  set cancelRequestedAt(DateTime? cancelRequestedAt) =>
      _$this._cancelRequestedAt = cancelRequestedAt;

  int? _version;
  int? get version => _$this._version;
  set version(int? version) => _$this._version = version;

  ListBuilder<ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum>?
      _allowedActions;
  ListBuilder<ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum>
      get allowedActions => _$this._allowedActions ??= ListBuilder<
          ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum>();
  set allowedActions(
          ListBuilder<
                  ScreenplayAnalysisHistoryRecordResponseAllowedActionsEnum>?
              allowedActions) =>
      _$this._allowedActions = allowedActions;

  String? _actionUnavailableReason;
  String? get actionUnavailableReason => _$this._actionUnavailableReason;
  set actionUnavailableReason(String? actionUnavailableReason) =>
      _$this._actionUnavailableReason = actionUnavailableReason;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadId;
  String? get downloadId => _$this._downloadId;
  set downloadId(String? downloadId) => _$this._downloadId = downloadId;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _skillId;
  String? get skillId => _$this._skillId;
  set skillId(String? skillId) => _$this._skillId = skillId;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  AnalysisStatus? _status;
  AnalysisStatus? get status => _$this._status;
  set status(AnalysisStatus? status) => _$this._status = status;

  int? _progress;
  int? get progress => _$this._progress;
  set progress(int? progress) => _$this._progress = progress;

  AnalysisStage? _stage;
  AnalysisStage? get stage => _$this._stage;
  set stage(AnalysisStage? stage) => _$this._stage = stage;

  AnalysisErrorCode? _errorCode;
  AnalysisErrorCode? get errorCode => _$this._errorCode;
  set errorCode(AnalysisErrorCode? errorCode) => _$this._errorCode = errorCode;

  ScreenplayAnalysisHistoryRecordResponseBuilder() {
    ScreenplayAnalysisHistoryRecordResponse._defaults(this);
  }

  ScreenplayAnalysisHistoryRecordResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _updatedAt = $v.updatedAt;
      _statusGroup = $v.statusGroup;
      _sourceAvailability = $v.sourceAvailability;
      _resultAvailability = $v.resultAvailability;
      _recordType = $v.recordType;
      _documentId = $v.documentId;
      _artifactId = $v.artifactId;
      _outputLanguage = $v.outputLanguage;
      _resultContract = $v.resultContract;
      _currentRunNo = $v.currentRunNo;
      _cancelRequestedAt = $v.cancelRequestedAt;
      _version = $v.version;
      _allowedActions = $v.allowedActions.toBuilder();
      _actionUnavailableReason = $v.actionUnavailableReason;
      _id = $v.id;
      _downloadId = $v.downloadId;
      _title = $v.title;
      _skillId = $v.skillId;
      _createdAt = $v.createdAt;
      _status = $v.status;
      _progress = $v.progress;
      _stage = $v.stage;
      _errorCode = $v.errorCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScreenplayAnalysisHistoryRecordResponse other) {
    _$v = other as _$ScreenplayAnalysisHistoryRecordResponse;
  }

  @override
  void update(
      void Function(ScreenplayAnalysisHistoryRecordResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScreenplayAnalysisHistoryRecordResponse build() => _build();

  _$ScreenplayAnalysisHistoryRecordResponse _build() {
    _$ScreenplayAnalysisHistoryRecordResponse _$result;
    try {
      _$result = _$v ??
          _$ScreenplayAnalysisHistoryRecordResponse._(
            updatedAt: BuiltValueNullFieldError.checkNotNull(updatedAt,
                r'ScreenplayAnalysisHistoryRecordResponse', 'updatedAt'),
            statusGroup: BuiltValueNullFieldError.checkNotNull(statusGroup,
                r'ScreenplayAnalysisHistoryRecordResponse', 'statusGroup'),
            sourceAvailability: BuiltValueNullFieldError.checkNotNull(
                sourceAvailability,
                r'ScreenplayAnalysisHistoryRecordResponse',
                'sourceAvailability'),
            resultAvailability: BuiltValueNullFieldError.checkNotNull(
                resultAvailability,
                r'ScreenplayAnalysisHistoryRecordResponse',
                'resultAvailability'),
            recordType: BuiltValueNullFieldError.checkNotNull(recordType,
                r'ScreenplayAnalysisHistoryRecordResponse', 'recordType'),
            documentId: documentId,
            artifactId: artifactId,
            outputLanguage: BuiltValueNullFieldError.checkNotNull(
                outputLanguage,
                r'ScreenplayAnalysisHistoryRecordResponse',
                'outputLanguage'),
            resultContract: BuiltValueNullFieldError.checkNotNull(
                resultContract,
                r'ScreenplayAnalysisHistoryRecordResponse',
                'resultContract'),
            currentRunNo: BuiltValueNullFieldError.checkNotNull(currentRunNo,
                r'ScreenplayAnalysisHistoryRecordResponse', 'currentRunNo'),
            cancelRequestedAt: cancelRequestedAt,
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'ScreenplayAnalysisHistoryRecordResponse', 'version'),
            allowedActions: allowedActions.build(),
            actionUnavailableReason: actionUnavailableReason,
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ScreenplayAnalysisHistoryRecordResponse', 'id'),
            downloadId: downloadId,
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'ScreenplayAnalysisHistoryRecordResponse', 'title'),
            skillId: BuiltValueNullFieldError.checkNotNull(
                skillId, r'ScreenplayAnalysisHistoryRecordResponse', 'skillId'),
            createdAt: BuiltValueNullFieldError.checkNotNull(createdAt,
                r'ScreenplayAnalysisHistoryRecordResponse', 'createdAt'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'ScreenplayAnalysisHistoryRecordResponse', 'status'),
            progress: BuiltValueNullFieldError.checkNotNull(progress,
                r'ScreenplayAnalysisHistoryRecordResponse', 'progress'),
            stage: stage,
            errorCode: errorCode,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'allowedActions';
        allowedActions.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ScreenplayAnalysisHistoryRecordResponse',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
