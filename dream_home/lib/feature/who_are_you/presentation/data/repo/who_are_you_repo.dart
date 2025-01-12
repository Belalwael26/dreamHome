import 'package:dartz/dartz.dart';
import 'package:dream_home/core/errors/errors.dart';

abstract class WhoAreYouRepo {
  Future<Either<Failure, bool>> isWorker({
    required bool isWorker,
  });
}
