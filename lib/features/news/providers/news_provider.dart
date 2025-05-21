import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../configs/app_configs.dart';
import '../../../core/pagination/models/pagination_state.dart';
import '../../../core/pagination/notifiers/paginated_list_notifier.dart';
import '../../article/models/article_model.dart';
import '../../article/providers/article_provider.dart';

final newsSearchProvider = StateProvider.autoDispose<String?>((ref) => null);

final newsProvider = StateNotifierProvider.autoDispose<
    PaginatedListNotifier<Article>, PaginationState<Article>>(
  (ref) {
    final articleService = ref.read(articleServiceProvider);
    final query = ref.watch(newsSearchProvider);

    return PaginatedListNotifier<Article>(
      fetchData: (int page) async {
        final res = await articleService.getArticles(
          page: page,
          query: query,
          type: AppConfigs.newsTypeId.toString(),
        );
        return res.data ?? [];
      },
    );
  },
);
