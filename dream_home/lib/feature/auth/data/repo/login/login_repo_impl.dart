import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dream_home/core/errors/errors.dart';
import 'package:dream_home/feature/auth/data/model/user_model.dart';
import 'package:dream_home/feature/auth/data/repo/login/login_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/errors/user_error_message.dart';

class LoginRepoImpl implements LoginRepo {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  @override
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      DocumentSnapshot<Map<String, dynamic>> userDoc = await firestore
          .collection('users')
          .doc(userCredential.user?.uid)
          .get();

      if (!userDoc.exists) {
        await firestore.collection('users').doc(userCredential.user?.uid).set({
          'uid': userCredential.user?.uid,
          'email': userCredential.user?.email,
          'createdAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
      }

      return Right(UserModel.fromDocumentSnapshot(userDoc));
    } on FirebaseAuthException catch (e) {
      String friendlyMessage = getFriendlyErrorMessage(e.code);
      return Left(ServerFailure(friendlyMessage));
    }
  }

  @override
  Future<Either<Failure, String>> updatePasswordInFirestore({
    required String email,
    required String newPassword,
  }) async {
    try {
      final userQuery = await firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();
      if (userQuery.docs.isNotEmpty) {
        final userId = userQuery.docs.first.id;

        await firestore.collection('users').doc(userId).update({
          'password': newPassword,
        });
      }
      return Right("Password updated successfully.");
    } on FirebaseAuthException catch (e) {
      final String message = getFriendlyErrorMessage(e.code);
      return Left(ServerFailure(message));
    }
  }
}
