import 'package:flutter/material.dart';
//import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo/src/features/todo/presentation/views/todo_item_search.dart';
import 'package:riverpod_todo/src/features/todo/presentation/views/todo_list_view.dart';
import '../../../../app/widgets/title.dart';
//import '../controllers/todo_list_controller.dart';
//import '../controllers/todo_list_filtered_items_controller.dart';
//import '../controllers/todo_current_item_controller.dart';
//import './todo_item.dart';
import './todo_toolbar.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 42),
            Center(child: TitleWidget()),
            TodoListSearch(),
            SizedBox(height: 42),
            TodoToolbar(),
            Expanded(
              child: TodoListView(),
              // ListView(
              //   padding: EdgeInsets.zero,
              //   children: [
              //     if (todos.isNotEmpty) const Divider(height: 0),
              //     for (var i = 0; i < todos.length; i++) ...[
              //       if (i > 0) const Divider(height: 0),
              //       Dismissible(
              //         key: ValueKey(todos[i].id),
              //         onDismissed: (_) {
              //           //ref.read(todoListProvider.notifier).remove(todos[i]);
              //           ref.read(todoListServiceProvider.notifier).remove(todos[i]);
              //         },
              //         child: ProviderScope(
              //           overrides: [
              //             currentTodo.overrideWithValue(todos[i]),
              //           ],
              //           child: const TodoItem(),
              //         ),
              //       ),
              //     ],
              //   ],
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
