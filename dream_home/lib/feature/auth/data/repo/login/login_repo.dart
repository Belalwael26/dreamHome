import 'package:dartz/dartz.dart';
import 'package:dream_home/feature/auth/data/model/user_model.dart';

import '../../../../../core/network/error/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> updatePasswordInFirestore({
    required String email,
    required String newPassword,
  });
}
