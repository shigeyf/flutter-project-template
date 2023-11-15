import 'package:firebase_auth/firebase_auth.dart';

/// Implements an repository interface of Authentication.
abstract class AuthRepository {
// #region
  ///
  User? get currentUser;

  ///
  Stream<User?> authStateChanges();

  ///
  Future<void> signInAnonymously();
// #endregion
}
