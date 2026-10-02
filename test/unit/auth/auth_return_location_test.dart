import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/routing/auth_return_location.dart';

void main() {
  test('preserves the in-app target, query and fragment', () {
    const target = '/history/activity?q=video%20report#recent';
    expect(safeAuthReturnLocation(target), target);
    expect(safeAuthReturnLocation('/?intake=video'), '/?intake=video');
  });

  test(
    'falls back for absent, external, malformed or authentication targets',
    () {
      for (final target in [
        null,
        '',
        'https://example.com',
        '//example.com',
        'history/activity',
        '/auth',
        '/auth/login?from=%2Fauth%2Fregister',
        '/%61uth/register',
      ]) {
        expect(safeAuthReturnLocation(target), '/', reason: '$target');
      }
    },
  );
}
