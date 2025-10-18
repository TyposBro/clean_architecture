// lib/core/error/failures.dart

import 'package:equatable/equatable.dart';

/// A base class for all failure types in the application.
/// Using Equatable to allow for value comparison of failure objects.
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

// Feature-specific failures (example from previous LLM chat)
class ModelFailure extends Failure {
  const ModelFailure(super.message);
}

class InferenceFailure extends Failure {
  const InferenceFailure(super.message);
}
