import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class AdminDistributionChart extends StatelessWidget {
  const AdminDistributionChart({
    required this.title,
    required this.values,
    super.key,
  });
  final String title;
  final List<(String, int)> values;
  @override
  Widget build(BuildContext context) {
    final scheme = ShadTheme.of(context).colorScheme;
    final total = values.fold<int>(0, (sum, entry) => sum + entry.$2);
    final colors = [
      for (var index = 0; index < values.length; index++)
        scheme.custom['chart-${index % 5 + 1}'] ?? scheme.primary,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: ShadTheme.of(context).textTheme.h4),
        const SizedBox(height: AppSpacing.medium),
        LayoutBuilder(
          builder: (context, constraints) {
            final plot = Semantics(
              label: title,
              value: '$total',
              child: SizedBox(
                width: 180,
                height: 180,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      child: CustomPaint(
                        painter: _DistributionPainter(
                          values: [for (final entry in values) entry.$2],
                          colors: colors,
                          empty: scheme.muted,
                        ),
                      ),
                    ),
                    Text('$total', style: ShadTheme.of(context).textTheme.h3),
                  ],
                ),
              ),
            );
            final details = Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var index = 0; index < values.length; index++)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.small,
                    ),
                    child: Row(
                      children: [
                        Container(width: 8, height: 8, color: colors[index]),
                        const SizedBox(width: AppSpacing.small),
                        Expanded(child: Text(values[index].$1)),
                        const SizedBox(width: AppSpacing.small),
                        Text(
                          '${values[index].$2} · ${(total == 0 ? 0 : values[index].$2 / total * 100).toStringAsFixed(1)}%',
                        ),
                      ],
                    ),
                  ),
              ],
            );
            return constraints.maxWidth >= 420
                ? Row(
                    children: [
                      plot,
                      const SizedBox(width: AppSpacing.large),
                      Expanded(child: details),
                    ],
                  )
                : Column(
                    children: [
                      plot,
                      const SizedBox(height: AppSpacing.medium),
                      details,
                    ],
                  );
          },
        ),
      ],
    );
  }
}

final class _DistributionPainter extends CustomPainter {
  const _DistributionPainter({
    required this.values,
    required this.colors,
    required this.empty,
  });
  final List<int> values;
  final List<Color> colors;
  final Color empty;
  @override
  void paint(Canvas canvas, Size size) {
    final total = values.fold<int>(0, (sum, value) => sum + value);
    final rect = Rect.fromCircle(
      center: size.center(Offset.zero),
      radius: size.shortestSide * .38,
    );
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.shortestSide * .14;
    if (total == 0) {
      canvas.drawOval(rect, paint..color = empty);
      return;
    }
    var start = -math.pi / 2;
    for (var index = 0; index < values.length; index++) {
      final sweep = values[index] / total * math.pi * 2;
      if (sweep > 0) {
        canvas.drawArc(
          rect,
          start + .015,
          math.max(0, sweep - .03),
          false,
          paint..color = colors[index],
        );
      }
      start += sweep;
    }
  }

  @override
  bool shouldRepaint(covariant _DistributionPainter oldDelegate) =>
      values != oldDelegate.values ||
      colors != oldDelegate.colors ||
      empty != oldDelegate.empty;
}
