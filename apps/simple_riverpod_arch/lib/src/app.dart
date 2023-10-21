import 'package:flutter/material.dart';
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
      // Home
      home: const HomePage(),
    );
  }
}
