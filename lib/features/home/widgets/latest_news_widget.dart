import 'package:flutter/material.dart';

import 'package:midad/core/extensions/extensions.dart';
import 'package:midad/features/news/models/news_model.dart';

import '../../news/widgets/latest_news_item_widget.dart';

class LatestNewsWidget extends StatelessWidget {
  const LatestNewsWidget({super.key, required this.newsList});
  final List<News> newsList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.20,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: newsList.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final news = newsList[index];
          return LatestNewsItemWidget(
            news: news,
            height: context.height * 0.22,
            width: context.width * 0.6,
            imageHeight: context.height * 0.22,
          );
        },
      ),
    );
  }
}
