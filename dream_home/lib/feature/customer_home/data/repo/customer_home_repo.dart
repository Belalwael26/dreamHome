import 'package:dartz/dartz.dart';
import 'package:dream_home/core/errors/errors.dart';
import 'package:dream_home/feature/auth/data/model/user_model.dart';
import 'package:dream_home/feature/customer_home/data/model/order_model.dart';

abstract class CustomerHomeRepo {
  Future<Either<Failure, List<UserModel>>> getWorker({
    required String category,
  });
  Future<Either<Failure, OrderModel>> order({
    required String userName,
    required String userphone,
    required String userLocation,
    required String userId,
    required String orderStatus,
    required bool isWorker,
    required String job,
    required bool isOpen,
    required String workerName,
    required String workerPhone,
    required String worderId,
    required String workerLocation,
  });
}
