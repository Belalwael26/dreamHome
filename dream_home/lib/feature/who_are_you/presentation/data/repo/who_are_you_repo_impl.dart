import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dream_home/feature/who_are_you/presentation/data/repo/who_are_you_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/network/error/failure.dart';

class WhoAreYouRepoImpl implements WhoAreYouRepo {
  @override
  Future<Either<Failure, bool>> isWorker({required bool isWorker}) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User? user = auth.currentUser;
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore.collection('users').doc(user!.uid).update({
        'isWorker': isWorker,
      });
      return Right(isWorker);
    } on FirebaseAuthException catch (e) {
      // final message = getFriendlyErrorMessage(e.code);
      return Left(ServerFailure(e.toString()));
    }
  }
}
