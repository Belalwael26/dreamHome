import 'package:dartz/dartz.dart';
import 'package:dream_home/feature/auth/data/model/user_model.dart';
import '../../../../../core/network/error/failure.dart';

abstract class RegisterRepo {
  Future<Either<Failure, UserModel>> register(
      {required String name,
      required String email,
      required String password,
      required String confirmPassword,
      required String phone});
}
