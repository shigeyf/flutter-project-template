import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/themes/app_icons.dart';
import '../localization/app_localizations_context.dart';

/// Provides Stateful Navigation Bar widget wrapped by Scaffold.
/// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
class ScaffoldWithStatefulNavigationBar extends StatelessWidget {
// #region
  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;
// #endregion

// #region
  /// Constructs a [ScaffoldWithStatefulNavigationBar].
  const ScaffoldWithStatefulNavigationBar({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithStatefulNavigationBar'));
// #endregion

// #region
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(homeIcon),
            label: context.locale.home,
            activeIcon: const Icon(homeIconActive),
          ),
          BottomNavigationBarItem(
            icon: const Icon(accountIcon),
            label: context.locale.account,
            activeIcon: const Icon(accountIconActive),
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }
// #endregion

// #region
  /// Navigate to the current location of the branch at the provided index when
  /// tapping an item in the BottomNavigationBar.
  void _onTap(BuildContext context, int index) {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }
// #endregion
}
