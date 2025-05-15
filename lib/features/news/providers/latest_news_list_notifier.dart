import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/features/news/models/news_model.dart';

import '../../../core/pagination/models/pagination_state.dart';
import '../../../core/pagination/notifiers/paginated_list_notifier.dart';
import '../../home/constant/news_list.dart';

final newsListProvider = AutoDisposeStateNotifierProvider<
    LatestNewsListNotifier, PaginationState<News>>(
  (ref) => LatestNewsListNotifier(),
);

class LatestNewsListNotifier extends PaginatedListNotifier<News> {
  LatestNewsListNotifier() : super(fetchData: fetchPage);

  static Future<List<News>> fetchPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));
    return newsList;
    // final NewsRequests = NewsRequests();
    // final response = await NewsRequests.getNews(
    //   page: page,
    //   perPage: AppConfigs.perPage,
    // );
    // return response['News'] as List<News>;
  }
}
