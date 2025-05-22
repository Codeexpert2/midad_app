import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final scrollRatioProvider = StateProvider.autoDispose<double>((ref) => 0.0);

final maxScrollHeightProvider =
    StateProvider.autoDispose<double>((ref) => 310.0);

final scrollControllerProvider = Provider.autoDispose<ScrollController>((ref) {
  final controller = ScrollController();

  controller.addListener(() {
    final offset = controller.offset;
    final maxHeight = ref.read(maxScrollHeightProvider);
    final ratio = (offset / maxHeight).clamp(0.0, 1.0);
    ref.read(scrollRatioProvider.notifier).state = ratio;
  });

  ref.onDispose(controller.dispose);
  return controller;
});
