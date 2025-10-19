import 'package:clean_architecture/features/dynamics/presentation/dynamics_screen.dart';
import 'package:clean_architecture/features/mood/presentation/mood_screen.dart';
import 'package:clean_architecture/features/profile/presentation/profile_screen.dart';
import 'package:clean_architecture/features/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'core/di/injection_container.dart';
import 'core/navigation/router.dart';

// Import feature screens
import 'features/auth/presentation/login_screen.dart';
import 'package:clean_architecture/features/chat/presentation/chat_screen.dart';

final sl = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  // Provide concrete screens from the app/features layer.
  sl.registerSingleton<AppScreens>(
    AppScreens(
      splash: (_, __) => const SplashScreen(),
      login: (_, __) => const LoginScreen(),
      home: (_, __) => const ChatScreen(),
      mood: (_, __) => const MoodScreen(),
      dynamics: (_, __) => const DynamicsScreen(),
      profile: (_, __) => const ProfileScreen(),
    ),
  );

  // Now the router can be built from abstractions.
  sl.registerLazySingleton<AppRouter>(() => AppRouter(sl(), sl()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = sl<AppRouter>().config;
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData.light(),
    );
  }
}
