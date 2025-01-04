import 'package:dartz/dartz.dart';
import 'package:dream_home/core/errors/errors.dart';
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
      return Left(ServerFailure(e.message!));
    }
  }
}
