import 'package:flutter/material.dart';

import 'package:midad/core/extensions/extensions.dart';

import '../../article/models/article_model.dart';
import '../../article/widgets/article_item_widget.dart';

class ArticleListWidget extends StatelessWidget {
  const ArticleListWidget({super.key, required this.articleList, this.limit});
  final List<Article> articleList;
  final int? limit;

  @override
  Widget build(BuildContext context) {
    final displayList =
        limit != null ? articleList.take(limit!).toList() : articleList;
    return SizedBox(
      height: context.height * 0.27,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: displayList.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final article = displayList[index];
          return ArticleItemWidget(
            article: article,
            width: context.width * 0.6,
            imageHeight: context.height * 0.15,
          );
        },
      ),
    );
  }
}
