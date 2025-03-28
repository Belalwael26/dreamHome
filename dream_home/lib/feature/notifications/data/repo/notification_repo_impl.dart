import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dream_home/feature/notifications/data/models/notification_model.dart';
import 'package:dream_home/feature/notifications/data/repo/notification_repo.dart';

import '../../../../core/network/error/failure.dart';

class NotificationRepoImpl implements NotificationRepo {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<Either<Failure, List<NotificationModel>>> notification() async {
    try {
      final querySnapshot = await firestore.collection('notifications').get();

      final notifications = querySnapshot.docs.map((doc) {
        final data = NotificationModel.fromDocumentSnapshot(doc);
        data.id = doc.id;
        return data;
      }).toList();

      log("Fetched ${notifications.length} notifications.");
      log("Notifications: $notifications");
      log(" notification ids:${notifications.map((e) => e.id)}");

      return Right(notifications);
    } on FirebaseException catch (e) {
      // final message = getFriendlyErrorMessage(e.code);
      log("Error: ${e.toString()}");
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteNotification(
      {required String id}) async {
    try {
      await firestore.collection('notifications').doc(id).delete();
      log("Notification with ID $id deleted successfully.");
      return const Right("Notification deleted successfully");
    } on FirebaseException catch (e) {
      // final message = getFriendlyErrorMessage(e.code);
      log("Error deleting notification: ${e.toString()}");
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> changeNotificationStatus(
      {required String id}) async {
    try {
      await firestore.collection('notifications').doc(id).update({
        'is_open': false,
      });
      return Right("");
    } on FirebaseException catch (e) {
      // final message = getFriendlyErrorMessage(e.code);
      return Left(ServerFailure(e.toString()));
    }
  }
}
