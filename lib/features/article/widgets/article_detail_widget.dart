import 'package:flutter/material.dart';

import '../../../core/themes/app_colors.dart';

class ArticleDetailWidget extends StatelessWidget {
  const ArticleDetailWidget({
    super.key,
    required this.icon,
    required this.value,
    this.iconColor = AppColors.primary200,
    this.textColor = AppColors.gray400,
    this.onTap,
  });

  final IconData icon;
  final String value;
  final Color iconColor;
  final Color textColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 90,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Icon(icon, size: 28, color: iconColor),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                value,
                style: TextStyle(color: textColor),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
