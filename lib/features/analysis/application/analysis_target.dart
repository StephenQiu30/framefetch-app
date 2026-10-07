import 'package:framefetch_server_api/framefetch_server_api.dart';

final class AnalysisTarget {
  const AnalysisTarget.video(this.id)
    : inputKind = AnalysisInputKind.video,
      isRecord = false;

  const AnalysisTarget.screenplay(this.id)
    : inputKind = AnalysisInputKind.screenplay,
      isRecord = false;

  const AnalysisTarget.record(this.id, {required this.inputKind})
    : isRecord = true;

  final String id;
  final AnalysisInputKind inputKind;
  final bool isRecord;

  bool get isScreenplay => inputKind == AnalysisInputKind.screenplay;

  @override
  bool operator ==(Object other) =>
      other is AnalysisTarget &&
      other.id == id &&
      other.inputKind == inputKind &&
      other.isRecord == isRecord;

  @override
  int get hashCode => Object.hash(id, inputKind, isRecord);
}
