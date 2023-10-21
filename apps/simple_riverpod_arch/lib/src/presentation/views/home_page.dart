import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../application/entry_service.dart';
import '../controllers/home_page_controller.dart';
import '../../localization/app_localizations_context.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  onAdd(BuildContext context, WidgetRef ref) {
    ref
        .read(homePageControllerProvider)
        .addEntry(DateFormat(context.locale.dateFormat).format(DateTime.now()));
  }

  onRemove(WidgetRef ref, String entry) {
    ref.read(homePageControllerProvider).removeEntry(entry);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.locale.appBarTitle),
      ),
      body: ref.watch(entriesProvider).when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, trace) => Center(child: Text(error.toString())),
            data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return ListTile(
                  title: Text(item),
                  onTap: () => onRemove(ref, item),
                );
              },
            ),
          ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => onAdd(context, ref),
      ),
    );
  }
}
