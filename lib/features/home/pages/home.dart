import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/components/main/main_appbar.dart';
import 'package:midad/components/main/main_drawer.dart';
import 'package:midad/core/locale/generated/l10n.dart';
import 'package:midad/features/home/constant/article_list.dart';

import '../../../components/images/image_slider.dart';
import '../constant/news_list.dart';
import '../constant/partners_list.dart';
import '../constant/slider_images.dart';
import '../constant/video_list.dart';
import '../widgets/article_list_widget.dart';
import '../widgets/content_menu.dart';
import '../widgets/latest_news_widget.dart';
import '../widgets/partner_list_widget.dart';
import '../widgets/video_list_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: MainAppBar(
        title: S.of(context).homeScreen,
      ),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ContentMenu(),
              const SizedBox(height: 12),
              ImageSlider(imageUrls: sliderImages),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.of(context).articles,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 12),
              ArticleListWidget(articleList: articleList),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.of(context).latestNews,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 12),
              LatestNewsWidget(newsList: newsList),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.of(context).midadPartners,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 12),
              PartnerListWidget(logos: partnerLogos),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.of(context).videoGallery,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
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
