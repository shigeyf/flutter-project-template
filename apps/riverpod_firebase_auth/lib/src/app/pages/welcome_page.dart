import 'package:flutter/material.dart';
import '../../features/welcome/presentation/views/welcome_view.dart';

/// Implments a page for '/welcome' of application.
class WelcomePage extends StatelessWidget {
// #region
  /// Constructs a [WelcomePage].
  const WelcomePage({super.key});
// #endregion

// #region
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        top: false,
        child: WelcomeView(),
      ),
    );
  }
// #endregion
}
