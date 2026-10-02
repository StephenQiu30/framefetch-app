import 'package:flutter/material.dart';

bool publicHomeUsesColumns(BuildContext context, {double breakpoint = 1024}) =>
    MediaQuery.sizeOf(context).width /
        MediaQuery.textScalerOf(context).scale(1) >=
    breakpoint;

final class PublicHomeSplit extends StatelessWidget {
  const PublicHomeSplit({
    required this.first,
    required this.second,
    this.primary = false,
    super.key,
  });
  final Widget first;
  final Widget second;
  final bool primary;

  @override
  Widget build(BuildContext context) => publicHomeUsesColumns(context)
      ? Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: primary ? 3 : 1, child: first),
            const SizedBox(width: 96),
            Expanded(flex: primary ? 2 : 1, child: second),
          ],
        )
      : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [first, const SizedBox(height: 48), second],
        );
}

final class PublicHomeGrid extends StatelessWidget {
  const PublicHomeGrid({
    required this.children,
    required this.columns,
    this.spacing = 16,
    this.runSpacing = 40,
    super.key,
  });
  final List<Widget> children;
  final int columns;
  final double spacing;
  final double runSpacing;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final count = publicHomeUsesColumns(context, breakpoint: 768)
          ? columns
          : 1;
      final width = (constraints.maxWidth - spacing * (count - 1)) / count;
      return Wrap(
        spacing: spacing,
        runSpacing: runSpacing,
        children: [
          for (final child in children) SizedBox(width: width, child: child),
        ],
      );
    },
  );
}
