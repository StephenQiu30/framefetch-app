/// Integer chart ticks with at most four intervals and a nonzero range.
final class AnalyticsAxisScale {
  const AnalyticsAxisScale._(this.maximum, this.step);

  const AnalyticsAxisScale.percentage() : maximum = 100, step = 25;

  factory AnalyticsAxisScale.counts(int maximum) {
    final bounded = maximum < 1 ? 1 : maximum;
    if (bounded <= 4) return AnalyticsAxisScale._(bounded, 1);
    final minimumStep = (bounded / 4).ceil();
    var magnitude = 1;
    while (magnitude * 10 <= minimumStep) {
      magnitude *= 10;
    }
    final step = [1, 2, 5, 10]
        .map((multiple) => multiple * magnitude)
        .firstWhere((candidate) => candidate >= minimumStep);
    return AnalyticsAxisScale._((bounded / step).ceil() * step, step);
  }

  final int maximum;
  final int step;

  List<int> get ticks => List.generate(maximum ~/ step + 1, (i) => i * step);
}
