import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/core/locale/generated/l10n.dart';
import 'package:midad/features/home/widgets/slide_shimmer.dart';

import '../../../components/errors/error_message.dart';
import '../../../components/images/image_slider.dart';
import '../providers/slide_provider.dart';

class SlidesSection extends ConsumerWidget {
  const SlidesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final slidesAsync = ref.watch(slidesProvider);

    return slidesAsync.when(
      data: (slides) => ImageSlider(slides: slides),
      loading: () => const SlideShimmer(),
      error: (e, _) =>
          Center(child: ErrorMessage(message: S.of(context).error)),
    );
  }
}
