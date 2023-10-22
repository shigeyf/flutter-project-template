import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_arch_with_localdb/src/app/localization/app_localizations_context.dart';
import '../controllers/cake_controller.dart';
import '../controllers/cake_state.dart';

/// Represents a widget class for listing [Cake] objects.
class CakeListView extends ConsumerWidget {
  const CakeListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(cakeControllerProvider);
    final cakes = ref.watch(cakesProvider);

    return cakes.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, trace) => Center(child: Text(error.toString())),
        data: (cakes) => ListView.builder(
              itemCount: cakes.length,
              itemBuilder: (context, index) {
                final cake = cakes[index];
                return ListTile(
                  title: Text(cake.name),
                  subtitle: Text(context.locale.cakeYummyness(cake.yummyness)),
                  //subtitle: Text('Yummyness: ${cake.yummyness}'),
                  leading: IconButton(
                    icon: const Icon(Icons.thumb_up),
                    onPressed: () => controller.edit(cake),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => controller.delete(cake),
                  ),
                );
              },
            ));
  }
}
