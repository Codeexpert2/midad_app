import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/client/client.dart';
import '../../../core/pagination/models/pagination_state.dart';
import '../../../core/pagination/notifiers/paginated_list_notifier.dart';
import '../../article/models/article_model.dart';
import '../../article/providers/article_provider.dart';
import '../models/category_model.dart';
import '../services/category_service.dart';

final categoryServiceProvider = Provider<CategoryService>((ref) {
  final apiClient = ref.read(networkServiceProvider);
  return CategoryService(apiClient);
});

final categorySearchProvider =
    StateProvider.autoDispose<String?>((ref) => null);

final categoriesProvider =
    FutureProvider.autoDispose<List<Category>>((ref) async {
  final search = ref.watch(categorySearchProvider);
  final categoryService = ref.read(categoryServiceProvider);
  return await categoryService.getCategories(search);
});

final categoryArticleSearchProvider =
    StateProvider.autoDispose<String?>((ref) => null);

final categoryArticlesProvider = StateNotifierProvider.autoDispose
    .family<PaginatedListNotifier<Article>, PaginationState<Article>, int>(
  (ref, categoryId) {
    final articleService = ref.read(articleServiceProvider);
    final query = ref.watch(categoryArticleSearchProvider);
    return PaginatedListNotifier<Article>(
      fetchData: (int page) async {
        final res = await articleService.getArticles(
          page: page,
          query: query,
          category: categoryId.toString(),
        );
        return res.data ?? [];
      },
    );
  },
);
