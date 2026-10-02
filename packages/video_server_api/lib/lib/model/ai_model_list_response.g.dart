// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_model_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiModelListResponse extends AiModelListResponse {
  @override
  final BuiltList<AiModelResponse> items;

  factory _$AiModelListResponse(
          [void Function(AiModelListResponseBuilder)? updates]) =>
      (AiModelListResponseBuilder()..update(updates))._build();

  _$AiModelListResponse._({required this.items}) : super._();
  @override
  AiModelListResponse rebuild(
          void Function(AiModelListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiModelListResponseBuilder toBuilder() =>
      AiModelListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiModelListResponse && items == other.items;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiModelListResponse')
          ..add('items', items))
        .toString();
  }
}

class AiModelListResponseBuilder
    implements Builder<AiModelListResponse, AiModelListResponseBuilder> {
  _$AiModelListResponse? _$v;

  ListBuilder<AiModelResponse>? _items;
  ListBuilder<AiModelResponse> get items =>
      _$this._items ??= ListBuilder<AiModelResponse>();
  set items(ListBuilder<AiModelResponse>? items) => _$this._items = items;

  AiModelListResponseBuilder() {
    AiModelListResponse._defaults(this);
  }

  AiModelListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiModelListResponse other) {
    _$v = other as _$AiModelListResponse;
  }

  @override
  void update(void Function(AiModelListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiModelListResponse build() => _build();

  _$AiModelListResponse _build() {
    _$AiModelListResponse _$result;
    try {
      _$result = _$v ??
          _$AiModelListResponse._(
            items: items.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiModelListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
