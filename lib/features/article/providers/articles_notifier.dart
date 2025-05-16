import 'dart:async';

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'article_list_notifier.dart';

final articleProvider =
    ChangeNotifierProvider.autoDispose<ArticlesNotifier>((ref) {
  return ArticlesNotifier(ref);
});

class ArticlesNotifier extends ChangeNotifier {
  ArticlesNotifier(this.ref) {
    _init();
  }
  final Ref ref;

  final scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  Future<void> _init() async {
    searchController.addListener(onSearchChanged);

    notifyListeners();
  }

  void onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 500),
      () {
        final query = searchController.text.trim();
        ref.read(articleParamsProvider.notifier).state =
            ref.read(articleParamsProvider).copyWith(query: query, page: 1);
        ref.read(articleListProvider.notifier).refresh();
      },
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }
}
