import '../models/cake.dart';

/// Represent an abstract class for CakeRepository for real implementations.
abstract class CakeRepository {
  /// Insert a [Cake] object.
  Future<int> insertCake(Cake cake);
  /// Update a given [Cake] object.
  Future updateCake(Cake cake);
  /// Delete the [Cake] object specified by a given identifier.
  Future deleteCake(int cakeId);
  /// Get all [Cake] objects via [Stream]
  Stream<List<Cake>> getAllCakesStream();
}
