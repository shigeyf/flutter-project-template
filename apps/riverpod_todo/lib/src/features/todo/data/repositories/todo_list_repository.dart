import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../domain/models/todo.dart';

const _uuid = Uuid();

/// An object that controls a list of [Todo].
class TodoList extends Notifier<List<Todo>> {
  @override
  List<Todo> build() => [
        const Todo(id: 'todo-0', description: 'Buy cookies'),
        const Todo(id: 'todo-1', description: 'Star Riverpod'),
        const Todo(id: 'todo-2', description: 'Have a walk'),
        const Todo(id: 'todo-3', description: 'Buy cookies'),
        const Todo(id: 'todo-4', description: 'Star Riverpod'),
        const Todo(id: 'todo-5', description: 'Have a walk'),
        const Todo(id: 'todo-6', description: 'Buy cookies'),
        const Todo(id: 'todo-7', description: 'Star Riverpod'),
        const Todo(id: 'todo-8', description: 'Have a walk'),
        const Todo(id: 'todo-9', description: 'Buy cookies'),
        const Todo(id: 'todo-10', description: 'Star Riverpod'),
        const Todo(id: 'todo-11', description: 'Have a walk'),
        const Todo(id: 'todo-12', description: 'Buy cookies'),
        const Todo(id: 'todo-13', description: 'Star Riverpod'),
        const Todo(id: 'todo-14', description: 'Have a walk'),
        const Todo(id: 'todo-15', description: 'Buy cookies'),
        const Todo(id: 'todo-16', description: 'Star Riverpod'),
        const Todo(id: 'todo-17', description: 'Have a walk'),
        const Todo(id: 'todo-18', description: 'Buy cookies'),
        const Todo(id: 'todo-19', description: 'Star Riverpod'),
      ];

  void add(String description) {
    state = [
      ...state,
      Todo(
        id: _uuid.v4(),
        description: description,
      ),
    ];
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            completed: !todo.completed,
            description: todo.description,
          )
        else
          todo,
    ];
  }

  void edit({required String id, required String description}) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            completed: todo.completed,
            description: description,
          )
        else
          todo,
    ];
  }

  void remove(Todo target) {
    state = state.where((todo) => todo.id != target.id).toList();
  }
}