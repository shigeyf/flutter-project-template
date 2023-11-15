import 'package:flutter/material.dart';
import '../localization/app_localizations_context.dart';
import '../widgets/theme_mode_switcher.dart';

/// Implments a page for '/home' of application.
class HomePage extends StatelessWidget {
// #region
  /// Constructs a [HomePage].
  const HomePage({super.key});
// #endregion

// #region
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const <Widget>[
          ThemeModeSwitchIcon(),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(context.locale.hello_world),
              ),
            ],
          ),
        ),
      ),
    );
  }
// #endregion
}
