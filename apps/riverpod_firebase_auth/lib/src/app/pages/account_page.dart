import 'package:flutter/material.dart';
import '../localization/app_localizations_context.dart';
import '../../features/authentication/presentation/views/firebase_profile_view.dart';

/// Implments a page for '/account' of application.
class AccountPage extends StatelessWidget {
// #region
  /// Constructs a [AccountPage].
  const AccountPage({super.key});
// #endregion

// #region
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.locale.account),
      ),
      body: const SafeArea(
        top: false,
        child: FirebaseProfileView(),
      ),
    );
  }
// #endregion
}
