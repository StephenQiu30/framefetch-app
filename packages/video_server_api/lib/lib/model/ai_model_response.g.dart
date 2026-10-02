// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_model_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiModelResponse extends AiModelResponse {
  @override
  final String id;
  @override
  final String name;
  @override
  final int contextLength;
  @override
  final BuiltList<String> inputModalities;
  @override
  final BuiltList<String> outputModalities;
  @override
  final BuiltList<String> supportedParameters;

  factory _$AiModelResponse([void Function(AiModelResponseBuilder)? updates]) =>
      (AiModelResponseBuilder()..update(updates))._build();

  _$AiModelResponse._(
      {required this.id,
      required this.name,
      required this.contextLength,
      required this.inputModalities,
      required this.outputModalities,
      required this.supportedParameters})
      : super._();
  @override
  AiModelResponse rebuild(void Function(AiModelResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiModelResponseBuilder toBuilder() => AiModelResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiModelResponse &&
        id == other.id &&
        name == other.name &&
        contextLength == other.contextLength &&
        inputModalities == other.inputModalities &&
        outputModalities == other.outputModalities &&
        supportedParameters == other.supportedParameters;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, contextLength.hashCode);
    _$hash = $jc(_$hash, inputModalities.hashCode);
    _$hash = $jc(_$hash, outputModalities.hashCode);
    _$hash = $jc(_$hash, supportedParameters.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiModelResponse')
          ..add('id', id)
          ..add('name', name)
          ..add('contextLength', contextLength)
          ..add('inputModalities', inputModalities)
          ..add('outputModalities', outputModalities)
          ..add('supportedParameters', supportedParameters))
        .toString();
  }
}

class AiModelResponseBuilder
    implements Builder<AiModelResponse, AiModelResponseBuilder> {
  _$AiModelResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _contextLength;
  int? get contextLength => _$this._contextLength;
  set contextLength(int? contextLength) =>
      _$this._contextLength = contextLength;

  ListBuilder<String>? _inputModalities;
  ListBuilder<String> get inputModalities =>
      _$this._inputModalities ??= ListBuilder<String>();
  set inputModalities(ListBuilder<String>? inputModalities) =>
      _$this._inputModalities = inputModalities;

  ListBuilder<String>? _outputModalities;
  ListBuilder<String> get outputModalities =>
      _$this._outputModalities ??= ListBuilder<String>();
  set outputModalities(ListBuilder<String>? outputModalities) =>
      _$this._outputModalities = outputModalities;

  ListBuilder<String>? _supportedParameters;
  ListBuilder<String> get supportedParameters =>
      _$this._supportedParameters ??= ListBuilder<String>();
  set supportedParameters(ListBuilder<String>? supportedParameters) =>
      _$this._supportedParameters = supportedParameters;

  AiModelResponseBuilder() {
    AiModelResponse._defaults(this);
  }

  AiModelResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _contextLength = $v.contextLength;
      _inputModalities = $v.inputModalities.toBuilder();
      _outputModalities = $v.outputModalities.toBuilder();
      _supportedParameters = $v.supportedParameters.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiModelResponse other) {
    _$v = other as _$AiModelResponse;
  }

  @override
  void update(void Function(AiModelResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiModelResponse build() => _build();

  _$AiModelResponse _build() {
    _$AiModelResponse _$result;
    try {
      _$result = _$v ??
          _$AiModelResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AiModelResponse', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'AiModelResponse', 'name'),
            contextLength: BuiltValueNullFieldError.checkNotNull(
                contextLength, r'AiModelResponse', 'contextLength'),
            inputModalities: inputModalities.build(),
            outputModalities: outputModalities.build(),
            supportedParameters: supportedParameters.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'inputModalities';
        inputModalities.build();
        _$failedField = 'outputModalities';
        outputModalities.build();
        _$failedField = 'supportedParameters';
        supportedParameters.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiModelResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
