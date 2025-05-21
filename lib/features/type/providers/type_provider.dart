import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/client/client.dart';
import '../../../core/pagination/models/pagination_state.dart';
import '../../../core/pagination/notifiers/paginated_list_notifier.dart';
import '../../article/models/article_model.dart';
import '../../article/providers/article_provider.dart';
import '../models/type_model.dart';
import '../services/type_service.dart';

final typeServiceProvider = Provider<TypeService>((ref) {
  final apiClient = ref.read(networkServiceProvider);
  return TypeService(apiClient);
});

final typeSearchProvider = StateProvider.autoDispose<String?>((ref) => null);

final typesProvider = FutureProvider.autoDispose<List<TypeModel>>((ref) async {
  final search = ref.watch(typeSearchProvider);
  final typeService = ref.read(typeServiceProvider);
  return await typeService.getTypes(search);
});

final typeArticleSearchProvider =
    StateProvider.autoDispose<String?>((ref) => null);

final typeArticleCategoryProvider =
    StateProvider.autoDispose<String?>((ref) => null);

final typeArticleTagProvider =
    StateProvider.autoDispose<List<String>?>((ref) => null);

final typeArticlesProvider = StateNotifierProvider.autoDispose
    .family<PaginatedListNotifier<Article>, PaginationState<Article>, int>(
  (ref, typeId) {
    final articleService = ref.read(articleServiceProvider);
    final query = ref.watch(typeArticleSearchProvider);
    final category = ref.watch(typeArticleCategoryProvider);
    final tag = ref.watch(typeArticleTagProvider);

    return PaginatedListNotifier<Article>(
      fetchData: (int page) async {
        final res = await articleService.getArticles(
          page: page,
          category: category,
          query: query,
          type: typeId.toString(),
          tag: tag,
        );
        return res.data ?? [];
      },
    );
  },
);
