import 'package:sembast/sembast.dart';
import '../../domain/models/cake.dart';
import '../../domain/repositories/cake_repository.dart';

/// Represents a class for Sembast implementation of CakeRepository.
/// We define our Riverpod provider to provide the SembastCakeRepository
/// to other parts of our application and inject its dependencies.
class SembastCakeRepository implements CakeRepository {
  final Database database;
  late final StoreRef<int, Map<String, dynamic>> _store;
  final String className = 'SembastCakeRepository';

  /// Provides a constructor of [SembastCakeRepository].
  SembastCakeRepository({required this.database}) {
    _store = intMapStoreFactory.store('cake_store');
  }

  @override
  Future<int> insertCake(Cake cake) async {
    print('$className: insertCake = Id(${cake.keyId}) $cake');
    //return _store.add(database, cake.toJson());
    await _store.record(cake.keyId).put(database, cake.toJson());
    return cake.keyId;
  }

  @override
  Future<void> updateCake(Cake cake) {
    print('$className: updateCake = Id(${cake.keyId}) $cake');
    return _store.record(cake.keyId).update(database, cake.toJson());
  }

  @override
  Future deleteCake(int cakeId) {
    print('$className: deleteCake = Id($cakeId)');
    return _store.record(cakeId).delete(database);
  }

  @override
  Stream<List<Cake>> getAllCakesStream() {
    var finder = Finder(sortOrders: [SortOrder('createdAt')]);
    return _store.query(finder: finder).onSnapshots(database).map((snapshot) =>
        snapshot.map((cake) {
          print('$className: getAllCakesStreamRecord Key=${cake.key}:$cake');
          return Cake.fromJson(cake.value);
        }).toList(growable: false));
  }
}
