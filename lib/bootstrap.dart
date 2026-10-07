import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framefetch/app/app.dart';
import 'package:media_kit/media_kit.dart';

void bootstrap() {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();

  runApp(const ProviderScope(child: FramefetchApp(locale: Locale('zh'))));
}
