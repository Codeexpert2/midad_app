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

final tagArticleCategoryProvider =
    StateProvider.autoDispose<String?>((ref) => null);

final tagArticleTypeProvider =
    StateProvider.autoDispose<String?>((ref) => null);

final tagArticleTagProvider =
    StateProvider.autoDispose<List<String>?>((ref) => null);

final tagArticlesProvider = StateNotifierProvider.autoDispose<
    PaginatedListNotifier<Article>, PaginationState<Article>>((ref) {
  final articleService = ref.read(articleServiceProvider);
  final query = ref.watch(tagArticleSearchProvider);
  final category = ref.watch(tagArticleCategoryProvider);
  final type = ref.watch(tagArticleTypeProvider);
  final tag = ref.watch(tagArticleTagProvider);
  return PaginatedListNotifier<Article>(
    fetchData: (int page) async {
      final res = await articleService.getArticles(
        page: page,
        category: category,
        query: query,
        type: type,
        tag: tag,
      );
      return res.data ?? [];
    },
  );
});
