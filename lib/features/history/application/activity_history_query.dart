import 'package:framefetch_server_api/framefetch_server_api.dart';

enum ActivityCategory { all, parse, video, screenplay }

enum ScreenplayHistoryMode { all, basic, analysis, rewrite }

const _unchanged = Object();

final class ActivityHistoryQuery {
  const ActivityHistoryQuery({
    this.category = ActivityCategory.all,
    this.screenplayMode = ScreenplayHistoryMode.all,
    this.status,
    this.search = '',
    this.createdFrom,
    this.createdTo,
    this.skillId,
    this.documentId,
    this.downloadId,
    this.pageSize = 10,
    this.cursor,
  });

  final ActivityCategory category;
  final ScreenplayHistoryMode screenplayMode;
  final HistoryStatusGroup? status;
  final String search;
  final DateTime? createdFrom;
  final DateTime? createdTo;
  final String? skillId;
  final String? documentId;
  final String? downloadId;
  final int pageSize;
  final HistoryRecordCursorResponse? cursor;

  List<HistoryRecordKind> get recordTypes => switch (category) {
    ActivityCategory.all => const [],
    ActivityCategory.parse => [HistoryRecordKind.parse],
    ActivityCategory.video => [HistoryRecordKind.videoAnalysis],
    ActivityCategory.screenplay => switch (screenplayMode) {
      ScreenplayHistoryMode.basic => [HistoryRecordKind.documentParse],
      ScreenplayHistoryMode.all => [
        HistoryRecordKind.documentParse,
        HistoryRecordKind.screenplayAnalysis,
      ],
      _ => [HistoryRecordKind.screenplayAnalysis],
    },
  };

  AnalysisResultContract? get resultContract =>
      category != ActivityCategory.screenplay
      ? null
      : switch (screenplayMode) {
          ScreenplayHistoryMode.analysis =>
            AnalysisResultContract.screenplayAnalysis,
          ScreenplayHistoryMode.rewrite =>
            AnalysisResultContract.screenplayRewrite,
          _ => null,
        };

  ActivityHistoryQuery filter({
    ActivityCategory? category,
    ScreenplayHistoryMode? screenplayMode,
    Object? status = _unchanged,
    String? search,
    Object? createdFrom = _unchanged,
    Object? createdTo = _unchanged,
    Object? skillId = _unchanged,
    int? pageSize,
  }) => ActivityHistoryQuery(
    category: category ?? this.category,
    screenplayMode: screenplayMode ?? this.screenplayMode,
    status: identical(status, _unchanged)
        ? this.status
        : status as HistoryStatusGroup?,
    search: search ?? this.search,
    createdFrom: identical(createdFrom, _unchanged)
        ? this.createdFrom
        : createdFrom as DateTime?,
    createdTo: identical(createdTo, _unchanged)
        ? this.createdTo
        : createdTo as DateTime?,
    skillId: identical(skillId, _unchanged) ? this.skillId : skillId as String?,
    documentId: documentId,
    downloadId: downloadId,
    pageSize: pageSize ?? this.pageSize,
  );

  ActivityHistoryQuery at(HistoryRecordCursorResponse? value) =>
      ActivityHistoryQuery(
        category: category,
        screenplayMode: screenplayMode,
        status: status,
        search: search,
        createdFrom: createdFrom,
        createdTo: createdTo,
        skillId: skillId,
        documentId: documentId,
        downloadId: downloadId,
        pageSize: pageSize,
        cursor: value,
      );

  static DateTime? dateBoundary(String value, {bool end = false}) {
    if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(value)) return null;
    final parsed = DateTime.tryParse(value);
    if (parsed == null || parsed.toIso8601String().substring(0, 10) != value) {
      return null;
    }
    return (end ? DateTime(parsed.year, parsed.month, parsed.day + 1) : parsed)
        .toUtc();
  }

  @override
  bool operator ==(Object other) =>
      other is ActivityHistoryQuery &&
      category == other.category &&
      screenplayMode == other.screenplayMode &&
      status == other.status &&
      search == other.search &&
      createdFrom == other.createdFrom &&
      createdTo == other.createdTo &&
      skillId == other.skillId &&
      documentId == other.documentId &&
      downloadId == other.downloadId &&
      pageSize == other.pageSize &&
      cursor == other.cursor;

  @override
  int get hashCode => Object.hash(
    category,
    screenplayMode,
    status,
    search,
    createdFrom,
    createdTo,
    skillId,
    documentId,
    downloadId,
    pageSize,
    cursor,
  );
}
