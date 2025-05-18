import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/client/client.dart';
import '../../../core/pagination/models/pagination_state.dart';
import '../../../core/pagination/notifiers/paginated_list_notifier.dart';
import '../models/video_model.dart';
import '../services/video_service.dart';

final videoServiceProvider = Provider<VideoService>((ref) {
  final apiClient = ref.watch(networkServiceProvider);
  return VideoService(apiClient);
});

final videoSearchProvider = StateProvider<String?>(
  (ref) => null,
);

final videoProvider = StateNotifierProvider.autoDispose<
    PaginatedListNotifier<Video>, PaginationState<Video>>(
  (ref) {
    final videoService = ref.watch(videoServiceProvider);
    final search = ref.watch(videoSearchProvider);
    return PaginatedListNotifier<Video>(
      fetchData: (int page) async {
        final res = await videoService.getVideos(
          search: search,
          page: page,
        );
        return res.data ?? [];
      },
    );
  },
);
