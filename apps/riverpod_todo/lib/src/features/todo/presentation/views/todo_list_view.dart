import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controllers/todo_list_controller.dart';
import '../controllers/todo_list_filtered_items_controller.dart';
import '../controllers/todo_current_item_controller.dart';
import './todo_item.dart';

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(filteredTodos);

    return todos.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, trace) => Center(child: Text(error.toString())),
      data: (entries) => ListView(
        padding: EdgeInsets.zero,
        children: [
          if (entries.isNotEmpty) const Divider(height: 0),
          for (var i = 0; i < entries.length; i++) ...[
            if (i > 0) const Divider(height: 0),
            Dismissible(
              key: ValueKey(entries[i].id),
              onDismissed: (_) {
                //ref.read(todoListProvider.notifier).remove(todos[i]);
                ref.read(todoListServiceProvider.notifier).remove(entries[i]);
              },
              child: ProviderScope(
                overrides: [
                  currentTodo.overrideWithValue(entries[i]),
                ],
                child: const TodoItem(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
