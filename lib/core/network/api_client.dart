// lib/core/network/api_client.dart

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:clean_architecture/core/constants/api_constants.dart';
import 'package:clean_architecture/core/constants/network_constants.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

class ApiClient {
  final Dio _dio;

  ApiClient._(this._dio);

  /// Factory for initializing and registering ApiClient with GetIt
  static Future<void> register() async {
    final sl = GetIt.instance;

    // Ensure dependencies are initialized first
    final authInterceptor = sl<AuthInterceptor>();
    final loggingInterceptor = sl<LoggingInterceptor>();

    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: NetworkConstants.connectTimeout,
        receiveTimeout: NetworkConstants.receiveTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([
      authInterceptor,
      loggingInterceptor,
    ]);

    sl.registerLazySingleton<ApiClient>(() => ApiClient._(dio));
  }

  /// === HTTP methods ===

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _dio.put<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
}
