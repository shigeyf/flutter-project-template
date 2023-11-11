import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controllers/todo_list_uncompleted_items_controller.dart';

class TodoUncompletedItemCount extends ConsumerWidget {
  const TodoUncompletedItemCount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uncompleted = ref.watch(uncompletedTodosCount);
    return uncompleted.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, trace) => Center(child: Text(error.toString())),
      data: (count) => Text(
        '$count items left',
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
