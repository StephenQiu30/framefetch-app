// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_record_cursor_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HistoryRecordCursorResponse extends HistoryRecordCursorResponse {
  @override
  final DateTime createdAt;
  @override
  final HistoryRecordKind recordType;
  @override
  final String id;

  factory _$HistoryRecordCursorResponse(
          [void Function(HistoryRecordCursorResponseBuilder)? updates]) =>
      (HistoryRecordCursorResponseBuilder()..update(updates))._build();

  _$HistoryRecordCursorResponse._(
      {required this.createdAt, required this.recordType, required this.id})
      : super._();
  @override
  HistoryRecordCursorResponse rebuild(
          void Function(HistoryRecordCursorResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HistoryRecordCursorResponseBuilder toBuilder() =>
      HistoryRecordCursorResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HistoryRecordCursorResponse &&
        createdAt == other.createdAt &&
        recordType == other.recordType &&
        id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, recordType.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HistoryRecordCursorResponse')
          ..add('createdAt', createdAt)
          ..add('recordType', recordType)
          ..add('id', id))
        .toString();
  }
}

class HistoryRecordCursorResponseBuilder
    implements
        Builder<HistoryRecordCursorResponse,
            HistoryRecordCursorResponseBuilder> {
  _$HistoryRecordCursorResponse? _$v;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  HistoryRecordKind? _recordType;
  HistoryRecordKind? get recordType => _$this._recordType;
  set recordType(HistoryRecordKind? recordType) =>
      _$this._recordType = recordType;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  HistoryRecordCursorResponseBuilder() {
    HistoryRecordCursorResponse._defaults(this);
  }

  HistoryRecordCursorResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdAt = $v.createdAt;
      _recordType = $v.recordType;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HistoryRecordCursorResponse other) {
    _$v = other as _$HistoryRecordCursorResponse;
  }

  @override
  void update(void Function(HistoryRecordCursorResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HistoryRecordCursorResponse build() => _build();

  _$HistoryRecordCursorResponse _build() {
    final _$result = _$v ??
        _$HistoryRecordCursorResponse._(
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'HistoryRecordCursorResponse', 'createdAt'),
          recordType: BuiltValueNullFieldError.checkNotNull(
              recordType, r'HistoryRecordCursorResponse', 'recordType'),
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'HistoryRecordCursorResponse', 'id'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
