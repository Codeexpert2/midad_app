
import 'package:flutter/foundation.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/core/keys/keys.dart';
import 'package:midad/core/router/routes.dart';
import 'package:midad/features/statics/not_found.dart';
import 'package:midad/initialize_app.dart';
import 'package:midad/services/local_storage/storage_service.dart';

import 'app_routes.dart';
import 'go_router_observer.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    routes: routes,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    initialLocation: AppRoutes.splash.path,
    errorBuilder: (context, state) => const NotFoundScreen(),
    observers: [
      GoRouterObserver(),
    ],
    redirect: (context, state) {
      final currentPath = state.uri.path;

      // Always allow splash screen
      if (currentPath == AppRoutes.splash.path) return null;

      final storage = locator<StorageService>();
      final isOnboardingCompleted = storage.readBool(onboardingKey);

      // If onboarding not completed, redirect to onboarding
      if (!isOnboardingCompleted && currentPath != AppRoutes.onboarding.path) {
        return AppRoutes.onboarding.path;
      }

      if (isOnboardingCompleted && currentPath == AppRoutes.onboarding.path) {
        return AppRoutes.home.path;
      }

      // Otherwise, allow navigation
      return null;
    },
  );

  ref.onDispose(router.dispose);
  return router;
});

final routeInformationProvider =
    ChangeNotifierProvider<GoRouteInformationProvider>((ref) {
  final router = ref.watch(routerProvider);
  return router.routeInformationProvider;
});
