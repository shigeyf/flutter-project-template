import 'package:sembast/sembast.dart';
import '../../domain/models/cake.dart';
import '../../domain/repositories/cake_repository.dart';

/// Represents a class for Sembast implementation of CakeRepository.
/// We define our Riverpod provider to provide the SembastCakeRepository
/// to other parts of our application and inject its dependencies.
class SembastCakeRepository implements CakeRepository {
  final Database database;
  late final StoreRef<int, Map<String, dynamic>> _store;

  /// Provides a constructor of [SembastCakeRepository].
  SembastCakeRepository({required this.database}) {
    _store = intMapStoreFactory.store('cake_store');
  }

  @override
  Future<int> insertCake(Cake cake) =>
      _store.add(database, cake.toJson());

  @override
  Future<void> updateCake(Cake cake) =>
      _store.record(cake.id).update(database, cake.toJson());

  @override
  Future deleteCake(int cakeId) =>
      _store.record(cakeId).delete(database);

  @override
  Stream<List<Cake>> getAllCakesStream() =>
      _store.query().onSnapshots(database).map(
            (snapshot) => snapshot
                .map((cake) => Cake.fromJson(cake.value).copyWith(id: cake.key))
                .toList(growable: false),
          );
}
