import 'package:firebase_auth/firebase_auth.dart';

import '../domain/login_repository.dart';
import '../domain/result_or.dart';
import '../domain/register_failure.dart';
import '../domain/signin_failure.dart';
import '../domain/email/email.dart';
import '../domain/password/password.dart';

class LoginRepositoryImpl extends LoginRepository {
  LoginRepositoryImpl(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  @override
  Future<ResultOr<RegisterFailure>> register({
    required Email email,
    required Password password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.getOrCrash(),
        password: password.getOrCrash(),
      );

      return ResultOr.success();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return ResultOr.failure(RegisterFailure.emailAlreadyInUse());
        case 'invalid-email':
          return ResultOr.failure(RegisterFailure.invalidEmail());
        case 'operation-not-allowed':
          return ResultOr.failure(RegisterFailure.operationNotAllowed());
        case 'weak-password':
          return ResultOr.failure(RegisterFailure.weakPassword());
        default:
          return ResultOr.failure(RegisterFailure.unknownError());
      }
    } catch (_, __) {
      return ResultOr.failure(RegisterFailure.unknownError());
    }
  }

  @override
  Future<ResultOr<SigninFailure>> signin({
    required Email email,
    required Password password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email.getOrCrash(),
        password: password.getOrCrash(),
      );

      return ResultOr.success();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          return ResultOr.failure(SigninFailure.invalidEmail());
        case 'user-disabled':
          return ResultOr.failure(SigninFailure.userDisabled());
        case 'user-not-found':
          return ResultOr.failure(SigninFailure.userNotFound());
        case 'wrong-password':
          return ResultOr.failure(SigninFailure.wrongPassword());
        default:
          return ResultOr.failure(SigninFailure.unknownError());
      }
    } catch (_, __) {
      return ResultOr.failure(SigninFailure.unknownError());
    }
  }
}
