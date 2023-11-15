import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import '../../providers.dart';

/// Implements a Sign-in view based on Firebase UI.
class FirebaseSignInView extends ConsumerWidget {
// #region
  /// Provides a constructor for [FirebaseSignInView].
  const FirebaseSignInView({super.key});
// #endregion

// #region
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProviders = ref.watch(authProvidersProvider);
    return Scaffold(
      body: SignInScreen(
        providers: authProviders,
        //footerBuilder: (context, action) => const SignInAnonymouslyFooter(),
      ),
    );
  }
// #endregion
}
