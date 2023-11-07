import 'package:riverpod_arch_with_localdb/src/app/utils/in_memory_store.dart';

import '../../domain/models/cake.dart';
import '../../domain/repositories/cake_repository.dart';

/// Represents a class for In-memory implementation of CakeRepository.
/// We define our Riverpod provider to provide the SembastCakeRepository
/// to other parts of our application and inject its dependencies.
class InMemoryCakeRepository implements CakeRepository {
  final _store = InMemoryStore<List<Cake>>(<Cake>[]);
  final String className = 'InMemoryCakeRepository';
  final bool addDelay;

  /// Provides a constructor of [InMemoryCakeRepository].
  InMemoryCakeRepository({this.addDelay = false});

  @override
  Future<int> insertCake(Cake cake) async {
    print('$className: insertCake = Id(${cake.keyId}) $cake');
    if (addDelay) await Future.delayed(const Duration(seconds: 1));
    final list = _store.value;
    list.add(cake);
    _store.value = list;
    return cake.keyId;
  }

  @override
  Future<void> updateCake(Cake cake) async {
    print('$className: updateCake = Id(${cake.keyId}) $cake');
    if (addDelay) await Future.delayed(const Duration(seconds: 1));
    final list = _store.value;
    final index =
        list.indexWhere((element) => element.keyId == cake.keyId);
    if (index != -1) {
      list[index] = cake;
      _store.value = list;
      return;
    }
    return;
  }

  @override
  Future deleteCake(int cakeId) async {
    print('$className: deleteCake = Id($cakeId)');
    if (addDelay) await Future.delayed(const Duration(seconds: 1));
    final list = _store.value;
    list.removeWhere((element) => element.keyId == cakeId);
    _store.value = list;
    return;
  }

  @override
  Stream<List<Cake>> getAllCakesStream() {
    print('$className: getAllCakesStream');
    print(_store.value);
    return _store.stream;
  }
}
