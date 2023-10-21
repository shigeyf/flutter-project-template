import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../global_providers.dart';
import './data/repositories/sembast_cake_repository.dart';

/// Provides a provider for CakeRepository implementation with Sembast.
final cakeRepositoryProvider = Provider(
  (ref) => SembastCakeRepository(
    database: ref.watch(databaseProvider),
  ),
);
