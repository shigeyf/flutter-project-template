import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sembast/sembast.dart';
import 'package:isar/isar.dart';

/// Provides a Sembast database provider.
final databaseProvider =
    Provider<Database>((_) => throw Exception('Database not initialized'));

/// Provides a Isar database provider.
final isarProvider =
    Provider<Isar>((_) => throw Exception('Isar Database not initialized'));
