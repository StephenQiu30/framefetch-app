import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/auth/domain/username.dart';

void main() {
  test('matches the service username character contract', () {
    expect(isValidUsername('framefetch_user-01'), isTrue);
    expect(isValidUsername('帧取用户_01'), isTrue);
    expect(isValidUsername('𠀀a'), isTrue);
    expect(isValidUsername('FrameFetch QA User'), isFalse);
    expect(isValidUsername('framefetch@example'), isFalse);
  });

  test('trims the username before validation and submission', () {
    expect(normalizeUsername('  framefetch_user  '), 'framefetch_user');
    expect(normalizeUsername('  ｌａｙｏｕｔ－ｕｓｅｒ  '), 'layout-user');
    expect(isValidUsername('  framefetch_user  '), isTrue);
    expect(isValidUsername('  ｌａｙｏｕｔ－ｕｓｅｒ  '), isTrue);
  });
}
