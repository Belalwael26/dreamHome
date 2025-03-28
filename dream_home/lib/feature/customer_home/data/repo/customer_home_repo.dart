import 'package:dartz/dartz.dart';
import 'package:dream_home/feature/auth/data/model/Login/login_model/login_model.dart';
import 'package:dream_home/feature/customer_home/data/model/order_model.dart';
import '../../../../core/network/error/failure.dart';

abstract class CustomerHomeRepo {
  Future<Either<Failure, List<LoginModel>>> getWorker({
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
