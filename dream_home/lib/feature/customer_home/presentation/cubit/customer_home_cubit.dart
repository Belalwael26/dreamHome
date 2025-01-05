import 'dart:developer';
import 'package:dream_home/feature/auth/data/model/user_model.dart';
import 'package:dream_home/feature/customer_home/data/repo/customer_home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'customer_home_state.dart';

class CustomerHomeCubit extends Cubit<CustomerHomeState> {
  final CustomerHomeRepo repo;
  CustomerHomeCubit(this.repo) : super(CustomerHomeInitialState());

  static CustomerHomeCubit get(context) =>
      BlocProvider.of<CustomerHomeCubit>(context);

  List<UserModel> users = [];

  Future<void> getworker({
    required String category,
  }) async {
    emit(GetWorkersLoadingState());
    final result = await repo.getWorker(category: category);

    result.fold((failure) {
      emit(GetWorkerFailureState(failure.message));
    }, (success) {
      users = success;
      log("${success.length}");
      log("${success.map((e) => e.job)}");
      emit(GetWorkerSuccessState(success));
    });
  }
}
