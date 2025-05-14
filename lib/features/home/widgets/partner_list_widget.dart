import 'package:flutter/material.dart';

import 'package:midad/core/extensions/extensions.dart';

class PartnerListWidget extends StatelessWidget {
  const PartnerListWidget({super.key, required this.logos});
  final List<String> logos;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.09,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: logos.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              logos[index],
              width: 70,
              height: context.height * 0.07,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
