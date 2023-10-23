import 'package:isar/isar.dart';
import '../../domain/models/cake.dart';
import '../../domain/repositories/cake_repository.dart';

/// Represents a class for Isar implementation of CakeRepository.
/// We define our Riverpod provider to provide the [IsarCakeRepository]
/// to other parts of our application and inject its dependencies.
class IsarCakeRepository implements CakeRepository {
  /// Isar database instance.
  final Isar isar;
  final String className = 'IsarCakeRepository';

  /// Provides a constructor of [IsarCakeRepository].
  IsarCakeRepository({required this.isar});

  /// Get a first matched entry filtered by Id from Isar (private)
  Future<int?> _getById(int id) async {
    final object = await isar.cakes.filter().keyIdEqualTo(id).findFirst();
    return object?.keyId;
  }

  /// Put an entry to Isar DB (private)
  Future<int> _put(Cake entry) async {
    return isar.cakes.put(entry); // insert & update
  }

  /// Delete an entry from Isar DB (private)
  Future<bool> _delete(int id) async {
    return isar.cakes.delete(id); // delete
  }

  @override
  Future<int> insertCake(Cake cake) async {
    int result = -1;
    await isar.writeTxn(() async {
      result = await _put(cake);
      print('$className: insertCake = Id(${cake.keyId}) $cake, Result = $result');
    });
    return result;
  }

  @override
  Future<void> updateCake(Cake cake) async {
    await isar.writeTxn(() async {
      var result = await _put(cake);
      print('$className: updateCake = Id(${cake.keyId}) $cake, Result = $result');
    });
    return;
  }

  @override
  Future deleteCake(int cakeId) async {
    final result = _getById(cakeId);
    await isar.writeTxn(() async {
      var result = await _delete(cakeId);
      print('$className: deleteCake = Id($cakeId), Result = $result');
    });
    return result;
  }

  @override
  Stream<List<Cake>> getAllCakesStream() async* {
    for (var cake in await isar.cakes.where().sortByCreatedAt().findAll()) {
      print('$className: getAllCakesStreamRecord Key=${cake.keyId}:$cake');
    }
    yield* isar.cakes.where().sortByCreatedAt().watch(fireImmediately: true);
  }
}
