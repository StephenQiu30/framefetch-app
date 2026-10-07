import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framefetch/features/auth/application/auth_session_controller.dart';
import 'package:framefetch/features/download/presentation/content_intake_selector.dart';
import 'package:framefetch/features/download/presentation/download_home_screen.dart';
import 'package:framefetch/features/landing/presentation/public_home_screen.dart';

final class RootScreen extends ConsumerWidget {
  const RootScreen({
    this.initialIntakeMode = ContentIntakeMode.link,
    super.key,
  });
  final ContentIntakeMode initialIntakeMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signedIn = ref.watch(
      authSessionProvider.select((session) => session.isSignedIn),
    );
    return signedIn
        ? DownloadHomeScreen(initialIntakeMode: initialIntakeMode)
        : const PublicHomeScreen();
  }
}
