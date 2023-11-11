import 'package:flutter_riverpod/flutter_riverpod.dart';
import './domain/repositories/todo_repository.dart';

/// Provides a provider global variable for [TodoRepository].
final todoRepositoryProvider = Provider<TodoRepository>(
    (_) => throw Exception('Repository for Todo objects is not initialized'));
