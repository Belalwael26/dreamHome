import 'dart:developer';
import 'package:dream_home/feature/who_are_you/presentation/data/repo/who_are_you_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'who_are_you_state.dart';

class WhoAreYouCubit extends Cubit<WhoAreYouState> {
  final WhoAreYouRepo _repo;
  WhoAreYouCubit(this._repo) : super(WhoAreYouInitial());

  bool isWork = false;

  Future<void> isWorker({required bool isWorker}) async {
    final result = await _repo.isWorker(isWorker: isWorker);

    result.fold(
      (failure) {
        log("Is Worker Error ${failure.message}");
        emit(WhoAreYouFailureState(failure.message));
      },
      (success) {
        isWork = success;
        // saveUserToSharedPreferences(UserModel(), {ShredKeys.woker: isWorker});
        log("Is Worker Saved $success");
        emit(WhoAreYouSuccess(success));
      },
    );
  }
}
