import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/main/main_appbar.dart';
import '../../home/constant/article_list.dart';

class ArticleDetailsScreen extends ConsumerWidget {
  const ArticleDetailsScreen({super.key, required this.articleId});
  final int articleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final article =
        articleList.firstWhere((article) => article.id == articleId);
        
    return Scaffold(
      appBar: MainAppBar(
        title: article.title,
      ),
    );
  }
}
