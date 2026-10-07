import 'package:framefetch_server_api/framefetch_server_api.dart';

enum AnalysisAction { idle, start, cancel, retry, delete, refresh }

final class AnalysisState {
  const AnalysisState({
    this.action = AnalysisAction.idle,
    this.actionError,
    this.submissionUnknown = false,
    this.job,
    this.skills = const [],
  });

  final AnalysisAction action;
  final Object? actionError;
  final bool submissionUnknown;
  final AnalysisResponse? job;
  final List<AnalysisSkillResponse> skills;

  bool get busy => action != AnalysisAction.idle;

  AnalysisState copyWith({
    AnalysisAction? action,
    bool? submissionUnknown,
    Object? actionError,
    bool clearActionError = false,
    AnalysisResponse? job,
    bool clearJob = false,
    List<AnalysisSkillResponse>? skills,
  }) => AnalysisState(
    action: action ?? this.action,
    submissionUnknown: submissionUnknown ?? this.submissionUnknown,
    actionError: clearActionError ? null : actionError ?? this.actionError,
    job: clearJob ? null : job ?? this.job,
    skills: skills ?? this.skills,
  );
}
