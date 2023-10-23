import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../global_providers.dart';
import './data/repositories/sembast_cake_repository.dart';
import './data/repositories/isar_cake_repository.dart';

/// Provides a provider for CakeRepository implementation with Sembast.
final sembastCakeRepositoryProvider = Provider(
  (ref) => SembastCakeRepository(
    database: ref.watch(databaseProvider),
  ),
);

/// Provides a provider for CakeRepository implementation with Isar.
final isarCakeRepositoryProvider = Provider(
  (ref) => IsarCakeRepository(isar: ref.watch(isarProvider)),
);

/// Provides a provider for CakeRepository local database implementation.
// Select Isar or Sembast implementation
//final cakeRepositoryProvider = sembastCakeRepositoryProvider;
final cakeRepositoryProvider = isarCakeRepositoryProvider;
