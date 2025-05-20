import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/components/main/debounced_search_app_bar.dart';
import 'package:midad/core/extensions/extensions.dart';

import '../../../core/locale/generated/l10n.dart';
import '../../../core/pagination/paginated_list_widget.dart';
import '../../article/models/article_model.dart';
import '../../article/widgets/article_filter_widget.dart';
import '../../article/widgets/article_item_widget.dart';
import '../providers/category_provider.dart';

class CategoryDetailsScreen extends ConsumerWidget {
  const CategoryDetailsScreen({
    super.key,
    required this.categoryName,
    required this.categoryId,
  });
  final String categoryName;
  final int categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(categoryArticleCategoryProvider.notifier).state =
          categoryId.toString();
      ref.read(categoryArticlesProvider.notifier).refresh();
    });
    return Scaffold(
      appBar: DebouncedSearchAppBar(
        title: categoryName,
        onDebounceChange: (value) {
          ref.read(categoryArticleSearchProvider.notifier).state = value;
          ref.read(categoryArticlesProvider.notifier).refresh();
        },
        onFilterTap: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => ArticleFilterBottomSheet(
              articlesProvider: categoryArticlesProvider,
              articleCategoryProvider: categoryArticleCategoryProvider,
              articleTypeProvider: categoryArticleTypeProvider,
              articleTagProvider: categoryArticleTagProvider,
            ),
          );
        },
      ),
      body: PaginatedListWidget<Article>(
        provider: categoryArticlesProvider,
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
