import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/components/main/main_appbar.dart';
import 'package:midad/components/main/main_drawer.dart';
import 'package:midad/core/locale/generated/l10n.dart';
import 'package:midad/core/router/app_routes.dart';
import 'package:midad/core/themes/app_colors.dart';
import 'package:midad/features/home/widgets/home_page_card.dart';

import '../../../components/images/image_slider.dart';
import '../constant/partners_list.dart';
import '../constant/slider_images.dart';
import '../widgets/partner_list_widget.dart';
import '../widgets/section_header_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: MainAppBar(
        title: S.of(context).home,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.pushNamed(AppRoutes.settings.name),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              ImageSlider(imageUrls: sliderImages),
              const SizedBox(height: 24),
              HomePageCard(
                title: S.of(context).articles,
                subtitle: 'استكشف مقالات متنوعة ومفيدة في مختلف المجالات',
                icon: Icons.article_outlined,
                color: isDark ? Colors.deepOrangeAccent : AppColors.primary500,
                routeName: AppRoutes.articles.name,
              ),
              HomePageCard(
                title: S.of(context).latestNews,
                subtitle: 'اطلع على آخر الأخبار والمستجدات من مصادر موثوقة',
                icon: Icons.newspaper,
                color: isDark ? Colors.deepOrange : AppColors.secondary700,
                routeName: AppRoutes.latestNews.name,
              ),
              HomePageCard(
                title: S.of(context).videoGallery,
                subtitle: 'شاهد مجموعة مميزة من المقاطع التعليمية والترفيهية',
                icon: Icons.video_library_outlined,
                color: isDark ? Colors.orangeAccent : Colors.deepPurpleAccent,
                routeName: AppRoutes.videoGallery.name,
              ),
              const SizedBox(height: 10),
              SectionHeader(
                title: S.of(context).midadPartners,
                isShowMore: false,
              ),
              const SizedBox(height: 12),
              PartnerListWidget(logos: partnerLogos),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
