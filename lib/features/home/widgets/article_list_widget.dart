import 'package:flutter/material.dart';

import 'package:midad/components/images/cached_image.dart';
import 'package:midad/core/extensions/extensions.dart';

import '../../../core/themes/app_colors.dart';
import '../models/article_model.dart';

class ArticleListWidget extends StatelessWidget {
  const ArticleListWidget({super.key, required this.articleList});
  final List<Article> articleList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.27,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: articleList.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final article = articleList[index];
          return InkWell(
            onTap: () {
              // context.pushNamed(
              //   AppRoutes.articleDetails.name,
              //    extra: article.id.toString(),
              // );
            },
            child: SizedBox(
              width: context.width * 0.6,
              child: Card(
                color: AppColors.gray200.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      // child: Image.network(
                      //   article.imageUrl,
                      //   width: context.width * 0.6,
                      //   height: context.height * 0.15,
                      //   fit: BoxFit.cover,
                      // ),
                      child: CachedImage(
                        imageUrl: article.imageUrl,
                        height: context.height * 0.15,
                        width: context.width * 0.6,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                        child: Column(
                          children: [
                            Text(
                              article.title,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              article.description,
                              style: const TextStyle(fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
