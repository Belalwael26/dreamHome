import 'package:dream_home/feature/auth/data/model/user_model.dart';

abstract class LoginState {}

class InitialState extends LoginState {}

class ChangeObsecureTextState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final UserModel user;

  LoginSuccessState(this.user);
}

class LoginFailureState extends LoginState {
  final String message;
  LoginFailureState(this.message);
}
