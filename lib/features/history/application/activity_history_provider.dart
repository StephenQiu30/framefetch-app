import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/analysis/data/analysis_repository.dart';
import 'package:framegrab/features/history/application/activity_history_lifecycle.dart';
import 'package:framegrab/features/history/application/activity_history_query.dart';
import 'package:framegrab/features/history/data/activity_history_repository.dart';
import 'package:video_server_api/video_server_api.dart';

final activitySkillsProvider =
    FutureProvider.autoDispose<List<AnalysisSkillResponse>>((ref) async {
      final repository = ref.watch(analysisRepositoryProvider);
      final kinds = await Future.wait([
        repository.fetchSkills(AnalysisInputKind.video),
        repository.fetchSkills(AnalysisInputKind.screenplay),
      ]);
      return {
        for (final skills in kinds)
          for (final skill in skills) skill.id: skill,
      }.values.toList(growable: false);
    }, retry: (_, _) => null);

final activityHistoryProvider = FutureProvider.autoDispose
    .family<HistoryRecordPageResponse, ActivityHistoryQuery>((
      ref,
      query,
    ) async {
      Timer? timer;
      ref.onDispose(() => timer?.cancel());
      ref.listen(activityHistoryForegroundProvider, (_, foreground) {
        timer?.cancel();
        if (foreground) ref.invalidateSelf();
      });
      final data = await ref
          .watch(activityHistoryRepositoryProvider)
          .fetch(query);
      if (ref.mounted &&
          ref.read(activityHistoryForegroundProvider) &&
          data.items.any(_processing)) {
        timer = Timer(const Duration(seconds: 3), ref.invalidateSelf);
      }
      return data;
    }, retry: (_, _) => null);

bool _processing(ItemsInner item) => switch (item.oneOf.value) {
  final ParseHistoryRecordResponse record =>
    record.statusGroup == HistoryStatusGroup.processing,
  final DocumentParseHistoryRecordResponse record =>
    record.statusGroup == HistoryStatusGroup.processing,
  final VideoAnalysisHistoryRecordResponse record =>
    record.statusGroup == HistoryStatusGroup.processing,
  final ScreenplayAnalysisHistoryRecordResponse record =>
    record.statusGroup == HistoryStatusGroup.processing,
  _ => false,
};
