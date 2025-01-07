import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dream_home/core/errors/errors.dart';
import 'package:dream_home/feature/auth/data/model/user_model.dart';
import 'package:dream_home/feature/auth/data/repo/register/register_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
        await firestore.collection('users').doc(user.uid).set(userData);
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
}
