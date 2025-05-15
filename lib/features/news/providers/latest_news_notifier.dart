import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final latestNewsProvider =
    ChangeNotifierProvider.autoDispose<LatestNewsNotifier>((ref) {
  return LatestNewsNotifier(ref);
});

class LatestNewsNotifier extends ChangeNotifier {
  LatestNewsNotifier(this.ref);
  final Ref ref;

  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
