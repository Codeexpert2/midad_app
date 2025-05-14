import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/pagination/models/pagination_state.dart';
import '../../../core/pagination/notifiers/paginated_list_notifier.dart';
import '../../home/constant/article_list.dart';
import '../models/article_model.dart';

class ArticleListNotifier extends PaginatedListNotifier<Article> {
  ArticleListNotifier() : super(fetchData: fetchPage);

  static Future<List<Article>> fetchPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));
    return articleList;
    // final ArticleRequests = ArticleRequests();
    // final response = await ArticleRequests.getArticles(
    //   page: page,
    //   perPage: AppConfigs.perPage,
    // );
    // return response['Articles'] as List<Article>;
  }
}

final articleListProvider = AutoDisposeStateNotifierProvider<
    ArticleListNotifier, PaginationState<Article>>(
  (ref) => ArticleListNotifier(),
);
