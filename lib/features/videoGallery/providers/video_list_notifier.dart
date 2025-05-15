import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/pagination/models/pagination_state.dart';
import '../../../core/pagination/notifiers/paginated_list_notifier.dart';
import '../../home/constant/video_list.dart';
import '../models/video_model.dart';

final videoListProvider = AutoDisposeStateNotifierProvider<
    VideoListNotifier, PaginationState<Video>>(
  (ref) => VideoListNotifier(),
);

class VideoListNotifier extends PaginatedListNotifier<Video> {
  VideoListNotifier() : super(fetchData: fetchPage);

  static Future<List<Video>> fetchPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));
    return videoList;
    // final VideoRequests = VideoRequests();
    // final response = await VideoRequests.getVideo(
    //   page: page,
    //   perPage: AppConfigs.perPage,
    // );
    // return response['Video'] as List<Video>;
  }
}
