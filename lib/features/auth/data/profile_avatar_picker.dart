import 'dart:typed_data';

import 'package:file_selector/file_selector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const maxAvatarBytes = 4 * 1024 * 1024;

enum AvatarSelectionFailure { type, size }

final profileAvatarPickerProvider = Provider(
  (ref) => const ProfileAvatarPicker(),
);

class ProfileAvatarPicker {
  const ProfileAvatarPicker();

  Future<Uint8List?> pick() async {
    final file = await openFile(
      acceptedTypeGroups: const [
        XTypeGroup(
          label: 'JPEG / PNG / WebP',
          extensions: ['jpg', 'jpeg', 'png', 'webp'],
          mimeTypes: ['image/jpeg', 'image/png', 'image/webp'],
          uniformTypeIdentifiers: [
            'public.jpeg',
            'public.png',
            'org.webmproject.webp',
          ],
        ),
      ],
    );
    if (file == null) return null;
    final length = await file.length();
    if (length == 0 || length > maxAvatarBytes) {
      throw AvatarSelectionFailure.size;
    }
    final bytes = await file.readAsBytes();
    validateAvatar(bytes);
    return bytes;
  }
}

/// File names and picker MIME hints are advisory. Check the actual signature.
void validateAvatar(Uint8List bytes) {
  if (bytes.isEmpty || bytes.length > maxAvatarBytes) {
    throw AvatarSelectionFailure.size;
  }
  final jpeg =
      bytes.length >= 3 &&
      bytes[0] == 0xff &&
      bytes[1] == 0xd8 &&
      bytes[2] == 0xff;
  final png =
      bytes.length >= 8 &&
      [
        137,
        80,
        78,
        71,
        13,
        10,
        26,
        10,
      ].indexed.every((item) => bytes[item.$1] == item.$2);
  final webp =
      bytes.length >= 12 &&
      String.fromCharCodes(bytes.sublist(0, 4)) == 'RIFF' &&
      String.fromCharCodes(bytes.sublist(8, 12)) == 'WEBP';
  if (!jpeg && !png && !webp) throw AvatarSelectionFailure.type;
}
