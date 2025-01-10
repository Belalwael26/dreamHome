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
}
