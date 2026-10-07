import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:framefetch/features/auth/data/profile_avatar_picker.dart';

void main() {
  test('rejects renamed nonimages, empty files and files beyond the limit', () {
    for (final bytes in [Uint8List(0), Uint8List(maxAvatarBytes + 1)]) {
      expect(() => validateAvatar(bytes), throwsA(AvatarSelectionFailure.size));
    }
    expect(
      () => validateAvatar(Uint8List.fromList('renamed.jpg'.codeUnits)),
      throwsA(AvatarSelectionFailure.type),
    );
  });

  test(
    'allows JPEG, PNG and WebP signatures before server image validation',
    () {
      for (final bytes in [
        [255, 216, 255, 0],
        [137, 80, 78, 71, 13, 10, 26, 10],
        'RIFF0000WEBP'.codeUnits,
      ]) {
        expect(
          () => validateAvatar(Uint8List.fromList(bytes)),
          returnsNormally,
        );
      }
    },
  );
}
