// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_provider_suggested_model_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiProviderSuggestedModelResponse
    extends AiProviderSuggestedModelResponse {
  @override
  final String id;
  @override
  final String label;
  @override
  final bool supportsVision;
  @override
  final String? notes;

  factory _$AiProviderSuggestedModelResponse(
          [void Function(AiProviderSuggestedModelResponseBuilder)? updates]) =>
      (AiProviderSuggestedModelResponseBuilder()..update(updates))._build();

  _$AiProviderSuggestedModelResponse._(
      {required this.id,
      required this.label,
      required this.supportsVision,
      this.notes})
      : super._();
  @override
  AiProviderSuggestedModelResponse rebuild(
          void Function(AiProviderSuggestedModelResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiProviderSuggestedModelResponseBuilder toBuilder() =>
      AiProviderSuggestedModelResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiProviderSuggestedModelResponse &&
        id == other.id &&
        label == other.label &&
        supportsVision == other.supportsVision &&
        notes == other.notes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, label.hashCode);
    _$hash = $jc(_$hash, supportsVision.hashCode);
    _$hash = $jc(_$hash, notes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiProviderSuggestedModelResponse')
          ..add('id', id)
          ..add('label', label)
          ..add('supportsVision', supportsVision)
          ..add('notes', notes))
        .toString();
  }
}

class AiProviderSuggestedModelResponseBuilder
    implements
        Builder<AiProviderSuggestedModelResponse,
            AiProviderSuggestedModelResponseBuilder> {
  _$AiProviderSuggestedModelResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _label;
  String? get label => _$this._label;
  set label(String? label) => _$this._label = label;

  bool? _supportsVision;
  bool? get supportsVision => _$this._supportsVision;
  set supportsVision(bool? supportsVision) =>
      _$this._supportsVision = supportsVision;

  String? _notes;
  String? get notes => _$this._notes;
  set notes(String? notes) => _$this._notes = notes;

  AiProviderSuggestedModelResponseBuilder() {
    AiProviderSuggestedModelResponse._defaults(this);
  }

  AiProviderSuggestedModelResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _label = $v.label;
      _supportsVision = $v.supportsVision;
      _notes = $v.notes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiProviderSuggestedModelResponse other) {
    _$v = other as _$AiProviderSuggestedModelResponse;
  }

  @override
  void update(void Function(AiProviderSuggestedModelResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiProviderSuggestedModelResponse build() => _build();

  _$AiProviderSuggestedModelResponse _build() {
    final _$result = _$v ??
        _$AiProviderSuggestedModelResponse._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'AiProviderSuggestedModelResponse', 'id'),
          label: BuiltValueNullFieldError.checkNotNull(
              label, r'AiProviderSuggestedModelResponse', 'label'),
          supportsVision: BuiltValueNullFieldError.checkNotNull(supportsVision,
              r'AiProviderSuggestedModelResponse', 'supportsVision'),
          notes: notes,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
