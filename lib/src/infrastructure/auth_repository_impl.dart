import 'package:firebase_auth/firebase_auth.dart';

import '../domain/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  @override
  Stream<User?> onAuthStateChanged() async* {
    yield* _firebaseAuth
        .authStateChanges()
        .asyncMap<User?>((firebaseUser) async => firebaseUser)
        .handleError((_) => null);
  }
}
