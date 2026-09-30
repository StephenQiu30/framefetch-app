// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screenplay_finding_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ScreenplayFindingResponse extends ScreenplayFindingResponse {
  @override
  final String id;
  @override
  final String title;
  @override
  final String description;

  factory _$ScreenplayFindingResponse(
          [void Function(ScreenplayFindingResponseBuilder)? updates]) =>
      (ScreenplayFindingResponseBuilder()..update(updates))._build();

  _$ScreenplayFindingResponse._(
      {required this.id, required this.title, required this.description})
      : super._();
  @override
  ScreenplayFindingResponse rebuild(
          void Function(ScreenplayFindingResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScreenplayFindingResponseBuilder toBuilder() =>
      ScreenplayFindingResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScreenplayFindingResponse &&
        id == other.id &&
        title == other.title &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScreenplayFindingResponse')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description))
        .toString();
  }
}

class ScreenplayFindingResponseBuilder
    implements
        Builder<ScreenplayFindingResponse, ScreenplayFindingResponseBuilder> {
  _$ScreenplayFindingResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ScreenplayFindingResponseBuilder() {
    ScreenplayFindingResponse._defaults(this);
  }

  ScreenplayFindingResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScreenplayFindingResponse other) {
    _$v = other as _$ScreenplayFindingResponse;
  }

  @override
  void update(void Function(ScreenplayFindingResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScreenplayFindingResponse build() => _build();

  _$ScreenplayFindingResponse _build() {
    final _$result = _$v ??
        _$ScreenplayFindingResponse._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'ScreenplayFindingResponse', 'id'),
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'ScreenplayFindingResponse', 'title'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'ScreenplayFindingResponse', 'description'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
