import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final articleProvider =
    ChangeNotifierProvider.autoDispose<ArticlesNotifier>((ref) {
  return ArticlesNotifier(ref);
});

class ArticlesNotifier extends ChangeNotifier {
  ArticlesNotifier(this.ref);
  final Ref ref;

  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
