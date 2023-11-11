import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:riverpod_todo/src/app/pages/home_page.dart';
import './app/themes/app_themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Localization (L10N)
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      // Supported languages for Localization (L10N)
      supportedLocales: AppLocalizations.supportedLocales,
      // App ThemeData
      theme: themeData,
      home: const HomePage(),
    );
  }
}
