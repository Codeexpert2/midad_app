import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/client/client.dart';
import '../../../core/pagination/models/pagination_state.dart';
import '../../../core/pagination/notifiers/paginated_list_notifier.dart';
import '../models/article_model.dart';
import '../services/article_service.dart';

final articleServiceProvider = Provider<ArticleService>((ref) {
  final apiClient = ref.read(networkServiceProvider);
  return ArticleService(apiClient);
});

final articleSearchProvider = StateProvider.autoDispose<String?>((ref) => null);

final articleCategoryProvider =
    StateProvider.autoDispose<String?>((ref) => null);

final articleTypeProvider = StateProvider.autoDispose<String?>((ref) => null);

final articleTagProvider =
    StateProvider.autoDispose<List<String>?>((ref) => null);

final articlesProvider = StateNotifierProvider.autoDispose<
    PaginatedListNotifier<Article>, PaginationState<Article>>(
  (ref) {
    final articleService = ref.read(articleServiceProvider);
    final query = ref.watch(articleSearchProvider);
    final category = ref.watch(articleCategoryProvider);
    final type = ref.watch(articleTypeProvider);
    final tag = ref.watch(articleTagProvider);

    return PaginatedListNotifier<Article>(
      fetchData: (int page) async {
        final res = await articleService.getArticles(
          page: page,
          query: query,
          category: category,
          type: type,
          tag: tag,
        );
        return res.data ?? [];
      },
    );
  },
);

final articleDetailsProvider =
    FutureProvider.family<Article, int>((ref, id) async {
  final service = ref.read(articleServiceProvider);
  return await service.getArticleById(id);
});
