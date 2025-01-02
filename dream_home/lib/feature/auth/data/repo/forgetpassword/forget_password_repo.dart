import 'package:dartz/dartz.dart';

import '../../../../../core/errors/errors.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failure, String>> forgetPassword({
    required String email,
  });
}
