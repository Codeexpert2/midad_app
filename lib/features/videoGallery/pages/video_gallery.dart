import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/main/main_appbar.dart';
import '../../../core/locale/generated/l10n.dart';
import '../../../core/pagination/paginated_list_widget.dart';
import '../models/video_model.dart';
import '../providers/video_list_notifier.dart';
import '../providers/video_notifier.dart';
import '../widgets/video_item_widget.dart';

class VideoGalleryScreen extends ConsumerWidget {
  const VideoGalleryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: MainAppBar(
        title: S.of(context).videoGallery,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PaginatedListWidget<Video>(
          provider: videoListProvider,
          itemBuilder: (context, video) => VideoItemWidget(video: video),
          loadTriggerThreshold: 0.8,
          enablePullToRefresh: true,
          padding: const EdgeInsets.all(16.0),
          separatorBuilder: (context, index) => const SizedBox(height: 22),
          emptyWidget: Center(child: Text(S.of(context).noVideoAvailable)),
          noMoreDataWidget: Center(child: Text(S.of(context).noMoreVideo)),
          scrollController: ref.watch(videoProvider).scrollController,
        ),
      ),
    );
  }
}
