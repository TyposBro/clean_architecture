// lib/core/error/network_exceptions.dart

import 'package:clean_architecture/core/error/exceptions.dart';

class BadRequestException extends ServerException {
  BadRequestException() : super('Bad Request', statusCode: 400);
}

class UnauthorizedException extends ServerException {
  UnauthorizedException() : super('Unauthorized', statusCode: 401);
}

class NotFoundException extends ServerException {
  NotFoundException() : super('Not Found', statusCode: 404);
}

class TooManyRequestsException extends ServerException {
  TooManyRequestsException() : super('Too Many Requests', statusCode: 429);
}

class ConnectionTimeoutException extends ServerException {
  ConnectionTimeoutException() : super('Connection Timeout');
}
