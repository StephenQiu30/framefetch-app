// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_parse_history_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DocumentParseHistoryRecordResponseRecordTypeEnum
    _$documentParseHistoryRecordResponseRecordTypeEnum_documentParse =
    const DocumentParseHistoryRecordResponseRecordTypeEnum._('documentParse');
const DocumentParseHistoryRecordResponseRecordTypeEnum
    _$documentParseHistoryRecordResponseRecordTypeEnum_unknownDefaultOpenApi =
    const DocumentParseHistoryRecordResponseRecordTypeEnum._(
        'unknownDefaultOpenApi');

DocumentParseHistoryRecordResponseRecordTypeEnum
    _$documentParseHistoryRecordResponseRecordTypeEnumValueOf(String name) {
  switch (name) {
    case 'documentParse':
      return _$documentParseHistoryRecordResponseRecordTypeEnum_documentParse;
    case 'unknownDefaultOpenApi':
      return _$documentParseHistoryRecordResponseRecordTypeEnum_unknownDefaultOpenApi;
    default:
      return _$documentParseHistoryRecordResponseRecordTypeEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<DocumentParseHistoryRecordResponseRecordTypeEnum>
    _$documentParseHistoryRecordResponseRecordTypeEnumValues = BuiltSet<
        DocumentParseHistoryRecordResponseRecordTypeEnum>(const <DocumentParseHistoryRecordResponseRecordTypeEnum>[
  _$documentParseHistoryRecordResponseRecordTypeEnum_documentParse,
  _$documentParseHistoryRecordResponseRecordTypeEnum_unknownDefaultOpenApi,
]);

Serializer<DocumentParseHistoryRecordResponseRecordTypeEnum>
    _$documentParseHistoryRecordResponseRecordTypeEnumSerializer =
    _$DocumentParseHistoryRecordResponseRecordTypeEnumSerializer();

class _$DocumentParseHistoryRecordResponseRecordTypeEnumSerializer
    implements
        PrimitiveSerializer<DocumentParseHistoryRecordResponseRecordTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'documentParse': 'document_parse',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'document_parse': 'documentParse',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[
    DocumentParseHistoryRecordResponseRecordTypeEnum
  ];
  @override
  final String wireName = 'DocumentParseHistoryRecordResponseRecordTypeEnum';

  @override
  Object serialize(Serializers serializers,
          DocumentParseHistoryRecordResponseRecordTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  DocumentParseHistoryRecordResponseRecordTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DocumentParseHistoryRecordResponseRecordTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$DocumentParseHistoryRecordResponse
    extends DocumentParseHistoryRecordResponse {
  @override
  final DateTime updatedAt;
  @override
  final HistoryStatusGroup statusGroup;
  @override
  final HistoryAvailability sourceAvailability;
  @override
  final HistoryAvailability resultAvailability;
  @override
  final DocumentParseHistoryRecordResponseRecordTypeEnum recordType;
  @override
  final String id;
  @override
  final String documentId;
  @override
  final String title;
  @override
  final ImportStatus status;
  @override
  final String sourceFormat;
  @override
  final DateTime createdAt;
  @override
  final int version;
  @override
  final String? errorCode;

  factory _$DocumentParseHistoryRecordResponse(
          [void Function(DocumentParseHistoryRecordResponseBuilder)?
              updates]) =>
      (DocumentParseHistoryRecordResponseBuilder()..update(updates))._build();

  _$DocumentParseHistoryRecordResponse._(
      {required this.updatedAt,
      required this.statusGroup,
      required this.sourceAvailability,
      required this.resultAvailability,
      required this.recordType,
      required this.id,
      required this.documentId,
      required this.title,
      required this.status,
      required this.sourceFormat,
      required this.createdAt,
      required this.version,
      this.errorCode})
      : super._();
  @override
  DocumentParseHistoryRecordResponse rebuild(
          void Function(DocumentParseHistoryRecordResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DocumentParseHistoryRecordResponseBuilder toBuilder() =>
      DocumentParseHistoryRecordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DocumentParseHistoryRecordResponse &&
        updatedAt == other.updatedAt &&
        statusGroup == other.statusGroup &&
        sourceAvailability == other.sourceAvailability &&
        resultAvailability == other.resultAvailability &&
        recordType == other.recordType &&
        id == other.id &&
        documentId == other.documentId &&
        title == other.title &&
        status == other.status &&
        sourceFormat == other.sourceFormat &&
        createdAt == other.createdAt &&
        version == other.version &&
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
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, documentId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, sourceFormat.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, errorCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DocumentParseHistoryRecordResponse')
          ..add('updatedAt', updatedAt)
          ..add('statusGroup', statusGroup)
          ..add('sourceAvailability', sourceAvailability)
          ..add('resultAvailability', resultAvailability)
          ..add('recordType', recordType)
          ..add('id', id)
          ..add('documentId', documentId)
          ..add('title', title)
          ..add('status', status)
          ..add('sourceFormat', sourceFormat)
          ..add('createdAt', createdAt)
          ..add('version', version)
          ..add('errorCode', errorCode))
        .toString();
  }
}

class DocumentParseHistoryRecordResponseBuilder
    implements
        Builder<DocumentParseHistoryRecordResponse,
            DocumentParseHistoryRecordResponseBuilder> {
  _$DocumentParseHistoryRecordResponse? _$v;

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

  DocumentParseHistoryRecordResponseRecordTypeEnum? _recordType;
  DocumentParseHistoryRecordResponseRecordTypeEnum? get recordType =>
      _$this._recordType;
  set recordType(
          DocumentParseHistoryRecordResponseRecordTypeEnum? recordType) =>
      _$this._recordType = recordType;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _documentId;
  String? get documentId => _$this._documentId;
  set documentId(String? documentId) => _$this._documentId = documentId;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ImportStatus? _status;
  ImportStatus? get status => _$this._status;
  set status(ImportStatus? status) => _$this._status = status;

  String? _sourceFormat;
  String? get sourceFormat => _$this._sourceFormat;
  set sourceFormat(String? sourceFormat) => _$this._sourceFormat = sourceFormat;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  int? _version;
  int? get version => _$this._version;
  set version(int? version) => _$this._version = version;

  String? _errorCode;
  String? get errorCode => _$this._errorCode;
  set errorCode(String? errorCode) => _$this._errorCode = errorCode;

  DocumentParseHistoryRecordResponseBuilder() {
    DocumentParseHistoryRecordResponse._defaults(this);
  }

  DocumentParseHistoryRecordResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _updatedAt = $v.updatedAt;
      _statusGroup = $v.statusGroup;
      _sourceAvailability = $v.sourceAvailability;
      _resultAvailability = $v.resultAvailability;
      _recordType = $v.recordType;
      _id = $v.id;
      _documentId = $v.documentId;
      _title = $v.title;
      _status = $v.status;
      _sourceFormat = $v.sourceFormat;
      _createdAt = $v.createdAt;
      _version = $v.version;
      _errorCode = $v.errorCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DocumentParseHistoryRecordResponse other) {
    _$v = other as _$DocumentParseHistoryRecordResponse;
  }

  @override
  void update(
      void Function(DocumentParseHistoryRecordResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DocumentParseHistoryRecordResponse build() => _build();

  _$DocumentParseHistoryRecordResponse _build() {
    final _$result = _$v ??
        _$DocumentParseHistoryRecordResponse._(
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'DocumentParseHistoryRecordResponse', 'updatedAt'),
          statusGroup: BuiltValueNullFieldError.checkNotNull(statusGroup,
              r'DocumentParseHistoryRecordResponse', 'statusGroup'),
          sourceAvailability: BuiltValueNullFieldError.checkNotNull(
              sourceAvailability,
              r'DocumentParseHistoryRecordResponse',
              'sourceAvailability'),
          resultAvailability: BuiltValueNullFieldError.checkNotNull(
              resultAvailability,
              r'DocumentParseHistoryRecordResponse',
              'resultAvailability'),
          recordType: BuiltValueNullFieldError.checkNotNull(
              recordType, r'DocumentParseHistoryRecordResponse', 'recordType'),
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'DocumentParseHistoryRecordResponse', 'id'),
          documentId: BuiltValueNullFieldError.checkNotNull(
              documentId, r'DocumentParseHistoryRecordResponse', 'documentId'),
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'DocumentParseHistoryRecordResponse', 'title'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'DocumentParseHistoryRecordResponse', 'status'),
          sourceFormat: BuiltValueNullFieldError.checkNotNull(sourceFormat,
              r'DocumentParseHistoryRecordResponse', 'sourceFormat'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'DocumentParseHistoryRecordResponse', 'createdAt'),
          version: BuiltValueNullFieldError.checkNotNull(
              version, r'DocumentParseHistoryRecordResponse', 'version'),
          errorCode: errorCode,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
