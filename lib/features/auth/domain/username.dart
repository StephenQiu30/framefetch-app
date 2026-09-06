import 'package:unorm_dart/unorm_dart.dart' as unorm;

const usernameMinimumLength = 2;
const usernameMaximumLength = 32;

final RegExp _usernamePattern = RegExp(r'^[\p{L}\p{N}_.-]+$', unicode: true);

String normalizeUsername(String value) => unorm.nfkc(value).trim();

bool isValidUsername(String value) {
  final normalized = normalizeUsername(value);
  final length = normalized.runes.length;
  return length >= usernameMinimumLength &&
      length <= usernameMaximumLength &&
      _usernamePattern.hasMatch(normalized);
}
