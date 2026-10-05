// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_creation_history_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ContentCreationHistoryRecordResponseRecordTypeEnum
    _$contentCreationHistoryRecordResponseRecordTypeEnum_contentCreation =
    const ContentCreationHistoryRecordResponseRecordTypeEnum._(
        'contentCreation');
const ContentCreationHistoryRecordResponseRecordTypeEnum
    _$contentCreationHistoryRecordResponseRecordTypeEnum_unknownDefaultOpenApi =
    const ContentCreationHistoryRecordResponseRecordTypeEnum._(
        'unknownDefaultOpenApi');

ContentCreationHistoryRecordResponseRecordTypeEnum
    _$contentCreationHistoryRecordResponseRecordTypeEnumValueOf(String name) {
  switch (name) {
    case 'contentCreation':
      return _$contentCreationHistoryRecordResponseRecordTypeEnum_contentCreation;
    case 'unknownDefaultOpenApi':
      return _$contentCreationHistoryRecordResponseRecordTypeEnum_unknownDefaultOpenApi;
    default:
      return _$contentCreationHistoryRecordResponseRecordTypeEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<ContentCreationHistoryRecordResponseRecordTypeEnum>
    _$contentCreationHistoryRecordResponseRecordTypeEnumValues = BuiltSet<
        ContentCreationHistoryRecordResponseRecordTypeEnum>(const <ContentCreationHistoryRecordResponseRecordTypeEnum>[
  _$contentCreationHistoryRecordResponseRecordTypeEnum_contentCreation,
  _$contentCreationHistoryRecordResponseRecordTypeEnum_unknownDefaultOpenApi,
]);

const ContentCreationHistoryRecordResponseAllowedActionsEnum
    _$contentCreationHistoryRecordResponseAllowedActionsEnum_view =
    const ContentCreationHistoryRecordResponseAllowedActionsEnum._('view');
const ContentCreationHistoryRecordResponseAllowedActionsEnum
    _$contentCreationHistoryRecordResponseAllowedActionsEnum_retry =
    const ContentCreationHistoryRecordResponseAllowedActionsEnum._('retry');
const ContentCreationHistoryRecordResponseAllowedActionsEnum
    _$contentCreationHistoryRecordResponseAllowedActionsEnum_cancel =
    const ContentCreationHistoryRecordResponseAllowedActionsEnum._('cancel');
const ContentCreationHistoryRecordResponseAllowedActionsEnum
    _$contentCreationHistoryRecordResponseAllowedActionsEnum_delete =
    const ContentCreationHistoryRecordResponseAllowedActionsEnum._('delete');
const ContentCreationHistoryRecordResponseAllowedActionsEnum
    _$contentCreationHistoryRecordResponseAllowedActionsEnum_unknownDefaultOpenApi =
    const ContentCreationHistoryRecordResponseAllowedActionsEnum._(
        'unknownDefaultOpenApi');

ContentCreationHistoryRecordResponseAllowedActionsEnum
    _$contentCreationHistoryRecordResponseAllowedActionsEnumValueOf(
        String name) {
  switch (name) {
    case 'view':
      return _$contentCreationHistoryRecordResponseAllowedActionsEnum_view;
    case 'retry':
      return _$contentCreationHistoryRecordResponseAllowedActionsEnum_retry;
    case 'cancel':
      return _$contentCreationHistoryRecordResponseAllowedActionsEnum_cancel;
    case 'delete':
      return _$contentCreationHistoryRecordResponseAllowedActionsEnum_delete;
    case 'unknownDefaultOpenApi':
      return _$contentCreationHistoryRecordResponseAllowedActionsEnum_unknownDefaultOpenApi;
    default:
      return _$contentCreationHistoryRecordResponseAllowedActionsEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<ContentCreationHistoryRecordResponseAllowedActionsEnum>
    _$contentCreationHistoryRecordResponseAllowedActionsEnumValues = BuiltSet<
        ContentCreationHistoryRecordResponseAllowedActionsEnum>(const <ContentCreationHistoryRecordResponseAllowedActionsEnum>[
  _$contentCreationHistoryRecordResponseAllowedActionsEnum_view,
  _$contentCreationHistoryRecordResponseAllowedActionsEnum_retry,
  _$contentCreationHistoryRecordResponseAllowedActionsEnum_cancel,
  _$contentCreationHistoryRecordResponseAllowedActionsEnum_delete,
  _$contentCreationHistoryRecordResponseAllowedActionsEnum_unknownDefaultOpenApi,
]);

Serializer<ContentCreationHistoryRecordResponseRecordTypeEnum>
    _$contentCreationHistoryRecordResponseRecordTypeEnumSerializer =
    _$ContentCreationHistoryRecordResponseRecordTypeEnumSerializer();
Serializer<ContentCreationHistoryRecordResponseAllowedActionsEnum>
    _$contentCreationHistoryRecordResponseAllowedActionsEnumSerializer =
    _$ContentCreationHistoryRecordResponseAllowedActionsEnumSerializer();

class _$ContentCreationHistoryRecordResponseRecordTypeEnumSerializer
    implements
        PrimitiveSerializer<
            ContentCreationHistoryRecordResponseRecordTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'contentCreation': 'content_creation',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'content_creation': 'contentCreation',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[
    ContentCreationHistoryRecordResponseRecordTypeEnum
  ];
  @override
  final String wireName = 'ContentCreationHistoryRecordResponseRecordTypeEnum';

  @override
  Object serialize(Serializers serializers,
          ContentCreationHistoryRecordResponseRecordTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ContentCreationHistoryRecordResponseRecordTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ContentCreationHistoryRecordResponseRecordTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ContentCreationHistoryRecordResponseAllowedActionsEnumSerializer
    implements
        PrimitiveSerializer<
            ContentCreationHistoryRecordResponseAllowedActionsEnum> {
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
    ContentCreationHistoryRecordResponseAllowedActionsEnum
  ];
  @override
  final String wireName =
      'ContentCreationHistoryRecordResponseAllowedActionsEnum';

  @override
  Object serialize(Serializers serializers,
          ContentCreationHistoryRecordResponseAllowedActionsEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ContentCreationHistoryRecordResponseAllowedActionsEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ContentCreationHistoryRecordResponseAllowedActionsEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ContentCreationHistoryRecordResponse
    extends ContentCreationHistoryRecordResponse {
  @override
  final DateTime updatedAt;
  @override
  final HistoryStatusGroup statusGroup;
  @override
  final HistoryAvailability sourceAvailability;
  @override
  final HistoryAvailability resultAvailability;
  @override
  final ContentCreationHistoryRecordResponseRecordTypeEnum recordType;
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
  final BuiltList<ContentCreationHistoryRecordResponseAllowedActionsEnum>
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

  factory _$ContentCreationHistoryRecordResponse(
          [void Function(ContentCreationHistoryRecordResponseBuilder)?
              updates]) =>
      (ContentCreationHistoryRecordResponseBuilder()..update(updates))._build();

  _$ContentCreationHistoryRecordResponse._(
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
  ContentCreationHistoryRecordResponse rebuild(
          void Function(ContentCreationHistoryRecordResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContentCreationHistoryRecordResponseBuilder toBuilder() =>
      ContentCreationHistoryRecordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContentCreationHistoryRecordResponse &&
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
    return (newBuiltValueToStringHelper(r'ContentCreationHistoryRecordResponse')
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

class ContentCreationHistoryRecordResponseBuilder
    implements
        Builder<ContentCreationHistoryRecordResponse,
            ContentCreationHistoryRecordResponseBuilder> {
  _$ContentCreationHistoryRecordResponse? _$v;

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

  ContentCreationHistoryRecordResponseRecordTypeEnum? _recordType;
  ContentCreationHistoryRecordResponseRecordTypeEnum? get recordType =>
      _$this._recordType;
  set recordType(
          ContentCreationHistoryRecordResponseRecordTypeEnum? recordType) =>
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

  ListBuilder<ContentCreationHistoryRecordResponseAllowedActionsEnum>?
      _allowedActions;
  ListBuilder<ContentCreationHistoryRecordResponseAllowedActionsEnum>
      get allowedActions => _$this._allowedActions ??=
          ListBuilder<ContentCreationHistoryRecordResponseAllowedActionsEnum>();
  set allowedActions(
          ListBuilder<ContentCreationHistoryRecordResponseAllowedActionsEnum>?
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

  ContentCreationHistoryRecordResponseBuilder() {
    ContentCreationHistoryRecordResponse._defaults(this);
  }

  ContentCreationHistoryRecordResponseBuilder get _$this {
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
  void replace(ContentCreationHistoryRecordResponse other) {
    _$v = other as _$ContentCreationHistoryRecordResponse;
  }

  @override
  void update(
      void Function(ContentCreationHistoryRecordResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ContentCreationHistoryRecordResponse build() => _build();

  _$ContentCreationHistoryRecordResponse _build() {
    _$ContentCreationHistoryRecordResponse _$result;
    try {
      _$result = _$v ??
          _$ContentCreationHistoryRecordResponse._(
            updatedAt: BuiltValueNullFieldError.checkNotNull(updatedAt,
                r'ContentCreationHistoryRecordResponse', 'updatedAt'),
            statusGroup: BuiltValueNullFieldError.checkNotNull(statusGroup,
                r'ContentCreationHistoryRecordResponse', 'statusGroup'),
            sourceAvailability: BuiltValueNullFieldError.checkNotNull(
                sourceAvailability,
                r'ContentCreationHistoryRecordResponse',
                'sourceAvailability'),
            resultAvailability: BuiltValueNullFieldError.checkNotNull(
                resultAvailability,
                r'ContentCreationHistoryRecordResponse',
                'resultAvailability'),
            recordType: BuiltValueNullFieldError.checkNotNull(recordType,
                r'ContentCreationHistoryRecordResponse', 'recordType'),
            documentId: documentId,
            artifactId: artifactId,
            outputLanguage: BuiltValueNullFieldError.checkNotNull(
                outputLanguage,
                r'ContentCreationHistoryRecordResponse',
                'outputLanguage'),
            resultContract: BuiltValueNullFieldError.checkNotNull(
                resultContract,
                r'ContentCreationHistoryRecordResponse',
                'resultContract'),
            currentRunNo: BuiltValueNullFieldError.checkNotNull(currentRunNo,
                r'ContentCreationHistoryRecordResponse', 'currentRunNo'),
            cancelRequestedAt: cancelRequestedAt,
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'ContentCreationHistoryRecordResponse', 'version'),
            allowedActions: allowedActions.build(),
            actionUnavailableReason: actionUnavailableReason,
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ContentCreationHistoryRecordResponse', 'id'),
            downloadId: downloadId,
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'ContentCreationHistoryRecordResponse', 'title'),
            skillId: BuiltValueNullFieldError.checkNotNull(
                skillId, r'ContentCreationHistoryRecordResponse', 'skillId'),
            createdAt: BuiltValueNullFieldError.checkNotNull(createdAt,
                r'ContentCreationHistoryRecordResponse', 'createdAt'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'ContentCreationHistoryRecordResponse', 'status'),
            progress: BuiltValueNullFieldError.checkNotNull(
                progress, r'ContentCreationHistoryRecordResponse', 'progress'),
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
            r'ContentCreationHistoryRecordResponse',
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
