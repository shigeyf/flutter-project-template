import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sembast/sembast.dart';

/// Provides a Sembast database provider.
final databaseProvider =
    Provider<Database>((_) => throw Exception('Database not initialized'));
