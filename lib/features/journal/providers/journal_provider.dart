import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/core/client/client.dart';
import 'package:midad/core/pagination/models/pagination_state.dart';
import 'package:midad/core/pagination/notifiers/paginated_list_notifier.dart';

import '../models/journal_model.dart';
import '../services/journal_service.dart';

final journalServiceProvider = Provider<JournalService>((ref) {
  final apiClient = ref.watch(networkServiceProvider);
  return JournalService(apiClient);
});

final journalSearchProvider = StateProvider<String?>(
  (ref) => null,
);

final journalProvider = StateNotifierProvider.autoDispose<
    PaginatedListNotifier<Journal>, PaginationState<Journal>>(
  (ref) {
    final journalService = ref.watch(journalServiceProvider);
    final search = ref.watch(journalSearchProvider);
    return PaginatedListNotifier<Journal>(
      fetchData: (int page) async {
        final res = await journalService.getJournal(
          search: search,
          page: page,
        );
        return res.data ?? [];
      },
    );
  },
);
final journalDetailsProvider =
    FutureProvider.family<Journal, String>((ref, id) async {
  final journalsService = ref.watch(journalServiceProvider);
  return await journalsService.getJournalById(id);
});