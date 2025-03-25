import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dream_home/feature/auth/data/model/user_model.dart';
import 'package:dream_home/feature/customer_home/data/repo/customer_home_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../core/network/error/failure.dart';
import '../../../../core/service/notifications.dart';
import '../model/order_model.dart';

class CustomerHomeRepoImpl implements CustomerHomeRepo {
  @override
  Future<Either<Failure, List<UserModel>>> getWorker(
      {required String category}) async {
    CollectionReference<Map<String, dynamic>> user =
        FirebaseFirestore.instance.collection('users');

    List<UserModel> cateogties = [ ] ;
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await user.where("job", isEqualTo: category).get();
      cateogties =
          snapshot.docs.map((e) => UserModel.fromDocumentSnapshot(e)).toList();

      return Right(cateogties);
    } on FirebaseAuthException catch (e) {
      // final message = getFriendlyErrorMessage(e.code);
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
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
  }) async {
    final firestore = FirebaseFirestore.instance;
    try {
      final existingOrder = await firestore
          .collection('orders')
          .where('user_id', isEqualTo: userId)
          .where('order_status', isEqualTo: 'Pendding')
          .get();
      if (existingOrder.docs.isNotEmpty) {
        return Left(ServerFailure('You already have a pending order.'));
      }
      Map<String, dynamic> orderData = {
        'user_name': userName,
        'user_phone': userphone,
        'user_location': userLocation,
        'user_id': userId,
        'createdAt': FieldValue.serverTimestamp(),
        'order_status': orderStatus,
        'is_worker': isWorker,
        'job': job,
        'worker_name': workerName,
        'worker_phone': workerPhone,
        'worker_id': worderId,
        'worker_location': workerLocation,
      };
      await firestore
          .collection('orders')
          .doc(userId)
          .set(orderData, SetOptions(merge: true));

      DocumentSnapshot<Map<String, dynamic>> order =
          await firestore.collection('orders').doc(userId).get();

      DocumentSnapshot<Map<String, dynamic>> user =
          await firestore.collection('users').doc(userId).get();

      String userToken = user.data()?['token'] ?? '';

      if (userToken.isNotEmpty) {
        final notificationData = {
          'title': 'New Order Created',
          'body': '$userName has been created$job Order successfully.',
          'userId': userId,
          'timestamp': FieldValue.serverTimestamp(),
          'is_open': isOpen
        };
        try {
          await NotificationService.instance.showNotification(
            RemoteMessage(
              notification: RemoteNotification(
                title: notificationData['title'].toString(),
                body: notificationData['body'].toString(),
              ),
              data: {
                'type': 'order',
                'user_id': userId,
              },
            ),
          );
          await firestore.collection('notifications').add(notificationData);
          log("Notification Was Sent");
        } catch (e) {
          log("Notification Erorr");
        }
      }

      return Right(OrderModel.fromDocumentSnapshot(order));
    } on FirebaseAuthException catch (e) {
      // final message = getFriendlyErrorMessage(e.code);
      return Left(ServerFailure(e.toString()));
    }
  }
}
