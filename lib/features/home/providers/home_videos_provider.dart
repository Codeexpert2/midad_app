import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../configs/app_configs.dart';
import '../../../core/pagination/models/pagination_state.dart';
import '../../../core/pagination/notifiers/paginated_list_notifier.dart';
import '../../video_gallery/models/video_model.dart';
import '../../video_gallery/providers/video_provider.dart';

final homeVideoProvider = StateNotifierProvider.autoDispose<
    PaginatedListNotifier<Video>, PaginationState<Video>>(
  (ref) {
    final videoService = ref.read(videoServiceProvider);
    return PaginatedListNotifier<Video>(
      fetchData: (int page) async {
        final res = await videoService.getVideos(
          page: page,
        );
        return res.data ?? [];
      },
      itemsPerPage: AppConfigs.perPage,
    );
  },
);
