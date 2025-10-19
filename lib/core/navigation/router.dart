import 'package:clean_architecture/core/constants/navigation_constants.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: NavigationConstants.splash.path,
  
  refreshListenable: GoRouterRefreshStream(
    getIt<AuthService>().authStateStream, // optional reactive updates
  ),

  routes: [
    GoRoute(
      path: NavigationConstants.splash.path,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: NavigationConstants.login.path,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: NavigationConstants.home.path,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: NavigationConstants.mood.path,
      builder: (context, state) => const MoodScreen(),
    ),
    GoRoute(
      path: NavigationConstants.dynamics.path,
      builder: (context, state) => const DynamicsScreen(),
    ),
    GoRoute(
      path: NavigationConstants.profile.path,
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
  redirect: (context, state) {
    final authService = getIt<AuthService>();
    final isLoggedIn = authService.isLoggedIn;
    final isSplash = state.matchedLocation == '/splash';
    final isLogin = state.matchedLocation == '/login';

    if (isSplash) return null; // let splash decide

    if (!isLoggedIn && !isLogin) return '/login';
    if (isLoggedIn && isLogin) return '/home';
    return null;
  },
);
