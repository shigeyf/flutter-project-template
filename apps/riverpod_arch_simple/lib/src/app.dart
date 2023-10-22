import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './app_themes.dart';
import '../src/presentation/views/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // App ThemeData
      theme: themeData,
      // Localization (L10N)
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      // Supported languages for Localization (L10N)
      supportedLocales: AppLocalizations.supportedLocales,
      // Home
      home: const HomePage(),
    );
  }
}
