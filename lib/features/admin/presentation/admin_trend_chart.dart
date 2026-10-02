import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/admin/presentation/analytics_chart_point.dart';
import 'package:framegrab/features/admin/presentation/analytics_trend_painter.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class AdminTrendChart extends StatefulWidget {
  const AdminTrendChart({
    required this.points,
    required this.title,
    this.percentage = false,
    super.key,
  });
  final List<AnalyticsChartPoint> points;
  final String title;
  final bool percentage;
  @override
  State<AdminTrendChart> createState() => _AdminTrendChartState();
}

final class _AdminTrendChartState extends State<AdminTrendChart> {
  int? _selected;
  void _select(int value) =>
      setState(() => _selected = value.clamp(0, widget.points.length - 1));
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final colors = ShadTheme.of(context).colorScheme;
    if (widget.points.isEmpty) return const SizedBox.shrink();
    final selected = (_selected ?? widget.points.length - 1).clamp(
      0,
      widget.points.length - 1,
    );
    final point = widget.points[selected];
    String pointLabel(AnalyticsChartPoint point) => widget.percentage
        ? '${point.date} · ${l.adminSuccessRate}: ${point.completionRate.toStringAsFixed(1)}%'
        : '${point.date} · ${l.totalLabel}: ${point.total} · ${l.succeededLabel}: ${point.succeeded}';
    final selectedLabel = pointLabel(point);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(widget.title, style: ShadTheme.of(context).textTheme.h4),
        const SizedBox(height: AppSpacing.medium),
        LayoutBuilder(
          builder: (context, constraints) => Semantics(
            label: widget.title,
            value: selectedLabel,
            increasedValue: selected < widget.points.length - 1
                ? pointLabel(widget.points[selected + 1])
                : null,
            decreasedValue: selected > 0
                ? pointLabel(widget.points[selected - 1])
                : null,
            onIncrease: selected < widget.points.length - 1
                ? () => _select(selected + 1)
                : null,
            onDecrease: selected > 0 ? () => _select(selected - 1) : null,
            child: Focus(
              onKeyEvent: (_, event) {
                if (event is! KeyDownEvent) return KeyEventResult.ignored;
                if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
                  _select(selected - 1);
                  return KeyEventResult.handled;
                }
                if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
                  _select(selected + 1);
                  return KeyEventResult.handled;
                }
                return KeyEventResult.ignored;
              },
              child: GestureDetector(
                onTapDown: (details) => _select(
                  (((details.localPosition.dx - AnalyticsTrendPainter.left) /
                              (constraints.maxWidth -
                                  AnalyticsTrendPainter.left -
                                  AnalyticsTrendPainter.right)) *
                          (widget.points.length - 1))
                      .round(),
                ),
                child: SizedBox(
                  height: constraints.maxWidth >= 700 ? 280 : 220,
                  child: CustomPaint(
                    key: Key(
                      widget.percentage
                          ? 'admin-completion-chart'
                          : 'admin-trend-chart',
                    ),
                    painter: AnalyticsTrendPainter(
                      points: widget.points,
                      selected: selected,
                      percentage: widget.percentage,
                      primary: colors.custom['chart-1'] ?? colors.primary,
                      secondary: colors.custom['chart-2'] ?? colors.secondary,
                      grid: colors.border,
                      style: ShadTheme.of(
                        context,
                      ).textTheme.muted.copyWith(fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.small),
        Semantics(
          liveRegion: true,
          child: Text(
            selectedLabel,
            style: ShadTheme.of(context).textTheme.muted,
          ),
        ),
        if (!widget.percentage)
          ShadAccordion<String>(
            children: [
              ShadAccordionItem(
                value: 'details',
                title: Text(l.adminTrendDetails),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (final day in widget.points)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.small,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(day.date),
                            Text(
                              '${l.totalLabel}: ${day.total} · ${l.succeededLabel}: ${day.succeeded} · ${l.failedLabel}: ${day.failed} · ${l.cancelledLabel}: ${day.cancelled} · ${l.activeLabel}: ${day.active}',
                              style: ShadTheme.of(context).textTheme.muted,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }
}
