import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/todo_list_service.dart';
import '../../data/repositories/todo_list_repository.dart';
import '../../domain/models/todo.dart';

/// Creates a [TodoList] and initialise it with pre-defined values.
///
/// We are using [StateNotifierProvider] here as a `List<Todo>` is a complex
/// object, with advanced business logic like how to edit a todo.
final todoListProvider = NotifierProvider<TodoList, List<Todo>>(TodoList.new);

/// A provider for [TodoListService].
final todoListServiceProvider =
    AsyncNotifierProvider<TodoListService, List<Todo>>(
  () => TodoListService(),
);
