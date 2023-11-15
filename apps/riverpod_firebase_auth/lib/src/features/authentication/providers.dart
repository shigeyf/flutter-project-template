import 'package:flutter_riverpod/flutter_riverpod.dart';
import './domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide AuthProvider, EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

/// A provider for the authentication repository [AuthRepository].
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => throw UnimplementedError('No implementation of AuthRepository'),
);

final authProvidersProvider =
    Provider<List<AuthProvider<AuthListener, AuthCredential>>>(
  //(ref) => throw UnimplementedError('No implementation of AuthProviders'),
  (ref) => [
    EmailAuthProvider(),
  ],
);
