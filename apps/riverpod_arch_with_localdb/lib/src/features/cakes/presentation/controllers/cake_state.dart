import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers.dart';

final cakesProvider = StreamProvider(
  (ref) => ref.watch(cakeRepositoryProvider).getAllCakesStream(),
);
