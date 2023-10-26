import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/dependencies/isar_provider_impl.dart';
import 'src/dependencies/sembast_provider_impl.dart';
import 'src/app.dart';
import 'src/global_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup dependencies
  final database = await SembastProviderImpl.databaseDependency();
  final isar = await IsarProviderImpl.isarDependency();

  runApp(
    ProviderScope(
      overrides: [
        databaseProvider.overrideWithValue(database),
        isarProvider.overrideWithValue(isar),
      ],
      child: const App(),
    ),
  );
}
