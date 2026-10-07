import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framefetch/app/presentation/root_screen.dart';
import 'package:framefetch/core/routing/auth_return_location.dart';
import 'package:framefetch/features/admin/presentation/admin_ai_providers_screen.dart';
import 'package:framefetch/features/admin/presentation/admin_analytics_screen.dart';
import 'package:framefetch/features/admin/presentation/admin_home_screen.dart';
import 'package:framefetch/features/admin/presentation/admin_operation_logs_screen.dart';
import 'package:framefetch/features/admin/presentation/admin_providers_screen.dart';
import 'package:framefetch/features/admin/presentation/admin_storage_screen.dart';
import 'package:framefetch/features/admin/presentation/admin_users_screen.dart';
import 'package:framefetch/features/analysis/presentation/analysis_detail_screen.dart';
import 'package:framefetch/features/auth/application/auth_session_controller.dart';
import 'package:framefetch/features/auth/presentation/login_screen.dart';
import 'package:framefetch/features/auth/presentation/register_screen.dart';
import 'package:framefetch/features/auth/presentation/session_restore_screen.dart';
import 'package:framefetch/features/documents/presentation/document_detail_screen.dart';
import 'package:framefetch/features/download/presentation/content_intake_selector.dart';
import 'package:framefetch/features/download/presentation/inspection_result_screen.dart';
import 'package:framefetch/features/history/presentation/activity_history_screen.dart';
import 'package:framefetch/features/history/presentation/download_detail_screen.dart';
import 'package:framefetch/features/landing/presentation/public_guide_screen.dart';
import 'package:framefetch/features/landing/presentation/resource_info_screen.dart';
import 'package:go_router/go_router.dart';

part 'app_router.g.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final refresh = _RouterRefresh();
  ref.listen(
    authSessionProvider.select(
      (session) => (session.phase, session.user?.role.name),
    ),
    (_, _) => refresh.notify(),
  );
  final platformRoute =
      WidgetsBinding.instance.platformDispatcher.defaultRouteName;
  const routeOverride = String.fromEnvironment('FRAMEGRAB_INITIAL_ROUTE');
  final router = GoRouter(
    initialLocation: routeOverride.isNotEmpty
        ? routeOverride
        : platformRoute.isEmpty
        ? '/'
        : platformRoute,
    overridePlatformDefaultLocation: true,
    routes: $appRoutes,
    refreshListenable: refresh,
    redirect: (_, state) => authRedirect(
      phase: ref.read(authSessionProvider).phase,
      isAdmin: ref.read(authSessionProvider).user?.role.name == 'admin',
      uri: state.uri,
    ),
  );
  ref.onDispose(refresh.dispose);
  ref.onDispose(router.dispose);
  return router;
});

String? authRedirect({
  required AuthSessionPhase phase,
  required bool isAdmin,
  required Uri uri,
}) {
  final location = uri.path;
  final isEntry = location == '/auth/login' || location == '/auth/register';
  final isRestore = location == '/auth/restoring';
  final isAuthLocation = location.startsWith('/auth/');
  final isPublicHome = location == '/';
  final isPublicGuide = const {
    '/guide',
    '/self-hosting',
    '/about',
  }.contains(location);

  if (phase == AuthSessionPhase.restoring) {
    if (isRestore || isPublicHome || isPublicGuide) return null;
    return Uri(
      path: '/auth/restoring',
      queryParameters: {'from': uri.toString()},
    ).toString();
  }
  if (phase == AuthSessionPhase.signedOut) {
    if (isRestore) {
      final destination = safeAuthReturnLocation(uri.queryParameters['from']);
      return destination == '/'
          ? '/'
          : Uri(
              path: '/auth/login',
              queryParameters: {'from': destination},
            ).toString();
    }
    return isEntry || isPublicHome || isPublicGuide
        ? null
        : Uri(
            path: '/auth/login',
            queryParameters: {'from': uri.toString()},
          ).toString();
  }
  if (phase == AuthSessionPhase.signedIn && isRestore) {
    return safeAuthReturnLocation(uri.queryParameters['from']);
  }
  if (phase == AuthSessionPhase.signedIn && isAuthLocation) {
    return safeAuthReturnLocation(uri.queryParameters['from']);
  }
  if (phase == AuthSessionPhase.signedIn &&
      location.startsWith('/admin') &&
      !isAdmin) {
    return '/';
  }
  return null;
}

@TypedGoRoute<AdminHomeRoute>(path: '/admin')
final class AdminHomeRoute extends GoRouteData with $AdminHomeRoute {
  const AdminHomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AdminHomeScreen();
  }
}

@TypedGoRoute<AdminAnalyticsRoute>(path: '/admin/analytics')
final class AdminAnalyticsRoute extends GoRouteData with $AdminAnalyticsRoute {
  const AdminAnalyticsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AdminAnalyticsScreen();
  }
}

@TypedGoRoute<AdminOperationLogsRoute>(path: '/admin/operation-logs')
final class AdminOperationLogsRoute extends GoRouteData
    with $AdminOperationLogsRoute {
  const AdminOperationLogsRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AdminOperationLogsScreen();
}

@TypedGoRoute<AdminFilesRoute>(path: '/admin/files')
final class AdminFilesRoute extends GoRouteData with $AdminFilesRoute {
  const AdminFilesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AdminStorageScreen();
  }
}

@TypedGoRoute<AdminUsersRoute>(path: '/admin/users')
final class AdminUsersRoute extends GoRouteData with $AdminUsersRoute {
  const AdminUsersRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AdminUsersScreen();
  }
}

@TypedGoRoute<AdminProvidersRoute>(path: '/admin/providers')
final class AdminProvidersRoute extends GoRouteData with $AdminProvidersRoute {
  const AdminProvidersRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AdminProvidersScreen();
  }
}

@TypedGoRoute<AdminAiProvidersRoute>(path: '/admin/ai-providers')
final class AdminAiProvidersRoute extends GoRouteData
    with $AdminAiProvidersRoute {
  const AdminAiProvidersRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AdminAiProvidersScreen();
  }
}

final class _RouterRefresh extends ChangeNotifier {
  void notify() => notifyListeners();
}

@TypedGoRoute<DownloadHomeRoute>(path: '/')
final class DownloadHomeRoute extends GoRouteData with $DownloadHomeRoute {
  const DownloadHomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return RootScreen(
      initialIntakeMode: switch (state.uri.queryParameters['intake']) {
        'video' => ContentIntakeMode.video,
        'screenplay' => ContentIntakeMode.screenplay,
        _ => ContentIntakeMode.link,
      },
    );
  }
}

@TypedGoRoute<PublicGuideRoute>(path: '/guide')
final class PublicGuideRoute extends GoRouteData with $PublicGuideRoute {
  const PublicGuideRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PublicGuideScreen();
  }
}

@TypedGoRoute<InspectionWorkspaceRoute>(path: '/downloads/new')
final class InspectionWorkspaceRoute extends GoRouteData
    with $InspectionWorkspaceRoute {
  const InspectionWorkspaceRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      InspectionResultScreen(
        intentId: state.uri.queryParameters['intentId'],
        inspectionId: state.uri.queryParameters['inspectionId'],
        discoveryId: state.uri.queryParameters['discoveryId'],
      );
}

@TypedGoRoute<DownloadDetailRoute>(path: '/downloads/:jobId')
final class DownloadDetailRoute extends GoRouteData with $DownloadDetailRoute {
  const DownloadDetailRoute({required this.jobId});

  final String jobId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DownloadDetailScreen(jobId: jobId);
  }
}

@TypedGoRoute<ActivityHistoryRoute>(path: '/history/activity')
final class ActivityHistoryRoute extends GoRouteData
    with $ActivityHistoryRoute {
  const ActivityHistoryRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    final documentId = state.uri.queryParameters['document_id'];
    final downloadId = state.uri.queryParameters['download_id'];
    return ActivityHistoryScreen(
      key: ValueKey((documentId, downloadId)),
      documentId: documentId,
      downloadId: downloadId,
    );
  }
}

@TypedGoRoute<InspectionResultRoute>(path: '/download-intents/:intentId')
final class InspectionResultRoute extends GoRouteData
    with $InspectionResultRoute {
  const InspectionResultRoute({required this.intentId});
  final String intentId;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      InspectionResultScreen(intentId: intentId);
}

@TypedGoRoute<AnalysisDetailRoute>(path: '/analyses/:analysisId')
final class AnalysisDetailRoute extends GoRouteData with $AnalysisDetailRoute {
  const AnalysisDetailRoute({required this.analysisId});
  final String analysisId;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      AnalysisDetailScreen(analysisId: analysisId);
}

@TypedGoRoute<SelfHostingRoute>(path: '/self-hosting')
final class SelfHostingRoute extends GoRouteData with $SelfHostingRoute {
  const SelfHostingRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ResourceInfoScreen(resource: ResourceInfo.selfHosting);
}

@TypedGoRoute<AboutRoute>(path: '/about')
final class AboutRoute extends GoRouteData with $AboutRoute {
  const AboutRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ResourceInfoScreen(resource: ResourceInfo.about);
}

@TypedGoRoute<DocumentDetailRoute>(path: '/documents/:documentId')
final class DocumentDetailRoute extends GoRouteData with $DocumentDetailRoute {
  const DocumentDetailRoute({required this.documentId});

  final String documentId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DocumentDetailScreen(documentId: documentId);
  }
}

@TypedGoRoute<LoginRoute>(path: '/auth/login')
final class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginScreen();
  }
}

@TypedGoRoute<SessionRestoreRoute>(path: '/auth/restoring')
final class SessionRestoreRoute extends GoRouteData with $SessionRestoreRoute {
  const SessionRestoreRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SessionRestoreScreen();
  }
}

@TypedGoRoute<RegisterRoute>(path: '/auth/register')
final class RegisterRoute extends GoRouteData with $RegisterRoute {
  const RegisterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RegisterScreen();
  }
}
