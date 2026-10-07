import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:framefetch/features/admin/presentation/analytics_axis_scale.dart';
import 'package:framefetch/features/admin/presentation/analytics_chart_point.dart';

final class AnalyticsTrendPainter extends CustomPainter {
  AnalyticsTrendPainter({
    required this.points,
    required this.primary,
    required this.secondary,
    required this.grid,
    required this.style,
    required this.selected,
    this.percentage = false,
  });
  final List<AnalyticsChartPoint> points;
  final Color primary;
  final Color secondary;
  final Color grid;
  final TextStyle style;
  final int selected;
  final bool percentage;
  static const left = 40.0;
  static const right = 16.0;
  static const top = 12.0;
  static const bottom = 32.0;
  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) return;
    final width = size.width - left - right;
    final height = size.height - top - bottom;
    final axis = percentage
        ? const AnalyticsAxisScale.percentage()
        : AnalyticsAxisScale.counts(
            points.fold<int>(0, (max, p) => math.max(max, p.total)),
          );
    double x(int index) =>
        left + (points.length == 1 ? .5 : index / (points.length - 1)) * width;
    double y(num value) => top + height - (value / axis.maximum) * height;
    final paint = Paint()
      ..color = grid
      ..strokeWidth = 1;
    for (final value in axis.ticks.reversed) {
      final position = y(value);
      canvas.drawLine(
        Offset(left, position),
        Offset(size.width - right, position),
        paint,
      );
      _label(
        canvas,
        percentage ? '$value%' : '$value',
        Offset(0, position - 8),
      );
    }
    void series(num Function(AnalyticsChartPoint) value, Color color) {
      final line = Path();
      for (var i = 0; i < points.length; i++) {
        i == 0
            ? line.moveTo(x(i), y(value(points[i])))
            : line.lineTo(x(i), y(value(points[i])));
      }
      final fill = Path.from(line)
        ..lineTo(x(points.length - 1), top + height)
        ..lineTo(x(0), top + height)
        ..close();
      canvas.drawPath(fill, Paint()..color = color.withValues(alpha: .2));
      canvas.drawPath(
        line,
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
      );
      if (points.length == 1) {
        canvas.drawCircle(
          Offset(x(0), y(value(points[0]))),
          3,
          Paint()..color = color,
        );
      }
    }

    if (!percentage) series((p) => p.total, secondary);
    series((p) => percentage ? p.completionRate : p.succeeded, primary);
    final selectedX = x(selected.clamp(0, points.length - 1));
    canvas.drawLine(
      Offset(selectedX, top),
      Offset(selectedX, top + height),
      Paint()
        ..color = primary.withValues(alpha: .4)
        ..strokeWidth = 1,
    );
    for (final index in {0, points.length ~/ 2, points.length - 1}) {
      final date = points[index].date.substring(5);
      _label(canvas, date, Offset(x(index), size.height - 20), centered: true);
    }
  }

  void _label(
    Canvas canvas,
    String text,
    Offset offset, {
    bool centered = false,
  }) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout();
    painter.paint(
      canvas,
      centered ? offset - Offset(painter.width / 2, 0) : offset,
    );
  }

  @override
  bool shouldRepaint(covariant AnalyticsTrendPainter oldDelegate) =>
      points != oldDelegate.points ||
      selected != oldDelegate.selected ||
      primary != oldDelegate.primary ||
      grid != oldDelegate.grid ||
      percentage != oldDelegate.percentage;
}
