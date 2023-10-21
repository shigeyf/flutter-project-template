import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides a provider global variable for [EntryRepository].
final entryRepositoryProvider = Provider((_) => EntryRepository());

/// Represents a repository for String-typed data entries.
class EntryRepository {
  final List<String> _entries = [];

  Future addEntry(String entry) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _entries.add(entry);
  }

  Future removeEntry(String entry) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _entries.remove(entry);
  }

  Future<List<String>> allEntries() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _entries;
  }
}
