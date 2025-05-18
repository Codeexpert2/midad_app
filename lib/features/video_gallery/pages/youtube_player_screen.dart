import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:midad/core/extensions/extensions.dart';
import 'package:midad/core/locale/generated/l10n.dart';

import '../../../components/main/main_appbar.dart';
import '../../home/providers/home_provider.dart';

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
          appBar: MainAppBar(
            title: S.of(context).videoPlayer,
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
