import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final activityHistoryForegroundProvider =
    NotifierProvider.autoDispose<ActivityHistoryForeground, bool>(
      ActivityHistoryForeground.new,
    );

final class ActivityHistoryForeground extends Notifier<bool>
    with WidgetsBindingObserver {
  @override
  bool build() {
    final binding = WidgetsBinding.instance;
    binding.addObserver(this);
    ref.onDispose(() => binding.removeObserver(this));
    return binding.lifecycleState == null ||
        binding.lifecycleState == AppLifecycleState.resumed;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    this.state = state == AppLifecycleState.resumed;
  }
}
