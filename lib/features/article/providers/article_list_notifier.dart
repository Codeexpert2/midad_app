import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/pagination/models/pagination_params.dart';
import '../../../core/pagination/models/pagination_state.dart';
import '../../../core/pagination/notifiers/paginated_list_notifier.dart';
import '../models/article_model.dart';
import '../services/article_service.dart';

final articleServiceProvider = Provider((ref) => ArticleService());

final articleParamsProvider = StateProvider<PaginationParams>((ref) {
  return const PaginationParams();
});

final articleListProvider = StateNotifierProvider.autoDispose<
    PaginatedListNotifier<Article>, PaginationState<Article>>((ref) {
  final articleService = ref.watch(articleServiceProvider);
  final params = ref.watch(articleParamsProvider);

  return PaginatedListNotifier<Article>(
    fetchData: (page) =>
        articleService.getArticles(params.copyWith(page: page)),
    itemsPerPage: params.limit,
  );
});

// final articleListProvider = AutoDisposeStateNotifierProvider<
//     ArticleListNotifier, PaginationState<Article>>(
//   (ref) => ArticleListNotifier(),
// );

// class ArticleListNotifier extends PaginatedListNotifier<Article> {
//   ArticleListNotifier() : super(fetchData: fetchPage);

//   static Future<List<Article>> fetchPage(int page) async {
//     await Future.delayed(const Duration(seconds: 2));
//     return articleList;
//     // final ArticleRequests = ArticleRequests();
//     // final response = await ArticleRequests.getArticles(
//     //   page: page,
//     //   perPage: AppConfigs.perPage,
//     // );
//     // return response['Articles'] as List<Article>;
//   }
// }
