import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers.dart';

class WelcomeController extends AutoDisposeAsyncNotifier<void> {
// #region
  @override
  FutureOr<void> build() {
    // no op
  }
// #endregion

// #region
  Future<void> completeWelcome() async {
    final welcomeRepository = ref.watch(welcomeRepositoryProvider);
    state = const AsyncLoading();
    state =
        await AsyncValue.guard(() => welcomeRepository.setWelcomeCompleted());
  }
// #endregion
}

final welcomeControllerProvider =
    AutoDisposeAsyncNotifierProvider<WelcomeController, void>(
  WelcomeController.new,
);
