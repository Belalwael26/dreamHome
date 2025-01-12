part of 'who_are_you_cubit.dart';

sealed class WhoAreYouState {}

final class WhoAreYouInitial extends WhoAreYouState {}

final class WhoAreYouSuccess extends WhoAreYouState {
  final bool isWorker;

  WhoAreYouSuccess(this.isWorker);
}

final class WhoAreYouFailureState extends WhoAreYouState {
  final String message;

  WhoAreYouFailureState(this.message);
}
