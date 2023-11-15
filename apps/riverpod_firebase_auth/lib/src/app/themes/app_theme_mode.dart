import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../dependencies/shared_preferences_provider.dart';

class ThemeModeNotifier extends Notifier<ThemeMode> {
// #region
  /// A key for "welcomeCompleted" SharedPreferences parameter
  static const prefsKey = 'appThemeMode';
// #endregion

// #region
  @override
  build() {
    final prefs = ref.read(sharedPreferencesProvider);
    String? value = prefs.getString(prefsKey);
    value ??= _modeDefault;
    return _convertToThemeMode(value);
  }

  void get() {
    final prefs = ref.read(sharedPreferencesProvider);
    final value = prefs.getString(prefsKey);
    state = _convertToThemeMode(value);
  }

  void set(ThemeMode mode) async {
    final prefs = ref.read(sharedPreferencesProvider);
    final result = await prefs.setString(prefsKey, _convertToString(mode));
    if (result) {
      state = mode;
    }
  }
// #endregion

// #region
  static const String _modeDefault = 'system';
  static const String _modeDark = 'dark';
  static const String _modeLight = 'light';
  static const String _modeSystem = 'system';
// #endregion

// #region
  /// A private function to convert stringified ThemeMode to ThemeMode.
  ThemeMode _convertToThemeMode(String? mode) {
    return switch (mode) {
      _modeDark => ThemeMode.dark,
      _modeLight => ThemeMode.light,
      _modeSystem => ThemeMode.system,
      _ => ThemeMode.system, // Default value
    };
  }

  String _convertToString(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.dark => _modeDark,
      ThemeMode.light => _modeLight,
      ThemeMode.system => _modeSystem,
    };
  }
// #endregion
}

final themeModeNotifierProvider =
    NotifierProvider<ThemeModeNotifier, ThemeMode>(
  () => ThemeModeNotifier(),
);
