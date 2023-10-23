import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:isar/isar.dart';
import './src/features/cakes/domain/models/cake.dart';
import 'src/app.dart';
import 'src/global_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appPath = await getApplicationDocumentsDirectory();
  appPath.createSync(recursive: true);
  final dbPath = join(appPath.path, 'cakes.db');
  final database = await databaseFactoryIo.openDatabase(dbPath);
  final isar = await Isar.open([CakeSchema], directory: appPath.path);

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
