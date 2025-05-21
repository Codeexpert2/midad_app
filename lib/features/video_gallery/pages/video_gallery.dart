import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/main/debounced_search_app_bar.dart';
import '../../../core/locale/generated/l10n.dart';
import '../../../core/pagination/paginated_list_widget.dart';
import '../models/video_model.dart';
import '../providers/video_provider.dart';
import '../widgets/video_item_widget.dart';

class VideoGalleryScreen extends ConsumerWidget {
  const VideoGalleryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: DebouncedSearchAppBar(
        title: S.of(context).videoGallery,
        onDebounceChange: (value) {
          ref.read(videoSearchProvider.notifier).state = value;
          ref.read(videoProvider.notifier).refresh();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PaginatedListWidget<Video>(
          key: Key(ref.watch(videoSearchProvider) ?? ''),
          provider: videoProvider,
          itemBuilder: (context, video) => VideoItemWidget(video: video),
          padding: const EdgeInsets.all(16.0),
          separatorBuilder: (context, index) => const SizedBox(height: 22),
          emptyWidget: Center(child: Text(S.of(context).noVideoAvailable)),
          noMoreDataWidget: Center(child: Text(S.of(context).noMoreVideo)),
        ),
      ),
    );
  }
}
