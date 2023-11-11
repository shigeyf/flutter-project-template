import 'package:isar/isar.dart';
import '../../../../app/utils/fast_hash.dart';
import '../../domain/models/todo.dart';
import '../../domain/repositories/todo_repository.dart';

/// Represents a class for Isar implementation of CakeRepository.
/// We define our Riverpod provider to provide this class
/// to other parts of our application and inject its dependencies.
class IsarTodoRepository implements TodoRepository {
// #region
  /// Isar database instance.
  final Isar isar;
// #endregion

// #region
  /// Provides a constructor of [IsarTodoRepository].
  IsarTodoRepository({required this.isar});
// #endregion

// #region
  @override
  Future<Todo?> get(String id) {
    return _getById(fastHash(id));
  }

  @override
  Future<List<Todo>> getAll() {
    return _getCollection().where().findAll();
  }

  @override
  Future<int> insert(Todo object) async {
    int result = -1;
    await isar.writeTxn(() async {
      result = await _put(object);
      _print('insert', result, object);
    });
    return result;
  }

  @override
  Future<void> update(Todo object) async {
    await isar.writeTxn(() async {
      var result = await _put(object);
      _print('update', result, object);
    });
    return;
  }

  @override
  Future delete(int id) async {
    var result = false;
    await isar.writeTxn(() async {
      var result = await _delete(id);
      _print('delete', result, null);
    });
    return result;
  }

  @override
  Stream<List<Todo>> list() async* {
    yield* _getCollection().where().watch(fireImmediately: true);
  }
// #endregion

// #region
  /// Print for debug.
  void _print(String op, dynamic result, Todo? object) {
    assert(() {
      if (object != null) {
        print('$runtimeType: $op: Id(${object.id}) $object, Result = $result');
      } else {
        print('$runtimeType: $op: Result = $result');
      }
      return true;
    }());
  }

  /// Get an Isar collection from Isar DB (private).
  IsarCollection<Todo> _getCollection() {
    return isar.collection<Todo>(); // insert & update
  }

  /// Get a first matched entry filtered by Id from Isar (private).
  Future<Todo?> _getById(int id) async {
    final object = await _getCollection().get(id);
    return object;
  }

  /// Put an entry to Isar DB (private).
  Future<int> _put(Todo entry) async {
    return _getCollection().put(entry); // insert & update
  }

  /// Delete an entry from Isar DB (private).
  Future<bool> _delete(int id) async {
    return _getCollection().delete(id); // delete
  }
// #endregion
}
