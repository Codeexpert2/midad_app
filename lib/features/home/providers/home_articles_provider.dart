import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../configs/app_configs.dart';
import '../../../core/pagination/models/pagination_state.dart';
import '../../../core/pagination/notifiers/paginated_list_notifier.dart';
import '../../article/models/article_model.dart';
import '../../article/providers/article_provider.dart';

final homeArticlesProvider = StateNotifierProvider.autoDispose<
    PaginatedListNotifier<Article>, PaginationState<Article>>(
  (ref) {
    final articleService = ref.watch(articleServiceProvider);

    return PaginatedListNotifier<Article>(
      fetchData: (int page) async {
        final res = await articleService.getArticles(
          page: page,
        );
        return res.data ?? [];
      },
      itemsPerPage: AppConfigs.perPage,
    );
  },
);