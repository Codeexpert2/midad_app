import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/components/main/debounced_search_app_bar.dart';
import 'package:midad/core/extensions/extensions.dart';

import '../../../core/locale/generated/l10n.dart';
import '../../../core/pagination/paginated_list_widget.dart';
import '../../article/models/article_model.dart';
import '../../article/widgets/article_filter_widget.dart';
import '../../article/widgets/article_item_widget.dart';
import '../providers/tag_provider.dart';

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
      ref.read(tagArticleTagProvider.notifier).state = [tagId.toString()];
      ref.read(tagArticlesProvider.notifier).refresh();
    });

    return Scaffold(
      appBar: DebouncedSearchAppBar(
        title: tagName,
        onDebounceChange: (value) {
          ref.read(tagArticleSearchProvider.notifier).state = value;
          ref.read(tagArticlesProvider.notifier).refresh();
        },
        onFilterTap: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => ArticleFilterBottomSheet(
              articlesProvider: tagArticlesProvider,
              articleCategoryProvider: tagArticleCategoryProvider,
              articleTypeProvider: tagArticleTypeProvider,
              articleTagProvider: tagArticleTagProvider,
            ),
          );
        },
      ),
      body: PaginatedListWidget<Article>(
        provider: tagArticlesProvider,
        itemBuilder: (context, article) => ArticleItemWidget(
          article: article,
          width: context.width * 0.9,
          height: context.height * 0.3,
          imageHeight: context.height * 0.2,
        ),
        padding: const EdgeInsets.all(16.0),
        separatorBuilder: (context, index) => const SizedBox(height: 18),
        emptyWidget: Center(child: Text(S.of(context).noArticlesAvailable)),
        noMoreDataWidget: Center(child: Text(S.of(context).noMoreArticles)),
      ),
    );
  }
}
