import 'package:dartz/dartz.dart';
import 'package:dream_home/core/errors/errors.dart';
import 'package:dream_home/feature/customer_home/data/model/order_model.dart';

abstract class WorkerHomeRepo {
  Future<Either<Failure, List<OrderModel>>> getOrder();

  Future<Either<Failure, String>> changeOrderStatus({
    required String orderStatus,
    required String orderId,
  });
}