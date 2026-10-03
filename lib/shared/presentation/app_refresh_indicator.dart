import 'package:flutter/material.dart';
import 'package:framegrab/shared/presentation/app_loading.dart';

/// Native pull gesture with the same compact loading indicator as pages.
final class AppRefreshIndicator extends StatefulWidget {
  const AppRefreshIndicator({
    required this.child,
    required this.onRefresh,
    required this.label,
    super.key,
  });
  final Widget child;
  final Future<void> Function() onRefresh;
  final String label;

  @override
  State<AppRefreshIndicator> createState() => _AppRefreshIndicatorState();
}

final class _AppRefreshIndicatorState extends State<AppRefreshIndicator> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      RefreshIndicator.noSpinner(
        onRefresh: widget.onRefresh,
        semanticsLabel: widget.label,
        onStatusChange: (status) {
          final visible =
              status == RefreshIndicatorStatus.drag ||
              status == RefreshIndicatorStatus.armed ||
              status == RefreshIndicatorStatus.snap ||
              status == RefreshIndicatorStatus.refresh;
          if (mounted && _visible != visible) {
            setState(() => _visible = visible);
          }
        },
        child: widget.child,
      ),
      if (_visible)
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: IgnorePointer(
            child: AppLoading(
              key: const Key('app-refresh-loading'),
              label: widget.label,
              compact: true,
            ),
          ),
        ),
    ],
  );
}
