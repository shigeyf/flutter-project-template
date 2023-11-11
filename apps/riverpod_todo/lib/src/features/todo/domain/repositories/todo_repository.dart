import '../models/todo.dart';

/// Represent an abstract class for data repository for real implementations.
abstract class TodoRepository {
  /// Get a [Todo] object.
  Future<Todo?> get(String id);
  /// Get a [List] object of all [Todo] objects.
  Future<List<Todo>> getAll();
  /// Insert a [Todo] object.
  Future<int> insert(Todo entry);
  /// Update a given [Todo] object.
  Future update(Todo entry);
  /// Delete the [Todo] object specified by a given identifier.
  Future delete(int id);
  /// Get a [List] object of all [Todo] objects via [Stream].
  Stream<List<Todo>> list();
}
