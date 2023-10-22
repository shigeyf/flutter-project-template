import 'package:flutter/material.dart';
import '../../app/localization/app_localizations_context.dart';
import '../../features/cakes/presentation/views/cake_list_view.dart';
import '../../features/cakes/presentation/views/cake_add_view.dart';

/// Represents a class for [HomePage]
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.locale.homePageTitle),
      ),
      body: const SafeArea(
        top: false,
        child: CakeListView(),
      ),
      floatingActionButton: const CakeAddButton(),
    );
  }
}
