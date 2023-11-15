import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../dependencies/shared_preferences_provider.dart';

/// Implements a class for initial startup with Welcome page.
class WelcomeRepository {
// #region
  /// A variable storing SharedPreferences
  final Ref _ref;
// #endregion

// #region
  /// Constructs a [WelcomeRepository].
  const WelcomeRepository(this._ref);
// #endregion

// #region
  /// Set [welcomeCompletedKey] completed.
  Future<void> setWelcomeCompleted() async {
    final prefs = _ref.read(sharedPreferencesProvider);
    await prefs.setBool(_prefsKey, true);
  }

  /// Check if [welcomeCompletedKey] is completed.
  bool isWelcomeCompleted() {
    final prefs = _ref.read(sharedPreferencesProvider);
    return prefs.getBool(_prefsKey) ?? false;
  }
// #endregion

// #region
  /// A key for "welcomeCompleted" SharedPreferences parameter
  static const _prefsKey = 'welcomeCompleted';
// #endregion
}
