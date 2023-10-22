import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repositories/entry_repository.dart';

/// Provides a provider global variable for entries from [EntryRepository].
final entriesProvider = FutureProvider((ref) {
  final entryRepository = ref.watch(entryRepositoryProvider);
  return entryRepository.allEntries();
});
