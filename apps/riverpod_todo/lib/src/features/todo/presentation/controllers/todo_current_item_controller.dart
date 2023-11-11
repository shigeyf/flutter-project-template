import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/todo.dart';

/// A provider which exposes the [Todo] displayed by a [TodoItem].
///
/// By retrieving the [Todo] through a provider instead of through its
/// constructor, this allows [TodoItem] to be instantiated using the `const` keyword.
///
/// This ensures that when we add/remove/edit todos, only what the
/// impacted widgets rebuilds, instead of the entire list of items.
final currentTodo = Provider<Todo>((ref) => throw UnimplementedError());
