import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo/src/features/todo/presentation/views/todo_item_search.dart';
import '../../../../app/widgets/title.dart';
import '../controllers/todo_controller.dart';
import '../controllers/todo_list_filtered_items_controller.dart';
import '../controllers/todo_current_item_controller.dart';
import './todo_item.dart';
import './todo_toolbar.dart';

class TodoList extends HookConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(filteredTodos);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 42),
            const Center(child: TitleWidget()),
            const TodoListSearch(),
            const SizedBox(height: 42),
            const TodoToolbar(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  if (todos.isNotEmpty) const Divider(height: 0),
                  for (var i = 0; i < todos.length; i++) ...[
                    if (i > 0) const Divider(height: 0),
                    Dismissible(
                      key: ValueKey(todos[i].id),
                      onDismissed: (_) {
                        ref.read(todoListProvider.notifier).remove(todos[i]);
                      },
                      child: ProviderScope(
                        overrides: [
                          currentTodo.overrideWithValue(todos[i]),
                        ],
                        child: const TodoItem(),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
