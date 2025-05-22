import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/client/client.dart';
import '../../../core/pagination/models/pagination_state.dart';
import '../../../core/pagination/notifiers/paginated_list_notifier.dart';
import '../../article/models/article_model.dart';
import '../../article/providers/article_provider.dart';
import '../models/tag_model.dart';
import '../services/tag_service.dart';

final tagServiceProvider = Provider<TagService>((ref) {
  final apiClient = ref.read(networkServiceProvider);
  return TagService(apiClient);
});

final tagSearchProvider = StateProvider.autoDispose<String?>((ref) => null);

final tagsProvider = FutureProvider.autoDispose<List<Tag>>((ref) async {
  final search = ref.watch(tagSearchProvider);
  final tagService = ref.read(tagServiceProvider);
  return await tagService.getTags(search);
});

final tagArticleSearchProvider =
    StateProvider.autoDispose<String?>((ref) => null);

final tagArticlesProvider = StateNotifierProvider.autoDispose
    .family<PaginatedListNotifier<Article>, PaginationState<Article>, int>(
  (ref, tagId) {
    final articleService = ref.read(articleServiceProvider);
    final query = ref.watch(tagArticleSearchProvider);

    return PaginatedListNotifier<Article>(
      fetchData: (int page) async {
        final res = await articleService.getArticles(
          page: page,
          query: query,
          tag: [tagId.toString()],
        );
        return res.data ?? [];
      },
    );
  },
);
