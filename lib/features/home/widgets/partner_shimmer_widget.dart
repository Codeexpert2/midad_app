import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import 'package:midad/core/extensions/extensions.dart';

import '../../../core/themes/app_colors.dart';

class PartnerShimmerWidget extends StatelessWidget {
  const PartnerShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.15,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: 6,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Shimmer.fromColors(
                baseColor: AppColors.gray300,
                highlightColor: AppColors.gray100,
                child: const CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 40,
                ),
              ),
              const SizedBox(height: 8),
              Shimmer.fromColors(
                baseColor: AppColors.gray300,
                highlightColor: AppColors.gray100,
                child: Container(
                  width: context.width * 0.18,
                  height: 12,
                  color: AppColors.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
