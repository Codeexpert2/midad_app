import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeNotifier extends ChangeNotifier {
  bool isExpanded = false;

  YoutubePlayerController? videoController;

  void toggleDropDown() {
    isExpanded = !isExpanded;
    notifyListeners();
  }

  void initVideoPLayer(String videoId) {
    videoController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        enableCaption: true,
        isLive: false,
      ),
    );
  }

  void disposeVideoController() {
    videoController?.dispose();
  }
}

final homeProvider = ChangeNotifierProvider((ref) => HomeNotifier());

final youtubePlayerProvider =
    ChangeNotifierProvider.autoDispose<HomeNotifier>((ref) {
  final notifier = HomeNotifier();
  ref.onDispose(notifier.disposeVideoController);
  return notifier;
});
