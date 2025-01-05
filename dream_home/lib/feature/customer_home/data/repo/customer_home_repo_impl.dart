import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dream_home/core/errors/errors.dart';
import 'package:dream_home/core/errors/user_error_message.dart';
import 'package:dream_home/feature/auth/data/model/user_model.dart';
import 'package:dream_home/feature/customer_home/data/repo/customer_home_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomerHomeRepoImpl implements CustomerHomeRepo {
  @override
  Future<Either<Failure, List<UserModel>>> getWorker(
      {required String category}) async {
    CollectionReference<Map<String, dynamic>> user =
        FirebaseFirestore.instance.collection('users');

    List<UserModel> cateogties = [ ] ;
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await user.where("job", isEqualTo: category).get();
      cateogties =
          snapshot.docs.map((e) => UserModel.fromDocumentSnapshot(e)).toList();

      return Right(cateogties);
    } on FirebaseAuthException catch (e) {
      final message = getFriendlyErrorMessage(e.code);
      return Left(ServerFailure(message));
    }
  }
}
