import 'package:flutter/material.dart';

/// Provides a ThemeData class implementation for the app.
final themeData = ThemeData(
  brightness: Brightness.light,
  colorSchemeSeed: const Color(0xFF2169F3),
  //useMaterial3: true,
);

@immutable
class AppTheme {
// #region
  ///
  final Color colorSchemeSeed;
// #endregion

// #region
  const AppTheme({
    this.colorSchemeSeed = const Color(0xFF8869F3),
  });
// #endregion

// #region
  ThemeData toThemeData() {
    return ThemeData(
      useMaterial3: false,
      colorSchemeSeed: colorSchemeSeed,
      brightness: Brightness.light,
    );
  }

  ThemeData toDarkThemeData() {
    return ThemeData(
      useMaterial3: false,
      colorSchemeSeed: colorSchemeSeed,
      brightness: Brightness.dark,
    );
  }
// #endregion
}
