import 'dart:async';
import 'package:flutter/foundation.dart';

/// Implements a listener class for routing refresh logic
/// This class was imported from the migration guide for GoRouter 5.0
class GoRouterRefreshStream extends ChangeNotifier {
// #region
  /// A stream subscription variable.
  late final StreamSubscription<dynamic> _subscription;
// #endregion

// #region
  /// Provides a constructor for [GoRouterRefreshStream].
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }
// #endregion

// #region
  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
// #endregion
}
