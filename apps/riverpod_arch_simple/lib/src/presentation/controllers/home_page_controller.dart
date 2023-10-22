import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/entry_repository.dart';
import '../../application/entry_service.dart';

/// Provides a provider global variable for [HomePageController].
final homePageControllerProvider = Provider((ref) {
  final entryRepository = ref.watch(entryRepositoryProvider);
  return HomePageController(ref: ref, entryRepository: entryRepository);
});

/// Represents a controller class for [HomePage] widget.
class HomePageController {
  final ProviderRef ref;
  final EntryRepository entryRepository;

  /// Provides a constructor for [HomePageController].
  HomePageController({required this.ref, required this.entryRepository});

  // The ProviderRef gives us access to functions involving the state of our app.
  // It is used in lines 24 and 29 to tell the entriesProvider
  // to refresh its state once we performed actions on our EntryRepository.

  addEntry(String entry) {
    entryRepository.addEntry(entry);
    // ignore: unused_result
    ref.refresh(entriesProvider); // Refresh state
  }

  removeEntry(String entry) {
    entryRepository.removeEntry(entry);
    // ignore: unused_result
    ref.refresh(entriesProvider); // Refresh state
  }
}
