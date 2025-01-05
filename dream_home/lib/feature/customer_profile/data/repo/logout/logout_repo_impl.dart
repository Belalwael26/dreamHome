import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dream_home/core/errors/errors.dart';
import 'package:dream_home/core/errors/user_error_message.dart';
import 'package:dream_home/feature/customer_profile/data/repo/logout/logout_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogoutRepoImpl implements LogoutRepo {
  @override
  Future<Either<Failure, String>> logout() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    try {
      if (user == null) {
        throw FirebaseAuthException(
          code: 'no-user',
          message: 'No user is currently signed in.',
        );
      }

      await auth.signOut();
      return Right('Logged out successfully');
    } on FirebaseAuthException catch (e) {
      final message = getFriendlyErrorMessage(e.code);
      return Left(ServerFailure(message));
    }
  }

  @override
  Future<Either<Failure, String>> deleteAccount() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      if (user == null) {
        throw FirebaseAuthException(
          code: 'no-user',
          message: 'No user is currently signed in.',
        );
      }
      await user.delete();
      await firestore.collection('users').doc(user.uid).delete();

      return Right('Account deleted successfully');
    } on FirebaseAuthException catch (e) {
      final message = getFriendlyErrorMessage(e.code);
      return Left(ServerFailure(message));
    }
  }

  @override
  Future<Either<Failure, String>> phoneNumer({
    required String phoneNumer,
  }) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User? user = auth.currentUser;
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      await firestore.collection('users').doc(user!.uid).update({
        'phone': phoneNumer,
      });
      return Right("Phone Added Successflly");
    } on FirebaseAuthException catch (e) {
      final message = getFriendlyErrorMessage(e.code);
      return Left(ServerFailure(message));
    }
  }
}
