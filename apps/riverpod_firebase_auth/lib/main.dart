import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import './src/app.dart';
import './src/dependencies/dependency_overrides.dart';
import './firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final dependencies = DependencyOverrides();

  runApp(
    ProviderScope(
      overrides: await dependencies.getProviderOverrides(),
      child: const App(),
    ),
  );
}
