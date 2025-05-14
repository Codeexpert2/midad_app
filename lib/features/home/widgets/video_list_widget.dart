import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../core/router/app_routes.dart';

class VideoListWidget extends StatelessWidget {
  const VideoListWidget({
    super.key,
    required this.videos,
  });

  final List<Map<String, String>> videos;

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
        final videoId = videos[index]['id']!;
        final title = videos[index]['title']!;

        return InkWell(
          onTap: () {
            context.pushNamed(
              AppRoutes.youtubePlayer.name,
              queryParameters: {'id': videoId},
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  YoutubePlayer.getThumbnail(videoId: videoId),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
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
      },
    );
  }
}
