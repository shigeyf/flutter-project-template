import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controllers/todo_list_controller.dart';

final addTodoKey = UniqueKey();

class TodoListSearch extends HookConsumerWidget {
  const TodoListSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newTodoController = useTextEditingController();
    return TextField(
      key: addTodoKey,
      controller: newTodoController,
      decoration: const InputDecoration(
        labelText: 'What needs to be done?',
      ),
      onSubmitted: (value) {
        //ref.read(todoListProvider.notifier).add(value);
        ref.read(todoListServiceProvider.notifier).add(value);
        newTodoController.clear();
      },
    );
  }
}
