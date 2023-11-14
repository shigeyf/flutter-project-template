import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers.dart';
import '../domain/repositories/todo_repository.dart';
import '../domain/models/todo.dart';

/// [TodoListService]
class TodoListService extends AsyncNotifier<List<Todo>> {
// #region
  /// A repository for Todo list.
  late final TodoRepository repository;
// #endregion

// #region
  /// Provides a constructor for [TodoListService].
  TodoListService();
// #endregion

// #region
  @override
  FutureOr<List<Todo>> build() async {
    repository = ref.watch(todoRepositoryProvider);
    return await repository.getAll();
  }

  // We add functions to allow the handling of delete, edit, and add actions by the user.
  // Delete will remove the cake from the database,
  // edit will increase the yummyness factor by one,
  // and add will randomly add a new flavored cake to the database.
  // Since the stream will automatically update, there is no need to query the database manually.

  Future<void> add(String description) async {
    state = const AsyncLoading();

    final newEntry = TodoBuilder(
      description: description,
    ).build();
    final id = await repository.insert(newEntry);
    print('$runtimeType:add(): $newEntry (id = $id)');

    state = await AsyncValue.guard<List<Todo>>(() => repository.getAll());
  }

  Future<void> edit({required String id, required String description}) async {
    final entry = await repository.get(id);
    if (entry != null) {
      state = const AsyncLoading();
      final updatedEntry = entry.copyWith(description: description);
      await repository.update(updatedEntry);
      print('$runtimeType:update(): $updatedEntry (id = ${updatedEntry.id})');
      state = await AsyncValue.guard(() => repository.getAll());
      return;
    }
    print('$runtimeType:update(): No entry found (id = $id)');
  }

  Future<void> remove(Todo entry) async {
    state = const AsyncLoading();

    final result = await repository.delete(entry.keyId);
    print('$runtimeType:delete(): $result ($entry)');

    state = await AsyncValue.guard(() => repository.getAll());
  }

  Future<void> toggle(String id) async {

    final entry = await repository.get(id);
    if (entry != null) {
      state = const AsyncLoading();
      final updatedEntry = entry.copyWith(completed: !(entry.completed));
      await repository.update(updatedEntry);
      print('$runtimeType:update(): $updatedEntry (id = ${updatedEntry.id})');
      state = await AsyncValue.guard(() => repository.getAll());
      return;
    }
    print('$runtimeType:update(): No entry found (id = $id)');

  }
// #endregion
}
