import 'package:flutter/material.dart';
import './app/themes/themes.dart';
import './app/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // App ThemeData
      theme: themeData,
      home: const HomePage(),
    );
  }
}
