import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/core/pagination/paginated_list_widget.dart';

import '../../../components/main/debounced_search_app_bar.dart';
import '../../../core/locale/generated/l10n.dart';
import '../../article/models/article_model.dart';
import '../providers/news_provider.dart';
import '../widgets/latest_news_item_widget.dart';

class LatestNewsScreen extends ConsumerWidget {
  const LatestNewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: DebouncedSearchAppBar(
        title: S.of(context).latestNews,
        onDebounceChange: (value) {
          ref.read(newsSearchProvider.notifier).state = value;
          ref.read(newsProvider.notifier).refresh();
        },
      ),
      body: PaginatedListWidget<Article>(
        key: Key(ref.watch(newsSearchProvider) ?? ''),
        provider: newsProvider,
        itemBuilder: (context, article) =>
            LatestNewsItemWidget(article: article),
        padding: const EdgeInsets.all(16.0),
        separatorBuilder: (context, index) => const SizedBox(height: 18),
        emptyWidget: Center(child: Text(S.of(context).noNewsAvailable)),
        noMoreDataWidget: Center(child: Text(S.of(context).noMoreNews)),
      ),
    );
  }
}
