import 'package:dartz/dartz.dart';
import 'package:dream_home/core/errors/errors.dart';
import 'package:dream_home/feature/notifications/data/models/notification_model.dart';

abstract class NotificationRepo {
  Future<Either<Failure, List<NotificationModel>>> notification();

  Future<Either<Failure, String>> deleteNotification({required String id});

  Future<Either<Failure, String>> changeNotificationStatus(
      {required String id});
}
