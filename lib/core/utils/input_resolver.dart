// lib/core/utils/input_converter.dart

import 'package:fpdart/fpdart.dart';
import 'package:clean_architecture/core/error/failures.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    try {
      final integer = int.parse(str);
      if (integer < 0) {
        throw const FormatException();
      }
      return Right(integer);
    } on FormatException {
      return Left(ValidationFailure("Invalid input: Not a positive integer."));
    }
  }
}
