import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/components/loading/loading_widget.dart';
import 'package:midad/components/main/main_appbar.dart';
import 'package:midad/components/main/main_drawer.dart';
import 'package:midad/core/locale/generated/l10n.dart';
import 'package:midad/core/router/app_routes.dart';

import '../../../components/images/image_slider.dart';
import '../constant/news_list.dart';
import '../constant/partners_list.dart';
import '../constant/slider_images.dart';
import '../constant/video_list.dart';
import '../providers/home_article_provider.dart';
import '../widgets/article_list_widget.dart';
import '../widgets/latest_news_widget.dart';
import '../widgets/partner_list_widget.dart';
import '../widgets/section_header_widget.dart';
import '../widgets/video_list_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeArticles = ref.watch(homeArticlesNotifierProvider);

    return Scaffold(
      appBar: MainAppBar(
        title: S.of(context).home,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.pushNamed(
              AppRoutes.settings.name,
            ),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              ImageSlider(imageUrls: sliderImages),
              const SizedBox(height: 24),
              SectionHeader(
                title: S.of(context).articles,
                isShowMore: true,
                buttonText: S.of(context).showMoreArticle,
                onButtonPressed: () {
                  context.pushNamed(
                    AppRoutes.articles.name,
                  );
                },
              ),
              const SizedBox(height: 12),
              homeArticles.when(
                data: (articles) => ArticleListWidget(
                  articleList: articles,
                ),
                loading: LoadingWidget.new,
                error: (err, stack) => const Center(child: Text('Error')),
              ),
              const SizedBox(height: 14),
              SectionHeader(
                title: S.of(context).latestNews,
                isShowMore: true,
                buttonText: S.of(context).showMore,
                onButtonPressed: () {
                  context.pushNamed(
                    AppRoutes.latestNews.name,
                  );
                },
              ),
              const SizedBox(height: 12),
              LatestNewsWidget(newsList: newsList),
              const SizedBox(height: 14),
              SectionHeader(
                title: S.of(context).midadPartners,
                isShowMore: false,
              ),
              const SizedBox(height: 12),
              PartnerListWidget(logos: partnerLogos),
              const SizedBox(height: 14),
              SectionHeader(
                title: S.of(context).videoGallery,
                isShowMore: true,
                buttonText: S.of(context).showMore,
                onButtonPressed: () {
                  context.pushNamed(
                    AppRoutes.videoGallery.name,
                  );
                },
              ),
              const SizedBox(height: 12),
              VideoListWidget(videos: videoList),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
      // body: ListView.builder(
      //   itemCount: 5,
      //   itemBuilder: (context, index) {
      //     return Padding(
      //       padding: const EdgeInsets.all(16),
      //       child: Row(
      //         children: [
      // ShimmerWidget(
      //             child: Container(
      //               width: 50,
      //               height: 50,
      //               decoration: BoxDecoration(
      //                 color: Colors.grey[300],
      //                 borderRadius: BorderRadius.circular(8),
      //               ),
      //             ),
      //           ),
      //           const SizedBox(width: 16),
      //           Expanded(
      //             child: ShimmerWidget(
      //               child: Container(
      //                 width: double.infinity,
      //                 height: 20,
      //                 color: Colors.grey[300],
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
