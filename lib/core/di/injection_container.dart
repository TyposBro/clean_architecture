// lib/core/di/injection_container.dart

import 'package:clean_architecture/core/network/api_client.dart';
import 'package:get_it/get_it.dart';

import 'package:clean_architecture/core/network/interceptors/auth_interceptor.dart';
import 'package:clean_architecture/core/network/interceptors/logging_interceptor.dart';
import 'package:clean_architecture/core/session/session_manager.dart';
import 'package:clean_architecture/core/session/token_manager.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Core services
  sl.registerLazySingleton<TokenManager>(() => TokenManager());
  sl.registerLazySingleton<SessionManager>(() => SessionManager(sl()));
  sl.registerLazySingleton<AuthInterceptor>(() => AuthInterceptor(sl()));
  sl.registerLazySingleton<LoggingInterceptor>(() => LoggingInterceptor());

  // Initialize session first (so it loads stored token)
  await sl<SessionManager>().init();

  // Register ApiClient (depends on interceptors)
  await ApiClient.register();
}
