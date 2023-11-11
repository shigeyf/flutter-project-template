import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

/// Provides a Isar database provider.
final isarProvider =
    Provider<Isar>((_) => throw Exception('Isar Database not initialized'));
