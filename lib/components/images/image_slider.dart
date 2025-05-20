import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:midad/components/images/cached_image.dart';
import 'package:midad/core/extensions/extensions.dart';

import '../../core/router/app_routes.dart';
import '../../core/themes/app_colors.dart';
import '../../features/home/models/slide_model.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key, required this.slides});
  final List<Slide> slides;

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
          items: widget.slides.map((slide) {
            return GestureDetector(
              onTap: () {
                context.pushNamed(
                  AppRoutes.articleDetails.name,
                  pathParameters: {'id': slide.id.toString()},
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CachedImage(imageUrl: slide.image, width: double.infinity),
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.6),
                          ],
                        ),
                      ),
                      child: Text(
                        slide.title,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.slides.asMap().entries.map((entry) {
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
