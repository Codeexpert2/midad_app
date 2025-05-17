import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/pagination/models/pagination_params.dart';
import '../../article/models/article_model.dart';
import '../../article/providers/article_service_provider.dart';

final homeArticlesNotifierProvider =
    AsyncNotifierProvider<HomeArticlesNotifier, List<Article>>(() {
  return HomeArticlesNotifier();
});

class HomeArticlesNotifier extends AsyncNotifier<List<Article>> {
  @override
  Future<List<Article>> build() async {
    final articleService = ref.read(articleServiceProvider);
    // TODO use pagintion
    return await articleService.getArticles(const PaginationParams(limit: 10));
  }
}
