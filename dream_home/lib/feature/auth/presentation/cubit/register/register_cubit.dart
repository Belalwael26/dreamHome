import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/user_model.dart';
import '../../../data/repo/register/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _repo;
  RegisterCubit(this._repo) : super(RegisterInitial());

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool passwordObsecureText = false;
  bool confirmPasswordObsecureText = false;

  void changepasswordObsecureText() {
    passwordObsecureText = !passwordObsecureText;

    emit(ChangePasswordObsecureTextState());
  }

  void changeconfirmPasswordObsecureText() {
    confirmPasswordObsecureText = !confirmPasswordObsecureText;

    emit(ChangeConfirmPasswordObsecureTextState());
  }

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoading());
      final result = await _repo.register(
        name: userNameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      );
      result.fold(
        (l) {
          log("Error: $l");
          emit(RegisterError(l.message));
        },
        (r) {
          log("User: ${r.name}");
          emit(RegisterSuccess(r));
        },
      );
    }
  }
}
