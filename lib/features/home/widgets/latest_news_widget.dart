import 'package:flutter/material.dart';

import 'package:midad/core/extensions/extensions.dart';
import 'package:midad/features/home/models/news_model.dart';

import '../../../core/themes/app_colors.dart';

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
          return SizedBox(
            width: context.width * 0.6,
            child: Card(
              color: AppColors.gray200.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    child: Image.network(
                      news.imageUrl,
                      width: context.width * 0.6,
                      height: context.height * 0.20,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.gray900.withOpacity(0.7),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        news.title,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
