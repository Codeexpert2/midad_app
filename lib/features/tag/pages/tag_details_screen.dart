import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/components/main/debounced_search_app_bar.dart';
import 'package:midad/core/extensions/extensions.dart';

import '../../../core/locale/generated/l10n.dart';
import '../../../core/pagination/models/pagination_params.dart';
import '../../../core/pagination/paginated_list_widget.dart';
import '../../article/models/article_model.dart';
import '../../article/providers/article_list_notifier.dart';
import '../../article/widgets/article_item_widget.dart';

class TagDetailsScreen extends ConsumerWidget {
  const TagDetailsScreen({
    super.key,
    required this.tagName,
    required this.tagId,
  });
  final String tagName;
  final int tagId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(articleParamsProvider.notifier).state = PaginationParams(
        filters: {
          'tags[]': [tagId],
        },
      );
      ref.read(articleListProvider.notifier).refresh();
    });
    return Scaffold(
      appBar: DebouncedSearchAppBar(
        title: tagName,
        onDebounceChange: (value) {
          ref.read(articleParamsProvider.notifier).state =
              ref.read(articleParamsProvider).copyWith(
            query: value,
            page: 1,
            filters: {
              'tags[]': [tagId],
            },
          );

          ref.read(articleListProvider.notifier).refresh();
        },
      ),
      body: PaginatedListWidget<Article>(
        provider: articleListProvider,
        itemBuilder: (context, article) => ArticleItemWidget(
          article: article,
          width: context.width * 0.9,
          height: context.height * 0.3,
          imageHeight: context.height * 0.2,
        ),
        loadTriggerThreshold: 0.8,
        enablePullToRefresh: true,
        padding: const EdgeInsets.all(16.0),
        separatorBuilder: (context, index) => const SizedBox(height: 18),
        emptyWidget: Center(child: Text(S.of(context).noArticlesAvailable)),
        noMoreDataWidget: Center(child: Text(S.of(context).noMoreArticles)),
      ),
    );
  }
}
