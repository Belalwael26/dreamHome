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
