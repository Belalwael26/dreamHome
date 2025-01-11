import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dream_home/core/errors/errors.dart';
import 'package:dream_home/feature/auth/data/model/user_model.dart';
import 'package:dream_home/feature/auth/data/repo/register/register_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/constant/constant.dart';
import '../../../../../core/errors/user_error_message.dart';

class RegisterRepoImpl implements RegisterRepo {
  @override
  Future<Either<Failure, UserModel>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      final firestore = FirebaseFirestore.instance;

      if (user != null) {
        Map<String, dynamic> userData = {
          'uid': user.uid,
          'email': email,
          'name': name,
          'password': password,
          'createdAt': FieldValue.serverTimestamp(),
        };
        migrateTemporaryDataToNewUser(user.uid);
        await firestore
            .collection('users')
            .doc(user.uid)
            .set(userData, SetOptions(merge: true));
        DocumentSnapshot<Map<String, dynamic>> userDoc = await firestore
            .collection('users')
            .doc(userCredential.user?.uid)
            .get();
        log("Doce: $userDoc");
        return Right(UserModel.fromDocumentSnapshot(userDoc));
      }
      return Left(ServerFailure("User creation failed."));
    } on FirebaseAuthException catch (e) {
      String friendlyMessage = getFriendlyErrorMessage(e.code);
      return Left(ServerFailure(friendlyMessage));
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
