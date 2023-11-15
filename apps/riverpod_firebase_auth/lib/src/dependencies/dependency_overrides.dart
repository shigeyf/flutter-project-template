import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './shared_preferences_provider.dart';
import '../features/authentication/data/repositories/firebase_auth_repository_impl.dart';
import '../features/authentication/providers.dart';

class DependencyOverrides {
// #region
  Future<List<Override>> getProviderOverrides() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    List<Override> overrides = [
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      authRepositoryProvider.overrideWithValue(
        FireBaseAuthRepositoryImpl(FirebaseAuth.instance),
      )
    ];
    return overrides;
  }
// #endregion
}
