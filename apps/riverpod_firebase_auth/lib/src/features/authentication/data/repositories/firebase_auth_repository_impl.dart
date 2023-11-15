import '../../domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Implements a repository class for User Authentication.
class FireBaseAuthRepositoryImpl implements AuthRepository {
// #region
  /// A local property for [FirebaseAuth].
  final FirebaseAuth _auth;
// #endregion

// #region
  /// Constructs a [FireBaseAuthRepositoryImpl].
  const FireBaseAuthRepositoryImpl(this._auth);
// #endregion

// #region
  @override
  Stream<User?> authStateChanges() => _auth.authStateChanges();

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Future<void> signInAnonymously() {
    return _auth.signInAnonymously();
  }
// #endregion
}
