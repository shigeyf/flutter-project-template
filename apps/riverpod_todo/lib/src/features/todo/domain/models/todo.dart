import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import '../../../../app/utils/fast_hash.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

/// A read-only description of a todo-item
@freezed
@Collection(ignore: {'copyWith'})
class Todo with _$Todo {
  const Todo._();

  const factory Todo({
    required String id,
    required String description,
    @Default(false) bool completed,
  }) = _Todo;

  Id get keyId => fastHash(id);

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  factory Todo._builder(TodoBuilder builder) {
    return Todo(
      id: builder.id,
      description: builder.description,
      completed: builder.completed,
    );
  }
}

class TodoBuilder {
  static const Uuid _uuid = Uuid();

  final String id;
  final String description;
  bool completed;

  TodoBuilder({required this.description, this.completed = false})
      : id = _uuid.v1();

  Todo build() {
    return Todo._builder(this);
  }
}
