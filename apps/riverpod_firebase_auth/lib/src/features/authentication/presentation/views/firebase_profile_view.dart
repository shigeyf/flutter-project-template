import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import '../../providers.dart';

/// Implements a User Profile view based on Firebase UI.
class FirebaseProfileView extends ConsumerWidget {
// #region
  /// Provides a constructor for [FirebaseProfileView].
  const FirebaseProfileView({super.key});
// #endregion

// #region
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProviders = ref.watch(authProvidersProvider);
    return Scaffold(
      body: ProfileScreen(
        providers: authProviders,
      ),
    );
  }
// #endregion
}
