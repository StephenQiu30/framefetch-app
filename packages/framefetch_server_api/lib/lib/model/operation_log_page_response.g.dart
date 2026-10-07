// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_log_page_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OperationLogPageResponse extends OperationLogPageResponse {
  @override
  final BuiltList<OperationLogResponse> items;
  @override
  final int page;
  @override
  final int pageSize;
  @override
  final int total;

  factory _$OperationLogPageResponse(
          [void Function(OperationLogPageResponseBuilder)? updates]) =>
      (OperationLogPageResponseBuilder()..update(updates))._build();

  _$OperationLogPageResponse._(
      {required this.items,
      required this.page,
      required this.pageSize,
      required this.total})
      : super._();
  @override
  OperationLogPageResponse rebuild(
          void Function(OperationLogPageResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OperationLogPageResponseBuilder toBuilder() =>
      OperationLogPageResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OperationLogPageResponse &&
        items == other.items &&
        page == other.page &&
        pageSize == other.pageSize &&
        total == other.total;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jc(_$hash, pageSize.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OperationLogPageResponse')
          ..add('items', items)
          ..add('page', page)
          ..add('pageSize', pageSize)
          ..add('total', total))
        .toString();
  }
}

class OperationLogPageResponseBuilder
    implements
        Builder<OperationLogPageResponse, OperationLogPageResponseBuilder> {
  _$OperationLogPageResponse? _$v;

  ListBuilder<OperationLogResponse>? _items;
  ListBuilder<OperationLogResponse> get items =>
      _$this._items ??= ListBuilder<OperationLogResponse>();
  set items(ListBuilder<OperationLogResponse>? items) => _$this._items = items;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  int? _pageSize;
  int? get pageSize => _$this._pageSize;
  set pageSize(int? pageSize) => _$this._pageSize = pageSize;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  OperationLogPageResponseBuilder() {
    OperationLogPageResponse._defaults(this);
  }

  OperationLogPageResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _page = $v.page;
      _pageSize = $v.pageSize;
      _total = $v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OperationLogPageResponse other) {
    _$v = other as _$OperationLogPageResponse;
  }

  @override
  void update(void Function(OperationLogPageResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OperationLogPageResponse build() => _build();

  _$OperationLogPageResponse _build() {
    _$OperationLogPageResponse _$result;
    try {
      _$result = _$v ??
          _$OperationLogPageResponse._(
            items: items.build(),
            page: BuiltValueNullFieldError.checkNotNull(
                page, r'OperationLogPageResponse', 'page'),
            pageSize: BuiltValueNullFieldError.checkNotNull(
                pageSize, r'OperationLogPageResponse', 'pageSize'),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'OperationLogPageResponse', 'total'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'OperationLogPageResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
