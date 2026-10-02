final class AnalyticsChartPoint {
  const AnalyticsChartPoint({
    required this.date,
    required this.total,
    required this.succeeded,
    required this.failed,
    required this.cancelled,
    this.active = 0,
  });
  final String date;
  final int total;
  final int succeeded;
  final int failed;
  final int cancelled;
  final int active;
  double get completionRate => total == 0 ? 0 : succeeded / total * 100;
}
