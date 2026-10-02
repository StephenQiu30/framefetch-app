// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_record_kind.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const HistoryRecordKind _$parse = const HistoryRecordKind._('parse');
const HistoryRecordKind _$videoAnalysis =
    const HistoryRecordKind._('videoAnalysis');
const HistoryRecordKind _$documentParse =
    const HistoryRecordKind._('documentParse');
const HistoryRecordKind _$screenplayAnalysis =
    const HistoryRecordKind._('screenplayAnalysis');
const HistoryRecordKind _$unknownDefaultOpenApi =
    const HistoryRecordKind._('unknownDefaultOpenApi');

HistoryRecordKind _$valueOf(String name) {
  switch (name) {
    case 'parse':
      return _$parse;
    case 'videoAnalysis':
      return _$videoAnalysis;
    case 'documentParse':
      return _$documentParse;
    case 'screenplayAnalysis':
      return _$screenplayAnalysis;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<HistoryRecordKind> _$values =
    BuiltSet<HistoryRecordKind>(const <HistoryRecordKind>[
  _$parse,
  _$videoAnalysis,
  _$documentParse,
  _$screenplayAnalysis,
  _$unknownDefaultOpenApi,
]);

class _$HistoryRecordKindMeta {
  const _$HistoryRecordKindMeta();
  HistoryRecordKind get parse => _$parse;
  HistoryRecordKind get videoAnalysis => _$videoAnalysis;
  HistoryRecordKind get documentParse => _$documentParse;
  HistoryRecordKind get screenplayAnalysis => _$screenplayAnalysis;
  HistoryRecordKind get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  HistoryRecordKind valueOf(String name) => _$valueOf(name);
  BuiltSet<HistoryRecordKind> get values => _$values;
}

mixin _$HistoryRecordKindMixin {
  // ignore: non_constant_identifier_names
  _$HistoryRecordKindMeta get HistoryRecordKind =>
      const _$HistoryRecordKindMeta();
}

Serializer<HistoryRecordKind> _$historyRecordKindSerializer =
    _$HistoryRecordKindSerializer();

class _$HistoryRecordKindSerializer
    implements PrimitiveSerializer<HistoryRecordKind> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'parse': 'parse',
    'videoAnalysis': 'video_analysis',
    'documentParse': 'document_parse',
    'screenplayAnalysis': 'screenplay_analysis',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'parse': 'parse',
    'video_analysis': 'videoAnalysis',
    'document_parse': 'documentParse',
    'screenplay_analysis': 'screenplayAnalysis',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[HistoryRecordKind];
  @override
  final String wireName = 'HistoryRecordKind';

  @override
  Object serialize(Serializers serializers, HistoryRecordKind object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  HistoryRecordKind deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      HistoryRecordKind.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
