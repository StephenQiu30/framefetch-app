// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_record_page_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HistoryRecordPageResponse extends HistoryRecordPageResponse {
  @override
  final BuiltList<ItemsInner> items;
  @override
  final HistoryRecordCursorResponse? nextCursor;

  factory _$HistoryRecordPageResponse(
          [void Function(HistoryRecordPageResponseBuilder)? updates]) =>
      (HistoryRecordPageResponseBuilder()..update(updates))._build();

  _$HistoryRecordPageResponse._({required this.items, this.nextCursor})
      : super._();
  @override
  HistoryRecordPageResponse rebuild(
          void Function(HistoryRecordPageResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HistoryRecordPageResponseBuilder toBuilder() =>
      HistoryRecordPageResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HistoryRecordPageResponse &&
        items == other.items &&
        nextCursor == other.nextCursor;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, nextCursor.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HistoryRecordPageResponse')
          ..add('items', items)
          ..add('nextCursor', nextCursor))
        .toString();
  }
}

class HistoryRecordPageResponseBuilder
    implements
        Builder<HistoryRecordPageResponse, HistoryRecordPageResponseBuilder> {
  _$HistoryRecordPageResponse? _$v;

  ListBuilder<ItemsInner>? _items;
  ListBuilder<ItemsInner> get items =>
      _$this._items ??= ListBuilder<ItemsInner>();
  set items(ListBuilder<ItemsInner>? items) => _$this._items = items;

  HistoryRecordCursorResponseBuilder? _nextCursor;
  HistoryRecordCursorResponseBuilder get nextCursor =>
      _$this._nextCursor ??= HistoryRecordCursorResponseBuilder();
  set nextCursor(HistoryRecordCursorResponseBuilder? nextCursor) =>
      _$this._nextCursor = nextCursor;

  HistoryRecordPageResponseBuilder() {
    HistoryRecordPageResponse._defaults(this);
  }

  HistoryRecordPageResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _nextCursor = $v.nextCursor?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HistoryRecordPageResponse other) {
    _$v = other as _$HistoryRecordPageResponse;
  }

  @override
  void update(void Function(HistoryRecordPageResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HistoryRecordPageResponse build() => _build();

  _$HistoryRecordPageResponse _build() {
    _$HistoryRecordPageResponse _$result;
    try {
      _$result = _$v ??
          _$HistoryRecordPageResponse._(
            items: items.build(),
            nextCursor: _nextCursor?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
        _$failedField = 'nextCursor';
        _nextCursor?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'HistoryRecordPageResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
