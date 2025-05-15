import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/core/extensions/extensions.dart';
import 'package:midad/core/pagination/paginated_list_widget.dart';

import '../../../components/main/main_appbar.dart';
import '../../../core/locale/generated/l10n.dart';
import '../models/news_model.dart';
import '../providers/latest_news_list_notifier.dart';
import '../providers/latest_news_notifier.dart';
import '../widgets/latest_news_item_widget.dart';

class LatestNewsScreen extends ConsumerWidget {
  const LatestNewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: MainAppBar(
        title: S.of(context).latestNews,
      ),
      body: PaginatedListWidget<News>(
        provider: newsListProvider,
        itemBuilder: (context, news) => LatestNewsItemWidget(
          news: news,
          width: context.width * 0.9,
          height: context.height * 0.28,
          imageHeight: context.height * 0.28,
        ),
        loadTriggerThreshold: 0.8,
        enablePullToRefresh: true,
        padding: const EdgeInsets.all(16.0),
        separatorBuilder: (context, index) => const SizedBox(height: 18),
        emptyWidget: Center(child: Text(S.of(context).noNewsAvailable)),
        noMoreDataWidget: Center(child: Text(S.of(context).noMoreNews)),
        scrollController: ref.watch(latestNewsProvider).scrollController,
      ),
    );
  }
}
