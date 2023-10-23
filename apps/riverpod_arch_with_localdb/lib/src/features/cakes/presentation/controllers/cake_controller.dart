import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/localization/app_localizations_provider.dart';
import '../../domain/models/cake.dart';
import '../../providers.dart';
import '../../domain/repositories/cake_repository.dart';

/// Provides a provider global variable for [HomePageController].
final cakeControllerProvider = Provider(
  (ref) => CakeController(
    ref: ref,
    cakeRepository: ref.watch(cakeRepositoryProvider),
  ),
);

/// Represents a controller class for [HomePage] widget.
class CakeController {
  //static const flavors = ['apple', 'orange', 'chocolate'];
  final Ref ref;
  final CakeRepository cakeRepository;
  final List<String> flavors;

  /// Provides a constructor for [CakeController].
  CakeController({required this.ref, required this.cakeRepository})
      : flavors = [
          ref.read(appLocalizationsProvider).cakeFlavors1,
          ref.read(appLocalizationsProvider).cakeFlavors2,
          ref.read(appLocalizationsProvider).cakeFlavors3,
        ];

  // We add functions to allow the handling of delete, edit, and add actions by the user.
  // Delete will remove the cake from the database,
  // edit will increase the yummyness factor by one,
  // and add will randomly add a new flavored cake to the database.
  // Since the stream will automatically update, there is no need to query the database manually.

  Future<void> delete(Cake cake) async {
    print('CakeController Delete Cake: $cake');
    await cakeRepository.deleteCake(cake.keyId);
  }

  Future<void> edit(Cake cake) async {
    final updatedCake = cake.copyWith(yummyness: cake.yummyness + 1);
    print('CakeController Edit Cake: $updatedCake');
    await cakeRepository.updateCake(updatedCake);
  }

  Future<void> add() async {
    final flavorIndex = Random().nextInt(flavors.length - 1);
    final newCake = CakeBuilder(
        name: ref.read(appLocalizationsProvider).cakeTitle(flavors[flavorIndex]),
        yummyness: Random().nextInt(10),
    ).build();
    print(
        'CakeController Create a new Cake: $newCake (id = ${newCake.id})');
    await cakeRepository.insertCake(newCake);
  }
}
