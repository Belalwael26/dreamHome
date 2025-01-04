import 'package:dream_home/feature/auth/data/model/user_model.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends LoginState {}

class ChangeObsecureTextState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final UserModel user;

  LoginSuccessState(this.user);
  @override
  List<Object?> get props => [user];
}

class LoginFailureState extends LoginState {
  final String message;
  LoginFailureState(this.message);
}

class UpdateSuccessState extends LoginState {}

class UpdateFailureState extends LoginState {
  final String message;
  UpdateFailureState(this.message);
}
