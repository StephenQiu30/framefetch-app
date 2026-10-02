import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/app/router/app_router.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';

void main() {
  group('authRedirect', () {
    test(
      'all resource pages are public during restore and while signed out',
      () {
        for (final phase in [
          AuthSessionPhase.restoring,
          AuthSessionPhase.signedOut,
        ]) {
          for (final path in ['/guide', '/self-hosting', '/about']) {
            expect(
              authRedirect(phase: phase, isAdmin: false, uri: Uri.parse(path)),
              isNull,
            );
          }
        }
      },
    );

    test('sign-in preserves the protected destination and query', () {
      final uri = Uri.parse('/analyses/analysis-1?run=recent');
      final target = authRedirect(
        phase: AuthSessionPhase.signedOut,
        isAdmin: false,
        uri: uri,
      );
      expect(Uri.parse(target!).queryParameters['from'], uri.toString());
      expect(
        authRedirect(
          phase: AuthSessionPhase.signedIn,
          isAdmin: false,
          uri: Uri.parse(target),
        ),
        uri.toString(),
      );
    });

    test(
      'cold start without a credential preserves the sign-in destination',
      () {
        final destination = Uri.parse('/analyses/analysis-1?run=recent');
        final restoring = authRedirect(
          phase: AuthSessionPhase.restoring,
          isAdmin: false,
          uri: destination,
        );
        final login = authRedirect(
          phase: AuthSessionPhase.signedOut,
          isAdmin: false,
          uri: Uri.parse(restoring!),
        );
        expect(Uri.parse(login!).path, '/auth/login');
        expect(
          Uri.parse(login).queryParameters['from'],
          destination.toString(),
        );
        expect(
          authRedirect(
            phase: AuthSessionPhase.signedIn,
            isAdmin: false,
            uri: Uri.parse(login),
          ),
          destination.toString(),
        );
      },
    );

    test('nonadministrators cannot access operation logs', () {
      expect(
        authRedirect(
          phase: AuthSessionPhase.signedIn,
          isAdmin: false,
          uri: Uri.parse('/admin/operation-logs'),
        ),
        '/',
      );
    });
    test('keeps public guide visible while the session is restoring', () {
      expect(
        authRedirect(
          phase: AuthSessionPhase.restoring,
          isAdmin: false,
          uri: Uri.parse('/guide'),
        ),
        isNull,
      );
    });

    test('restores a protected deep link after authentication', () {
      final restoringLocation = authRedirect(
        phase: AuthSessionPhase.restoring,
        isAdmin: true,
        uri: Uri.parse('/admin/analytics'),
      );

      expect(restoringLocation, '/auth/restoring?from=%2Fadmin%2Fanalytics');
      expect(
        authRedirect(
          phase: AuthSessionPhase.signedIn,
          isAdmin: true,
          uri: Uri.parse(restoringLocation!),
        ),
        '/admin/analytics',
      );
    });

    test('rejects external and authentication return locations', () {
      for (final from in [
        'https://example.com',
        '//example.com',
        '/auth/login',
      ]) {
        expect(
          authRedirect(
            phase: AuthSessionPhase.signedIn,
            isAdmin: true,
            uri: Uri(path: '/auth/restoring', queryParameters: {'from': from}),
          ),
          '/',
        );
      }
    });
  });
}
