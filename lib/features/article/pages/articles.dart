import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/core/extensions/extensions.dart';

import '../../../components/main/main_appbar.dart';
import '../../../core/locale/generated/l10n.dart';
import '../../../core/pagination/paginated_list_widget.dart';
import '../models/article_model.dart';
import '../providers/article_list_notifier.dart';
import '../providers/articles_notifier.dart';
import '../widgets/article_item_widget.dart';

class ArticlesScreen extends ConsumerWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: MainAppBar(
        title: S.of(context).articles,
      ),
      body: Expanded(
        child: PaginatedListWidget<Article>(
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
          scrollController: ref.watch(articleProvider).scrollController,
        ),
      ),
    );
  }
}
