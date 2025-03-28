import 'dart:developer';

import 'package:dream_home/feature/notifications/data/repo/notification_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/notification_model.dart';
part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepo _repo;
  NotificationCubit(this._repo) : super(NotificationInitial());

  List<NotificationModel> notificationList = [];
  Future<void> notification() async {
    emit(NotificationLoadingState());
    final result = await _repo.notification();
    result.fold((failure) => emit(NotificationFailureState(failure.message)),
        (success) {
      notificationList = success;
      log("${notificationList.length}");
      emit(NotificationSuccessState(success));
    });
  }

  Future<void> deleteNotification({required String id}) async {
    emit(DeleteNotificationLoadingState());
    final result = await _repo.deleteNotification(id: id);
    result.fold(
        (failure) => emit(DeleteNotificationFailureState(failure.message)),
        (success) => emit(DeleteNotificationSuccessState(success)));
  }

  Future<void> changeNotificationStatus({required String id}) async {
    final result = await _repo.changeNotificationStatus(id: id);
    result.fold(
        (failure) =>
            emit(ChangeNotificationStatusFailureState(failure.message)),
        (success) {
      log("Status is Changed");
      emit(ChangeNotificationStatusSuccessState());
    });
  }
}
