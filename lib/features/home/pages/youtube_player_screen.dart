import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:midad/core/extensions/extensions.dart';

import '../../../locale/generated/l10n.dart';
import '../providers/home_provider.dart';

class YoutubePlayerScreen extends ConsumerWidget {
  const YoutubePlayerScreen({super.key, required this.videoId});
  final String videoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final youtubeNotifier = ref.watch(youtubePlayerProvider);

    if (youtubeNotifier.videoController == null ||
        !youtubeNotifier.videoController!.value.isReady) {
      youtubeNotifier.initVideoPLayer(videoId);
    }

    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: youtubeNotifier.videoController!),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).videoPlayer),
            elevation: 2,
          ),
          body: OrientationBuilder(
            builder: (context, orientation) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: context.isLandscape ? context.height : 200,
                    child: player,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
