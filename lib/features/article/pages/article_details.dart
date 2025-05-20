import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/features/category/models/category_model.dart';

import '../../../components/errors/error_indicator.dart';
import '../../../components/images/cached_image.dart';
import '../../../components/loading/loading_widget.dart';
import '../../../core/extensions/extensions.dart';
import '../../../core/locale/generated/l10n.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/themes/app_colors.dart';
import '../../tag/models/tag_model.dart';
import '../../type/models/type_model.dart';
import '../providers/article_provider.dart';
import '../providers/article_scroll_provider.dart';
import '../widgets/article_detail_widget.dart';
import '../widgets/tag_chip_widget.dart';

class ArticleDetailsScreen extends ConsumerWidget {
  ArticleDetailsScreen({super.key, required this.articleId});
  final int articleId;

  final List<Tag> tagList = [
    Tag(id: 1, name: 'رياضيات'),
    Tag(id: 2, name: 'تعليم'),
    Tag(id: 3, name: 'بيئة')
  ];
  final type = TypeModel(
    id: 1,
    name: 'مقال',
  );
  final category = Category(id: 1, name: 'الصحة النفسية', status: 'active');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = ref.watch(scrollControllerProvider);
    final scrollRatio = ref.watch(scrollRatioProvider);
    final articleAsync = ref.watch(articleDetailsProvider(articleId));

    final maxHeight = context.height * 0.3;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(maxScrollHeightProvider.notifier).state =
          maxHeight - kToolbarHeight;
    });

    return Scaffold(
      body: articleAsync.when(
        data: (article) => CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: maxHeight,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
                centerTitle: true,
                title: Text(
                  article.title,
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: Color.lerp(
                      AppColors.white,
                      context.textTheme.titleMedium?.color ?? AppColors.gray900,
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
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate.fixed([
                  const SizedBox(height: 10),
                  ArticleDetailWidget(
                    icon: Icons.person,
                    label: S.of(context).author,
                    value: article.user?.name ?? 'مجهول',
                  ),
                  const SizedBox(height: 20),
                  ArticleDetailWidget(
                    icon: Icons.calendar_today,
                    label: S.of(context).publishDate,
                    value: _formatDate(article.createdAt),
                  ),
                  const SizedBox(height: 20),
                  ArticleDetailWidget(
                    icon: Icons.category,
                    label: S.of(context).category,
                    value: article.category?.name ?? category.name,
                    onTap: () {
                      context.pushNamed(
                        AppRoutes.categoryDetails.name,
                        queryParameters: {
                          'categoryId':
                              // article.category?.id.toString()
                              category.id.toString(),
                          'categoryName':
                              // article.category?.name
                              category.name,
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ArticleDetailWidget(
                    icon: Icons.list,
                    label: S.of(context).type,
                    value: article.type?.name ?? type.name,
                    onTap: () {
                      context.pushNamed(
                        AppRoutes.typeDetails.name,
                        queryParameters: {
                          'typeId':
                              // article.type?.id.toString(),
                              type.id.toString(),
                          'typeName':
                              // article.type?.name,
                              type.name,
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 22),
                  Text(
                    article.content,
                    style: context.textTheme.bodyMedium?.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  HtmlWidget(article.promptContent),
                  const SizedBox(height: 20),
                  TagChipWidget(tags: article.tags ?? tagList),
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

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.year}/${date.month}/${date.day}';
  }
}
