import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/client/client.dart';
import '../../../core/pagination/models/pagination_params.dart';
import '../../../core/pagination/models/pagination_state.dart';
import '../../../core/pagination/notifiers/paginated_list_notifier.dart';
import '../models/article_model.dart';
import '../services/article_service.dart';

final articleServiceProvider = Provider<ArticleService>((ref) {
  final apiClient = ref.watch(networkServiceProvider);
  return ArticleService(apiClient);
});

final articleParamsProvider = StateProvider<PaginationParams>((ref) {
  return const PaginationParams();
});

final articlesProvider = StateNotifierProvider.autoDispose<
    PaginatedListNotifier<Article>, PaginationState<Article>>(
  (ref) {
    final articleService = ref.watch(articleServiceProvider);
    final params = ref.watch(articleParamsProvider);

    return PaginatedListNotifier<Article>(
      fetchData: (int page) async {
        final res =
            await articleService.getArticles(params.copyWith(page: page));
        return res.data ?? [];
      },
      itemsPerPage: params.limit,
    );
  },
);

final articleDetailsProvider =
    FutureProvider.family<Article, int>((ref, id) async {
  final service = ref.watch(articleServiceProvider);
  return await service.getArticleById(id);
});
