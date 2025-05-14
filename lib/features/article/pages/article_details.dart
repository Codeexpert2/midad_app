import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/core/themes/app_colors.dart';

import '../../../core/constants/images.dart';
import '../../../core/extensions/extensions.dart';
import '../../home/constant/article_list.dart';

class ArticleDetailsScreen extends ConsumerWidget {
  const ArticleDetailsScreen({super.key, required this.articleId});
  final int articleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final article =
        articleList.firstWhere((article) => article.id == articleId);

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: article.imageUrl.isNotEmpty == true
                ? DecorationImage(
                    image: NetworkImage(
                      article.imageUrl,
                    ),
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fitWidth,
                  )
                : const DecorationImage(
                    image: AssetImage(AppImages.imagesMidadLogoG),
                    alignment: Alignment.topCenter,
                    scale: 2.5,
                    // fit: BoxFit.fitWidth,
                  ),
            // gradient: const LinearGradient(
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   colors: [defaultNavyBlue, defaultPurple],
            // ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.8),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              SizedBox(
                height:context.height * 0.2,
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(60, 40),
                    topRight: Radius.elliptical(60, 40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(article.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 20.0),
                      
                      Text(article.description,
                          maxLines: null,
                          style: const TextStyle(
                            fontSize: 14.0,
                          )),
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
