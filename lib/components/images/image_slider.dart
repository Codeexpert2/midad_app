import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:midad/components/images/cached_image.dart';
import 'package:midad/core/extensions/extensions.dart';

import '../../core/themes/app_colors.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key, required this.imageUrls});
  final List<String> imageUrls;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: context.width * 0.5,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
            },
          ),
          items: widget.imageUrls.map((url) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedImage(imageUrl: url, width: double.infinity),
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imageUrls.asMap().entries.map((entry) {
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == entry.key
                    ? AppColors.primaryColor
                    : AppColors.gray400,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
