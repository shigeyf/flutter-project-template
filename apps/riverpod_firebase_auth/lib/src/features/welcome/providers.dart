import 'package:flutter_riverpod/flutter_riverpod.dart';
import './data/repositories/welcome_repository.dart';

/// A provider for [WelcomeRepository].
final welcomeRepositoryProvider = Provider<WelcomeRepository>(
  (ref) => WelcomeRepository(ref),
);
