import 'package:fpdart/fpdart.dart';

import '../error/failures/failures.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    try {
      final integer = int.parse(str);
      if (integer < 0) throw const FormatException();
      return Right(integer);
    } on FormatException {
      return const Left(Failure.invalidInput());
    }
  }
}