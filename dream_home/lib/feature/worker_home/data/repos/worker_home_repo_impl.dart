import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dream_home/core/errors/errors.dart';
import 'package:dream_home/core/errors/user_error_message.dart';
import 'package:dream_home/feature/customer_home/data/model/order_model.dart';
import 'package:dream_home/feature/worker_home/data/repos/worker_home_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WorkerHomeRepoImpl implements WorkerHomeRepo {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<Either<Failure, List<OrderModel>>> getOrder() async {
    try {
      final querySnapshot = await firestore
          .collection('orders')
          .where('is_worker', isEqualTo: true)
          .where(
            'job',
            isEqualTo: OrderModel().job,
          )
          .where('order_status', isEqualTo: "Pendding")
          .get();

      final orders = querySnapshot.docs.map((doc) {
        final data = OrderModel.fromDocumentSnapshot(doc);

        return data;
      }).toList();

      log("Fetched ${orders.length} orders.");
      log("orders: $orders");

      return Right(orders);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> changeOrderStatus(
      {required String orderStatus, required String orderId}) async {
    try {
      await firestore.collection('orders').doc(orderId).update({
        'order_status': orderStatus,
      });
      return Right("Chnage Order Status Successflly");
    } on FirebaseAuthException catch (e) {
      final message = getFriendlyErrorMessage(e.code);
      return Left(ServerFailure(message));
    }
  }
}