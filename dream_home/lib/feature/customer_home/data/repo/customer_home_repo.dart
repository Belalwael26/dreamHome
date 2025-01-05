import 'package:dartz/dartz.dart';
import 'package:dream_home/core/errors/errors.dart';
import 'package:dream_home/feature/auth/data/model/user_model.dart';

abstract class CustomerHomeRepo {
  Future<Either<Failure, List<UserModel>>> getWorker({
    required String category,
  });
}
