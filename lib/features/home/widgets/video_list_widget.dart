import 'package:flutter/material.dart';

import '../../video_gallery/models/video_model.dart';
import '../../video_gallery/widgets/video_item_widget.dart';
import '../constant/video_list.dart';

class VideoListWidget extends StatelessWidget {
  const VideoListWidget({
    super.key,
    required this.videos,
  });

  final List<Video> videos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: videos.length,
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
        final video = videoList[index];

        return VideoItemWidget(video: video);
      },
    );
  }
}
