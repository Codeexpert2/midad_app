import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/components/main/main_appbar.dart';
import 'package:midad/components/main/main_drawer.dart';
import 'package:midad/core/locale/generated/l10n.dart';
import 'package:midad/core/router/app_routes.dart';
import 'package:midad/core/themes/app_colors.dart';
import 'package:midad/features/home/widgets/home_page_card.dart';
import 'package:midad/features/home/widgets/section_header_widget.dart';
import 'package:midad/features/projects/pages/project_list.dart';

import '../widgets/partner_list_widget.dart';
import '../widgets/slides_section.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: MainAppBar(
        title: '',
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
              const SlidesSection(),
              const SizedBox(height: 24),
              SectionHeader(title: S.of(context).projects),
              const ProjectList(),
              const SizedBox(height: 15),
              SectionHeader(title: S.of(context).midadPartners),
              const SizedBox(height: 12),
              const PartnerListWidget(),
              const SizedBox(height: 10),
              HomePageCard(
                title: S.of(context).blog,
                subtitle: S.of(context).browseTheBlogAndEducationalArticles,
                icon: Icons.article_outlined,
                color: isDark
                    ? Colors.deepOrangeAccent.shade100
                    : AppColors.primary500,
                routeName: AppRoutes.articles.name,
              ),
              HomePageCard(
                title: S.of(context).latestNews,
                subtitle: S
                    .of(context)
                    .stayUpdatedWithTheLatestNewsFromReliableSources,
                icon: Icons.newspaper,
                color: isDark
                    ? Colors.tealAccent.shade200
                    : AppColors.secondary700,
                routeName: AppRoutes.latestNews.name,
              ),
              HomePageCard(
                title: S.of(context).videoGallery,
                subtitle: S
                    .of(context)
                    .watchAVarietyOfEducationalAndEntertainingVideos,
                icon: Icons.video_library_outlined,
                color: isDark
                    ? Colors.amberAccent.shade200
                    : Colors.deepPurpleAccent,
                routeName: AppRoutes.videoGallery.name,
              ),
              HomePageCard(
                title: S.of(context).journals,
                subtitle: S.of(context).easilyExploreEducationalJournals,
                icon: Icons.menu_book,
                color: isDark
                    ? Colors.lightGreenAccent.shade200
                    : Colors.orangeAccent,
                routeName: AppRoutes.journal.name,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
