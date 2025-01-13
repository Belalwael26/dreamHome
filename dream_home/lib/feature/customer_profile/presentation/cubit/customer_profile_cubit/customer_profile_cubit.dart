import 'dart:developer';

import 'package:dream_home/core/cache/shred_keys.dart';
import 'package:dream_home/feature/auth/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cache/user_info_cache.dart';
import '../../../data/repo/logout/logout_repo.dart';
part 'customer_profile_state.dart';

class CustomerProfileCubit extends Cubit<CustomerProfileState> {
  final LogoutRepo logoutRepo;
  CustomerProfileCubit({
    required this.logoutRepo,
  }) : super(CustomerProfileInitial());

  static CustomerProfileCubit get(context) =>
      BlocProvider.of<CustomerProfileCubit>(context);

  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String selectedItem = "";

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

  Future<void> phone(UserModel user) async {
    if (formKey.currentState!.validate()) {
      final result =
          await logoutRepo.phoneNumer(phoneNumer: phoneController.text);

      result.fold((fail) {
        emit(AddPhoneNumberFailureState(fail.message));
      }, (success) async {
        await saveUserToSharedPreferences(
            user, {ShredKeys.phone: phoneController.text});

        emit(AddphoneNumberSuccessState(success));
      });
    }
  }

  List<String> jobs = [
    "Carpentry",
    "Blacksmithing",
    "Plumbing",
    "Electricity",
    "Painting",
    "Tiling ",
    "Carving and Sculpting",
    "Tiling and Flooring Installation",
    "Cooling and Air Conditioning",
    "Electronic Repairs",
    "Home Appliance Maintenance",
    "House Cleaning ",
  ];

  Future<void> job(UserModel user) async {
    final result = await logoutRepo.job(job: selectedItem);

    result.fold((fail) {
      emit(AddJobFailureState(fail.message));
    }, (success) async {
      await saveUserToSharedPreferences(user, {
        ShredKeys.job: selectedItem,
      });
      emit(AddJobSuccessState(success));
    });
  }
}
