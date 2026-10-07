// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_run_history_page_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AnalysisRunHistoryPageResponse extends AnalysisRunHistoryPageResponse {
  @override
  final BuiltList<AnalysisRunHistoryResponse> items;
  @override
  final int? nextBeforeRunNo;

  factory _$AnalysisRunHistoryPageResponse(
          [void Function(AnalysisRunHistoryPageResponseBuilder)? updates]) =>
      (AnalysisRunHistoryPageResponseBuilder()..update(updates))._build();

  _$AnalysisRunHistoryPageResponse._(
      {required this.items, this.nextBeforeRunNo})
      : super._();
  @override
  AnalysisRunHistoryPageResponse rebuild(
          void Function(AnalysisRunHistoryPageResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnalysisRunHistoryPageResponseBuilder toBuilder() =>
      AnalysisRunHistoryPageResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnalysisRunHistoryPageResponse &&
        items == other.items &&
        nextBeforeRunNo == other.nextBeforeRunNo;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, nextBeforeRunNo.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnalysisRunHistoryPageResponse')
          ..add('items', items)
          ..add('nextBeforeRunNo', nextBeforeRunNo))
        .toString();
  }
}

class AnalysisRunHistoryPageResponseBuilder
    implements
        Builder<AnalysisRunHistoryPageResponse,
            AnalysisRunHistoryPageResponseBuilder> {
  _$AnalysisRunHistoryPageResponse? _$v;

  ListBuilder<AnalysisRunHistoryResponse>? _items;
  ListBuilder<AnalysisRunHistoryResponse> get items =>
      _$this._items ??= ListBuilder<AnalysisRunHistoryResponse>();
  set items(ListBuilder<AnalysisRunHistoryResponse>? items) =>
      _$this._items = items;

  int? _nextBeforeRunNo;
  int? get nextBeforeRunNo => _$this._nextBeforeRunNo;
  set nextBeforeRunNo(int? nextBeforeRunNo) =>
      _$this._nextBeforeRunNo = nextBeforeRunNo;

  AnalysisRunHistoryPageResponseBuilder() {
    AnalysisRunHistoryPageResponse._defaults(this);
  }

  AnalysisRunHistoryPageResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _nextBeforeRunNo = $v.nextBeforeRunNo;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnalysisRunHistoryPageResponse other) {
    _$v = other as _$AnalysisRunHistoryPageResponse;
  }

  @override
  void update(void Function(AnalysisRunHistoryPageResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnalysisRunHistoryPageResponse build() => _build();

  _$AnalysisRunHistoryPageResponse _build() {
    _$AnalysisRunHistoryPageResponse _$result;
    try {
      _$result = _$v ??
          _$AnalysisRunHistoryPageResponse._(
            items: items.build(),
            nextBeforeRunNo: nextBeforeRunNo,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AnalysisRunHistoryPageResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
