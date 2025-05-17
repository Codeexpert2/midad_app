import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final videoProvider = ChangeNotifierProvider.autoDispose<VideoNotifier>((ref) {
  return VideoNotifier(ref);
});

class VideoNotifier extends ChangeNotifier {
  VideoNotifier(this.ref);
  final Ref ref;

  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
