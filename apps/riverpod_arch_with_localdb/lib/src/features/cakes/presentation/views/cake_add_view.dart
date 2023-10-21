import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/cake_controller.dart';

/// Represents a widget class for adding a [Cake] object.
class CakeAddButton extends ConsumerWidget {
  const CakeAddButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(cakeControllerProvider);

    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => controller.add(),
    );
  }
}
