import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/pagination/models/pagination_params.dart';
import '../../../core/pagination/models/pagination_state.dart';
import '../../../core/pagination/notifiers/paginated_list_notifier.dart';
import '../models/article_model.dart';

import 'article_service_provider.dart';

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
