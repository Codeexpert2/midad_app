import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/core/extensions/extensions.dart';

import '../../../components/errors/error_indicator.dart';
import '../../../components/images/cached_image.dart';
import '../../../components/loading/loading_widget.dart';
import '../../../components/main/main_appbar.dart';
import '../../../core/locale/generated/l10n.dart';
import '../../article/providers/article_provider.dart';
import '../../article/widgets/tag_chip_widget.dart';

class NewsDetailsScreen extends ConsumerWidget {
  const NewsDetailsScreen({super.key, required this.articleId});
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
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: CachedImage(imageUrl: article.image),
                ),
                const SizedBox(height: 35.0),

                // AuthorWidget(
                //   name: article.user?.name,
                //   imageUrl: article.user?.image ?? '',
                // ),

                // const SizedBox(height: 25.0),

                /// Description
                Text(
                  article.content,
                  style: context.textTheme.bodyMedium?.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 20),

                /// Tags
                Text(
                  '${S.of(context).tags} : ',
                  style: context.textTheme.bodyMedium?.copyWith(fontSize: 17),
                ),
                const SizedBox(height: 8),
                TagChipWidget(tags: article.tags ?? []),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        loading: LoadingWidget.new,
        error: (err, stack) => ErrorIndicator(
          errorMessage: S.of(context).error,
          onRetry: () {
            ref.invalidate(articleDetailsProvider(articleId));
          },
        ),
      ),
    );
  }
}
