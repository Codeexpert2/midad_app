import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/main/main_appbar.dart';
import '../../../core/constants/images.dart';
import '../../../core/extensions/extensions.dart';
import '../../../core/helpers/date_helper.dart';
import '../../../core/themes/app_colors.dart';
import '../../home/constant/article_list.dart';

class ArticleDetailsScreen extends ConsumerWidget {
  const ArticleDetailsScreen({super.key, required this.articleId});
  final int articleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final article =
        articleList.firstWhere((article) => article.id == articleId);
    final formattedDate =
        DateHelper.format(article.date, pattern: 'MMM d, yyyy');

    return Scaffold(
      appBar: const MainAppBar(title: ''),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Center(
                child: Text(
                  article.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                ),
              ),
              const SizedBox(height: 30.0),

              /// Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  article.imageUrl,
                  width: double.infinity,
                  height: context.height * 0.28,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Image(
                    image: AssetImage(AppImages.imagesMidadLogoG),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 25.0),

              /// Author
              Row(
                children: [
                  const Icon(Icons.person, size: 16, color: AppColors.gray600),
                  const SizedBox(width: 4),
                  Text(
                    article.author ?? 'Unknown Author',
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              /// Date
              Row(
                children: [
                  const Icon(Icons.calendar_today,
                      size: 16, color: AppColors.gray600),
                  const SizedBox(width: 4),
                  Text(
                    formattedDate,
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),

              /// Description
              Text(
                article.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14.5,
                      height: 1.6,
                    ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
