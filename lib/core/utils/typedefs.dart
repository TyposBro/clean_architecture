// lib/core/utils/typedefs.dart

import 'package:fpdart/fpdart.dart';
import 'package:clean_architecture/core/error/failures.dart';

/// A type definition for a Future that returns an Either of a Failure or a Type.
/// This is commonly used for the return type of repository methods and use cases.
///
/// Example: `FutureEither<List<Post>>` is equivalent to `Future<Either<Failure, List<Post>>>`.
typedef FutureEither<T> = Future<Either<Failure, T>>;

/// A type definition for a Future that returns nothing on success (void).
///
/// Example: `FutureEitherVoid` is equivalent to `Future<Either<Failure, void>>`.
typedef FutureEitherVoid = Future<Either<Failure, void>>;

/// A type definition for a standard JSON object map.
typedef DataMap = Map<String, dynamic>;
