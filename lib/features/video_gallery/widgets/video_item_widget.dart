import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../components/images/cached_image.dart';
import '../../../core/router/app_routes.dart';
import '../models/video_model.dart';

class VideoItemWidget extends StatelessWidget {
  const VideoItemWidget({
    super.key,
    required this.video,
  });
  final Video video;

  @override
  Widget build(BuildContext context) {
    final String videoId = YoutubePlayer.convertUrlToId(video.url) ?? '';
    
    return InkWell(
      onTap: () {
        context.pushNamed(
          AppRoutes.youtubePlayer.name,
          queryParameters: {'id': videoId },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: CachedImage(
              imageUrl: YoutubePlayer.getThumbnail(videoId: videoId),
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              video.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
