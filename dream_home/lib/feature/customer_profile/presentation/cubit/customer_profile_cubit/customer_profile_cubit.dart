import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/logout/logout_repo.dart';
part 'customer_profile_state.dart';

class CustomerProfileCubit extends Cubit<CustomerProfileState> {
  final LogoutRepo logoutRepo;
  CustomerProfileCubit({
    required this.logoutRepo,
  }) : super(CustomerProfileInitial());

  static CustomerProfileCubit get(context) =>
      BlocProvider.of<CustomerProfileCubit>(context);

  Future<void> logout() async {
    emit(CustomerProfileLoading());
    final result = await logoutRepo.logout();
    result.fold(
      (failure) {
        log("message: ${failure.message}");
        emit(LogoutFailureState(failure.message));
      },
      (message) {
        log("message: $message");
        emit(LogoutSuccessState(message));
      },
    );
  }

  Future<void> deleteAccount() async {
    emit(CustomerProfileLoading());
    final result = await logoutRepo.deleteAccount();
    result.fold(
      (failure) {
        log("message: ${failure.message}");
        emit(DeleteAccountFailureState(failure.message));
      },
      (message) {
        log("message: $message");
        emit(DeleteAccountSuccessState(message));
      },
    );
  }
}
