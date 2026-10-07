import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/features/admin/presentation/analytics_axis_scale.dart';

void main() {
  test(
    'small daily counts have distinct integer ticks, including the maximum',
    () {
      for (var maximum = 1; maximum <= 4; maximum++) {
        final axis = AnalyticsAxisScale.counts(maximum);
        expect(axis.ticks, List.generate(maximum + 1, (i) => i));
        expect(axis.maximum, maximum);
      }
      expect(AnalyticsAxisScale.counts(2).ticks.reversed, [2, 1, 0]);
    },
  );

  test('an empty count range has a finite nonzero scale', () {
    final axis = AnalyticsAxisScale.counts(0);
    expect(axis.maximum, 1);
    expect(axis.ticks, [0, 1]);
  });

  test('larger counts use consistent integer steps and cover all data', () {
    expect(AnalyticsAxisScale.counts(5).ticks, [0, 2, 4, 6]);
    expect(AnalyticsAxisScale.counts(123).ticks, [0, 50, 100, 150]);
    for (final maximum in [
      5,
      7,
      8,
      9,
      20,
      21,
      99,
      100,
      101,
      999,
      10001,
      1000000,
    ]) {
      final axis = AnalyticsAxisScale.counts(maximum);
      expect(axis.maximum, greaterThanOrEqualTo(maximum));
      expect(axis.ticks.first, 0);
      expect(axis.ticks.last, axis.maximum);
      expect(axis.ticks.length, lessThanOrEqualTo(5));
      expect(axis.ticks.toSet().length, axis.ticks.length);
      for (var i = 1; i < axis.ticks.length; i++) {
        expect(axis.ticks[i] - axis.ticks[i - 1], axis.step);
      }
    }
  });

  test('percentage charts retain quarter ticks over the full range', () {
    const axis = AnalyticsAxisScale.percentage();
    expect(axis.maximum, 100);
    expect(axis.ticks, [0, 25, 50, 75, 100]);
  });
}
