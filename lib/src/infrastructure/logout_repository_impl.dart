import 'package:firebase_auth/firebase_auth.dart';

import '../domain/logout_repository.dart';

class LogoutRepositoryImpl extends LogoutRepository {
  LogoutRepositoryImpl(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  @override
  Future<void> signout() async {
    await _firebaseAuth.signOut();
  }
}
