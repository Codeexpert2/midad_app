import 'package:flutter/material.dart';

import 'package:midad/core/themes/app_colors.dart';

import '../../../components/images/cached_image.dart';
import '../../../core/router/app_routes.dart';
import '../models/article_model.dart';

class ArticleItemWidget extends StatelessWidget {
  const ArticleItemWidget({
    super.key,
    required this.article,
    required this.width,
    this.height,
    required this.imageHeight,
  });

  final Article article;
  final double width;
  final double? height;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          AppRoutes.articleDetails.name,
          pathParameters: {'id': article.id.toString()},
        );
      },
      child: SizedBox(
        width: width,
        height: height,
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
                child: CachedImage(
                  imageUrl: article.imageUrl,
                  height: imageHeight,
                  width: width,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Text(
                        article.title,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 7),
                      Text(
                        article.description,
                        style: const TextStyle(fontSize: 12),
                        maxLines: 1,
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
  }
}
