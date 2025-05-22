import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/errors/error_indicator.dart';
import '../../../components/images/cached_image.dart';
import '../../../components/loading/loading_widget.dart';
import '../../../core/extensions/extensions.dart';
import '../../../core/helpers/date_helper.dart';
import '../../../core/locale/generated/l10n.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/themes/app_colors.dart';
import '../providers/article_provider.dart';
import '../providers/article_scroll_provider.dart';
import '../widgets/article_detail_widget.dart';
import '../widgets/author_widget.dart';
import '../widgets/tag_chip_widget.dart';

class ArticleDetailsScreen extends HookConsumerWidget {
  const ArticleDetailsScreen({super.key, required this.articleId});
  final int articleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final maxHeight = context.height * 0.3;
    final maxScrollHeight = maxHeight - kToolbarHeight;

    useEffect(() {
      void listener() {
        final offset = scrollController.offset;
        final newRatio = (offset / maxScrollHeight).clamp(0.0, 1.0);

        final notifier = ref.read(scrollRatioProvider.notifier);
        final prevRatio = ref.read(scrollRatioProvider);

        if (newRatio == 1.0 && prevRatio != 1.0) {
          notifier.state = 1.0;
        } else if (newRatio < 1.0 && prevRatio != 0.0) {
          notifier.state = 0.0;
        }
      }

      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController]);

    final articleAsync = ref.watch(articleDetailsProvider(articleId));

    return Scaffold(
      body: articleAsync.when(
        data: (article) => CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: maxHeight,
              leading: Consumer(builder: (context, ref, _) {
                final scrollRatio = ref.watch(scrollRatioProvider);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Color.lerp(
                      AppColors.white.withOpacity(0.8),
                      Colors.transparent,
                      scrollRatio,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.gray900,
                      ),
                      onPressed: () => context.pop(),
                    ),
                  ),
                );
              }),
              flexibleSpace: Consumer(builder: (context, ref, _) {
                final scrollRatio = ref.watch(scrollRatioProvider);
                return FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
                  centerTitle: true,
                  title: Text(
                    article.title,
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Color.lerp(
                        AppColors.white,
                        context.textTheme.titleMedium?.color ??
                            AppColors.gray900,
                        scrollRatio,
                      ),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  collapseMode: CollapseMode.parallax,
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedImage(imageUrl: article.image),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.transparent, AppColors.gray800],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate.fixed([
                  const SizedBox(height: 10),
                  AuthorWidget(
                    name: article.user?.name,
                    imageUrl: article.user?.image ?? '',
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      ArticleDetailWidget(
                        icon: Icons.calendar_today_outlined,
                        value: DateHelper.timeAgo(article.createdAt!),
                      ),
                      const Spacer(),
                      ArticleDetailWidget(
                        icon: Icons.category_outlined,
                        value: article.category?.name ?? '',
                        onTap: () {
                          context.pushNamed(
                            AppRoutes.categoryDetails.name,
                            queryParameters: {
                              'categoryId': article.category?.id.toString(),
                              'categoryName': article.category?.name
                            },
                          );
                        },
                      ),
                      const Spacer(),
                      ArticleDetailWidget(
                        icon: Icons.list_outlined,
                        value: article.type?.name ?? '',
                        onTap: () {
                          context.pushNamed(
                            AppRoutes.typeDetails.name,
                            queryParameters: {
                              'typeId': article.type?.id.toString(),
                              'typeName': article.type?.name,
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    article.content,
                    style: context.textTheme.bodyMedium?.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  HtmlWidget(article.promptContent),
                  const SizedBox(height: 22),
                  Text(
                    '${S.of(context).tags} : ',
                    style: context.textTheme.bodyMedium?.copyWith(fontSize: 17),
                  ),
                  const SizedBox(height: 8),
                  TagChipWidget(tags: article.tags ?? []),
                  const SizedBox(height: 20),
                ]),
              ),
            ),
          ],
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
