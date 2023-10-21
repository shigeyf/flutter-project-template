import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/cake.dart';
import '../../providers.dart';
import '../../domain/repositories/cake_repository.dart';

/// Provides a provider global variable for [HomePageController].
final cakeControllerProvider = Provider(
  (ref) => CakeController(
    cakeRepository: ref.watch(cakeRepositoryProvider),
  ),
);

/// Represents a controller class for [HomePage] widget.
class CakeController {
  static const flavors = ['apple', 'orange', 'chocolate'];
  final CakeRepository cakeRepository;

  /// Provides a constructor for [CakeController].
  CakeController({required this.cakeRepository});

  // We add functions to allow the handling of delete, edit, and add actions by the user.
  // Delete will remove the cake from the database,
  // edit will increase the yummyness factor by one,
  // and add will randomly add a new flavored cake to the database.
  // Since the stream will automatically update, there is no need to query the database manually.

  Future<void> delete(Cake cake) async {
    await cakeRepository.deleteCake(cake.id);
  }

  Future<void> edit(Cake cake) async {
    final updatedCake = cake.copyWith(yummyness: cake.yummyness + 1);
    await cakeRepository.updateCake(updatedCake);
  }

  Future<void> add() async {
    final flavorIndex = Random().nextInt(flavors.length - 1);
    final newCake = Cake(
      name: 'My yummy ${flavors[flavorIndex]} cake',
      yummyness: Random().nextInt(10),
    );
    await cakeRepository.insertCake(newCake);
  }
}
