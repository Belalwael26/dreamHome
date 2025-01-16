part of 'notification_cubit.dart';

sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class NotificationSuccessState extends NotificationState {
  final List<NotificationModel> notifications;

  NotificationSuccessState(this.notifications);
}

final class NotificationFailureState extends NotificationState {
  final String message;

  NotificationFailureState(this.message);
}

final class NotificationLoadingState extends NotificationState {}

final class DeleteNotificationLoadingState extends NotificationState {}

final class DeleteNotificationSuccessState extends NotificationState {
  final String message;

  DeleteNotificationSuccessState(this.message);
}

final class DeleteNotificationFailureState extends NotificationState {
  final String message;

  DeleteNotificationFailureState(this.message);
}

final class ChangeNotificationStatusSuccessState extends NotificationState {}

final class ChangeNotificationStatusFailureState extends NotificationState {
  final String message;

  ChangeNotificationStatusFailureState(this.message);
}
