import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/dependencies/isar_provider_impl.dart';
import './src/app.dart';
import './src/dependencies/global_providers.dart';
import './src/features/todo/providers.dart';
import './src/features/todo/data/repositories/isar_todo_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isar = await IsarProviderImpl.isarDependency();
  final isarTodoRepository = IsarTodoRepository(isar: isar);

  runApp(
    ProviderScope(
      overrides: [
        isarProvider.overrideWithValue(isar),
        todoRepositoryProvider.overrideWithValue(isarTodoRepository),
      ],
      child: const App(),
    ),
  );
}
