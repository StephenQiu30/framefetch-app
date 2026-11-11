// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_provider_preset_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiProviderPresetListResponse extends AiProviderPresetListResponse {
  @override
  final BuiltList<AiProviderPresetResponse> items;

  factory _$AiProviderPresetListResponse(
          [void Function(AiProviderPresetListResponseBuilder)? updates]) =>
      (AiProviderPresetListResponseBuilder()..update(updates))._build();

  _$AiProviderPresetListResponse._({required this.items}) : super._();
  @override
  AiProviderPresetListResponse rebuild(
          void Function(AiProviderPresetListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiProviderPresetListResponseBuilder toBuilder() =>
      AiProviderPresetListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiProviderPresetListResponse && items == other.items;
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
    return (newBuiltValueToStringHelper(r'AiProviderPresetListResponse')
          ..add('items', items))
        .toString();
  }
}

class AiProviderPresetListResponseBuilder
    implements
        Builder<AiProviderPresetListResponse,
            AiProviderPresetListResponseBuilder> {
  _$AiProviderPresetListResponse? _$v;

  ListBuilder<AiProviderPresetResponse>? _items;
  ListBuilder<AiProviderPresetResponse> get items =>
      _$this._items ??= ListBuilder<AiProviderPresetResponse>();
  set items(ListBuilder<AiProviderPresetResponse>? items) =>
      _$this._items = items;

  AiProviderPresetListResponseBuilder() {
    AiProviderPresetListResponse._defaults(this);
  }

  AiProviderPresetListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiProviderPresetListResponse other) {
    _$v = other as _$AiProviderPresetListResponse;
  }

  @override
  void update(void Function(AiProviderPresetListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiProviderPresetListResponse build() => _build();

  _$AiProviderPresetListResponse _build() {
    _$AiProviderPresetListResponse _$result;
    try {
      _$result = _$v ??
          _$AiProviderPresetListResponse._(
            items: items.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiProviderPresetListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
