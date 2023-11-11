import 'package:flutter_riverpod/flutter_riverpod.dart';
import './todo_list_controller.dart';

/// The number of uncompleted todos
///
/// By using [Provider], this value is cached, making it performant.\
/// Even multiple widgets try to read the number of uncompleted todos,
/// the value will be computed only once (until the todo-list changes).
///
/// This will also optimise unneeded rebuilds if the todo-list changes, but the
/// number of uncompleted todos doesn't (such as when editing a todo).
final uncompletedTodosCount_old = Provider<int>((ref) {
  return ref.watch(todoListProvider).where((todo) => !todo.completed).length;
});

final uncompletedTodosCount = FutureProvider<int>((ref) async {
  final todos = await ref.watch(todoListServiceProvider.future);
  return todos.where((todo) => !todo.completed).length;
});
