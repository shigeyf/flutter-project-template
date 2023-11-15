import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import './app/configs/router.dart';
import './app/themes/app_themes.dart';
import 'app/themes/app_theme_mode.dart';

/// Implements a App root.
class App extends ConsumerWidget {
// #region
  /// Provides a constructor for [App].
  const App({super.key});
// #endregion

// #region
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const appTheme = AppTheme();
    final goRouterConfig = ref.watch(goRouterCofigProvider);
    final themeMode = ref.watch(themeModeNotifierProvider);

    return MaterialApp.router(
      //title: appTitle,
      debugShowCheckedModeBanner: false,
      // App ThemeData
      theme: appTheme.toThemeData(),
      darkTheme: appTheme.toDarkThemeData(),
      themeMode: themeMode,
      // Localization (L10N)
      localizationsDelegates: [
        ...AppLocalizations.localizationsDelegates,
        FirebaseUILocalizations.delegate,
      ],
      // Supported languages for Localization (L10N)
      supportedLocales: AppLocalizations.supportedLocales,
      // Router configurations
      routerConfig: goRouterConfig,
    );
  }
// #endregion
}
