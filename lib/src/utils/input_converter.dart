import 'package:dartz/dartz.dart';
import 'package:capp/src/data_source/network/error/faliures.dart';

class InputConverter {
  Either<Faliure, int> stringToUnsignedInteger(String str) {
    try {
      final intPart = int.parse(str);
      if (intPart < 0) throw FormatException();
      return Right(int.parse(str));
    } on FormatException {
      return Left(InvalidInputFaliure());
    }
  }
}

class InvalidInputFaliure extends Faliure {}
