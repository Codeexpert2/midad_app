import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import 'package:midad/core/extensions/extensions.dart';

import '../../../core/themes/app_colors.dart';

class SlideShimmer extends StatelessWidget {
  const SlideShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: AppColors.gray300,
          highlightColor: AppColors.gray100,
          child: Container(
            height: context.width * 0.5,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.gray300,
              ),
            );
          }),
        ),
      ],
    );
  }
}
