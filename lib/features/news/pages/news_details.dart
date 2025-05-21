import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/images/cached_image.dart';
import '../../../components/main/main_appbar.dart';
import '../../../core/extensions/extensions.dart';
import '../../../core/themes/app_colors.dart';
import '../models/news_model.dart';

class NewsDetailsScreen extends ConsumerWidget {
  const NewsDetailsScreen({super.key, required this.news});
  final News news;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  news.title,
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
                child: CachedImage(imageUrl: news.imageUrl),
              ),
              const SizedBox(height: 25.0),

              /// instructor
              if (!news.instructor.isEmptyOrNull)
                Row(
                  children: [
                    const Icon(Icons.person,
                        size: 16, color: AppColors.gray600),
                    const SizedBox(width: 4),
                    Text(
                      news.instructor!,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              const SizedBox(height: 8),

              /// Date
              if (!news.date.isEmptyOrNull)
                Row(
                  children: [
                    const Icon(Icons.calendar_today,
                        size: 16, color: AppColors.gray600),
                    const SizedBox(width: 4),
                    Text(
                      news.date!,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              const SizedBox(height: 8),

              /// Time
              if (!news.time.isEmptyOrNull)
                Row(
                  children: [
                    const Icon(Icons.schedule,
                        size: 16, color: AppColors.gray600),
                    const SizedBox(width: 4),
                    Text(
                      news.time!,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              const SizedBox(height: 8),

              if (!news.location.isEmptyOrNull)
                Row(
                  children: [
                    const Icon(Icons.location_on,
                        size: 16, color: AppColors.gray600),
                    const SizedBox(width: 4),
                    Text(
                      news.location!,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              const SizedBox(height: 15.0),

              /// Description
              Text(
                news.description,
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
