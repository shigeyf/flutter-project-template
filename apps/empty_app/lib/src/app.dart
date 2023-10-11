// lib/src/app.dart

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/home.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ja'), // Japanese
      ],
      home: HomePage(),
      //Scaffold(
      //  body: Center(
      //    child: Text(AppLocalizations.of(context)!.appTitle),
      //    //child: Text('Hello World!'),
      //  ),
      //),
    );
  }
}
