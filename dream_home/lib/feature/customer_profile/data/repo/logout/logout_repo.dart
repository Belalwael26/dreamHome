import 'package:dartz/dartz.dart';
import 'package:dream_home/core/errors/errors.dart';

abstract class LogoutRepo {
  Future<Either<Failure, String>> logout();
}
