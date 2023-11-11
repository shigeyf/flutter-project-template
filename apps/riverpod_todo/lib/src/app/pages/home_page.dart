import 'package:flutter/material.dart';
import 'package:riverpod_todo/src/features/todo/presentation/views/todo_list.dart';

/// Implments a screen for 'home' of application.
class HomePage extends StatelessWidget {
// #region
  /// Constructs a [HomePage].
  const HomePage({super.key});
// #endregion

// #region
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        top: false,
        child: TodoList(),
      ),
    );
  }
// #endregion
}
