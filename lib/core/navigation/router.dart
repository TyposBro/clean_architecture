import 'package:clean_architecture/core/constants/navigation_constants.dart';
import 'package:clean_architecture/core/navigation/auth_state.dart';
import 'package:clean_architecture/core/navigation/refresh_listenable.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

// Builders for screens are injected from the app/features.
class AppScreens {
  const AppScreens({
    required this.splash,
    required this.login,
    required this.home,
    required this.mood,
    required this.dynamics,
    required this.profile,
  });

  final Widget Function(BuildContext, GoRouterState) splash;
  final Widget Function(BuildContext, GoRouterState) login;
  final Widget Function(BuildContext, GoRouterState) home;
  final Widget Function(BuildContext, GoRouterState) mood;
  final Widget Function(BuildContext, GoRouterState) dynamics;
  final Widget Function(BuildContext, GoRouterState) profile;
}

class AppRouter {
  AppRouter(this._auth, this._screens);

  final AuthState _auth;
  final AppScreens _screens;

  late final GoRouter config = GoRouter(
    initialLocation: NavigationConstants.splash.path,
    refreshListenable: RefreshStream(_auth.authStateStream),
    routes: [
      GoRoute(
        path: NavigationConstants.splash.path,
        builder: _screens.splash,
      ),
      GoRoute(
        path: NavigationConstants.login.path,
        builder: _screens.login,
      ),
      GoRoute(
        path: NavigationConstants.chatId.path,
        builder: _screens.home,
      ),
      GoRoute(
        path: NavigationConstants.mood.path,
        builder: _screens.mood,
      ),
      GoRoute(
        path: NavigationConstants.dynamics.path,
        builder: _screens.dynamics,
      ),
      GoRoute(
        path: NavigationConstants.profile.path,
        builder: _screens.profile,
      ),
    ],
    redirect: (context, state) {
      final isLoggedIn = _auth.isLoggedIn;
      final loc = state.matchedLocation;

      final isSplash = loc == NavigationConstants.splash.path;
      final isLogin = loc == NavigationConstants.login.path;

      if (isSplash) return null;
      if (!isLoggedIn && !isLogin) return NavigationConstants.login.path;
      if (isLoggedIn && isLogin) return NavigationConstants.chatId.path;
      return null;
    },
  );
}
