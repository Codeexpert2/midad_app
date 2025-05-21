import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.buttonText,
    required this.svgIconPath,
    this.onSeeAllPressed, // جعلها اختيارية
  });

  final String title;
  final String buttonText;
  final String svgIconPath;
  final VoidCallback? onSeeAllPressed; // ملاحظة هنا

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
          ),
          TextButton(
            onPressed: onSeeAllPressed,
            child: Row(
              children: [
                Text(
                  buttonText,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(width: 4),
                Transform(
                  alignment: Alignment.center,
                  transform: Directionality.of(context) == TextDirection.ltr
                      ? Matrix4.rotationY(3.1416)
                      : Matrix4.identity(),
                  child: SvgPicture.asset(
                    svgIconPath,
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
