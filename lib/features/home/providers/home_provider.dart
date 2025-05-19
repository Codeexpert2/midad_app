import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'home_articles_provider.dart';
import 'home_videos_provider.dart';

class HomeNotifier extends ChangeNotifier {
  HomeNotifier(this.ref);

  final Ref ref;
  bool isExpanded = false;

  YoutubePlayerController? videoController;

  void loadInitial() {
    ref.read(homeArticlesProvider.notifier).loadNextPage();
    ref.read(homeVideoProvider.notifier).loadNextPage();
  }

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

final homeProvider = ChangeNotifierProvider(HomeNotifier.new);

final youtubePlayerProvider =
    ChangeNotifierProvider.autoDispose<HomeNotifier>((ref) {
  final notifier = HomeNotifier(ref);
  ref.onDispose(notifier.disposeVideoController);
  return notifier;
});
