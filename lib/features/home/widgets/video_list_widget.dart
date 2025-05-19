import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/errors/error_message.dart';
import '../../../components/loading/loading_widget.dart';
import '../../../core/locale/generated/l10n.dart';
import '../../../core/pagination/models/pagination_state.dart';
import '../../../core/pagination/models/pagination_status.dart';
import '../../../core/pagination/notifiers/paginated_list_notifier.dart';
import '../../video_gallery/models/video_model.dart';
import '../../video_gallery/widgets/video_item_widget.dart';

class VideoListWidget extends ConsumerWidget {
  const VideoListWidget({
    super.key,
    required this.provider,
  });

  final AutoDisposeStateNotifierProvider<PaginatedListNotifier<Video>,
      PaginationState<Video>> provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);

    // Show loading state for initial load
    if (state.status == PaginationStatus.initial) {
      return const LoadingWidget();
    }

    // Show empty state if no items and not loading
    if (state.status == PaginationStatus.loading && state.items.isEmpty) {
      return const LoadingWidget();
    }

    // Show error state if error occurred and no items are loaded
    if (state.status == PaginationStatus.error && state.items.isEmpty) {
      return Center(child: ErrorMessage(message: S.of(context).error));
    }

    // Show empty state if no items and not loading
    if (state.items.isEmpty) {
      return Center(child: Text(S.of(context).noVideoAvailable));
    }

    return GridView.builder(
      itemCount: state.items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 16 / 15,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        final video = state.items[index];

        return VideoItemWidget(video: video);
      },
    );
  }
}
