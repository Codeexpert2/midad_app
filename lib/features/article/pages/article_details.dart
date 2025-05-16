import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/images/cached_image.dart';
import '../../../components/main/main_appbar.dart';
import '../../../core/extensions/extensions.dart';
import '../providers/article_details_provider.dart';

class ArticleDetailsScreen extends ConsumerWidget {
  const ArticleDetailsScreen({super.key, required this.articleId});
  final int articleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articleAsync = ref.watch(articleDetailsProvider(articleId));

    return Scaffold(
      appBar: const MainAppBar(title: ''),
      body: articleAsync.when(
        data: (article) => SingleChildScrollView(
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
                  child: CachedImage(
                    imageUrl: article.image,
                    height: context.height * 0.28,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 25.0),

                /// Description
                Text(
                  article.content,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 15,
                        height: 1.6,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  article.promptContent,
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
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => const Center(child: Text('Error')),
      ),
    );
  }
}
