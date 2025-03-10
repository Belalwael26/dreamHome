import 'package:dartz/dartz.dart';
import 'package:dream_home/core/errors/errors.dart';

abstract class WorkerProfileRepo {
  Future<Either<Failure, String>> logout();

  Future<Either<Failure, String>> deleteAccount();
}
