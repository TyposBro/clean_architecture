import 'package:dio/dio.dart';
import 'package:clean_architecture/core/session/session_manager.dart';

class AuthInterceptor extends Interceptor {
  final SessionManager _sessionManager;

  AuthInterceptor(this._sessionManager);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _sessionManager.token;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
