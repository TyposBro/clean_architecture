// lib/core/usecases/usecase.dart

import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import 'package:clean_architecture/core/error/failures.dart';

/// A contract for use cases that return a value asynchronously.
/// [T] is the success return type.
/// [P] is the input parameter type.
abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}

/// A contract for use cases that return a stream of values.
/// [T] is the success return type of the stream's data.
/// [P] is the input parameter type.
abstract class StreamUseCase<T, P> {
  Stream<Either<Failure, T>> call(P params);
}

/// A class to be used as a parameter for use cases that do not require any parameters.
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Example Usage in a feature:
/// 
/// class GetPosts extends UseCase<List<PostEntity>, NoParams> {
///   final PostRepository repository;
///
///   GetPosts(this.repository);
///
///   @override
///   Future<Either<Failure, List<PostEntity>>> call(NoParams params) async {
///     return await repository.getPosts();
///   }
/// }
/// 
/// class GetPostById extends UseCase<PostEntity, int> {
///   final PostRepository repository;
///
///   GetPostById(this.repository);
///
///   @override
///   Future<Either<Failure, PostEntity>> call(int id) async {
///     return await repository.getPostById(id);
///   }
/// }