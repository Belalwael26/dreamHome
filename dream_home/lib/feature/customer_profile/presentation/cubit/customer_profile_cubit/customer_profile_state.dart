part of 'customer_profile_cubit.dart';

sealed class CustomerProfileState {}

final class CustomerProfileInitial extends CustomerProfileState {}

final class CustomerProfileLoading extends CustomerProfileState {}

final class LogoutSuccessState extends CustomerProfileState {
  final String message;

  LogoutSuccessState(this.message);
}

final class LogoutFailureState extends CustomerProfileState {
  final String message;

  LogoutFailureState(this.message);
}
