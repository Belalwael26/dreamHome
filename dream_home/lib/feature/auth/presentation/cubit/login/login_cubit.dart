import 'dart:developer';
import 'package:dream_home/feature/auth/data/model/user_model.dart';
import 'package:dream_home/feature/auth/data/repo/login/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _repo;

  LoginCubit(this._repo) : super(InitialState());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool obsecureText = false;

  static LoginCubit get(context) => BlocProvider.of(context);

  UserModel user = UserModel();

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      final result = await _repo.login(
        email: emailController.text,
        password: passwordController.text,
      );
      result.fold(
        (l) {
          log("Error: $l");
          emit(LoginFailureState(l.message));
        },
        (r) async {
          user = r;
          log("User: $r");

          if (user.password != passwordController.text) {
            await updatePassword();
            log("function is not work");
          } else {
            log("condition is false");
          }

          log("User Name ${user.name}");
          emit(LoginSuccessState(r));
        },
      );
    }
  }

  void changeObsecureText() {
    obsecureText = !obsecureText;

    emit(ChangeObsecureTextState());
  }

  Future<void> updatePassword() async {
    final result = await _repo.updatePasswordInFirestore(
      email: emailController.text,
      newPassword: passwordController.text,
    );

    result.fold(
      (l) => emit(UpdateFailureState(l.message)),
      (r) {
        emit(UpdateSuccessState());
      },
    );
  }
}
