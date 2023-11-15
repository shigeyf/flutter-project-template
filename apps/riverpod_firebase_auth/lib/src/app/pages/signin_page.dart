import 'package:flutter/material.dart';
import '../themes/app_icons.dart';
import '../localization/app_localizations_context.dart';
import '../../features/authentication/presentation/views/firebase_signin_view.dart';

/// Implments a page for '/signin' of application.
class SigninPage extends StatelessWidget {
// #region
  /// Constructs a [SigninPage].
  const SigninPage({super.key});
// #endregion

// #region
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(signinIcon),
        title: Text(context.locale.signin),
      ),
      body: const SafeArea(
        top: false,
        child: FirebaseSignInView(),
      ),
    );
  }
// #endregion
}
