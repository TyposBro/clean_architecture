import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:clean_architecture/core/error/exceptions.dart';
import 'package:clean_architecture/core/error/network_exceptions.dart';

class LoggingInterceptor extends Interceptor {
  final Logger _logger = Logger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.d('→ ${options.method} ${options.path}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.d(
      '← ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e(
      '✗ ${err.response?.statusCode} ${err.requestOptions.method} ${err.requestOptions.path}',
    );

    // Handle timeout errors
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: ConnectionTimeoutException(),
        ),
      );
      return;
    }

    // Transform HTTP status codes to our custom exceptions
    final statusCode = err.response?.statusCode;
    final exception = _getExceptionForStatusCode(statusCode);

    if (exception != null) {
      handler.reject(
        DioException(requestOptions: err.requestOptions, error: exception),
      );
    } else {
      handler.next(err);
    }
  }

  ServerException? _getExceptionForStatusCode(int? statusCode) {
    if (statusCode == null) return null;

    if (statusCode >= 500) {
      return ServerException("Server Error", statusCode: statusCode);
    }

    return switch (statusCode) {
      400 => BadRequestException(),
      401 => UnauthorizedException(),
      404 => NotFoundException(),
      429 => TooManyRequestsException(),
      _ => null,
    };
  }
}
