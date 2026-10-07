import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framefetch/features/analysis/data/analysis_history_repository.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

final analysisHistoryRecordProvider = FutureProvider.autoDispose
    .family<Object, String>(
      (ref, id) => ref.watch(analysisHistoryRepositoryProvider).fetchRecord(id),
      retry: (_, _) => null,
    );

typedef AnalysisRunsQuery = ({String id, int? before, int pageSize, int runNo});

final analysisRunsProvider = FutureProvider.autoDispose
    .family<AnalysisRunHistoryPageResponse, AnalysisRunsQuery>(
      (ref, query) => ref
          .watch(analysisHistoryRepositoryProvider)
          .fetchRuns(query.id, before: query.before, pageSize: query.pageSize),
      retry: (_, _) => null,
    );
