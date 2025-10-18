// lib/core/error/exceptions.dart

/// Represents an error that occurs during a server request.
class ServerException implements Exception {
  final String message;
  final int? statusCode;

  ServerException(this.message, {this.statusCode});

  @override
  String toString() => message;
}

/// Represents an error when the device is not connected to the internet.
class NetworkException implements Exception {
  final String message;
  NetworkException({this.message = "No internet connection."});
}
