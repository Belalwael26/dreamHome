import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dream_home/feature/auth/data/model/user_model.dart';
import 'package:dream_home/feature/auth/data/repo/login/login_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/constant/constant.dart';
import '../../../../../core/network/error/failure.dart';

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
      await migrateTemporaryDataToNewUser(userCredential.user!.uid);

      return Right(UserModel.fromDocumentSnapshot(userDoc));
    } on FirebaseAuthException catch (e) {
      // String friendlyMessage = getFriendlyErrorMessage(e.code);
      return Left(ServerFailure(e.toString()));
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
      // final String message = getFriendlyErrorMessage(e.code);
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<void> migrateTemporaryDataToNewUser(String newUid) async {
    if (tempId.isNotEmpty) {
      try {
        DocumentSnapshot tempData = await FirebaseFirestore.instance
            .collection('users')
            .doc(tempId)
            .get();

        if (tempData.exists) {
          await FirebaseFirestore.instance.collection('users').doc(newUid).set(
                tempData.data() as Map<String, dynamic>,
                SetOptions(merge: true),
              );

          await FirebaseFirestore.instance
              .collection('users')
              .doc(tempId)
              .delete();

          log('Temporary data migrated successfully.');
        }
      } catch (e) {
        log('Error during data migration: $e');
      }
    }
  }
}
