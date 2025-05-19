import 'package:flutter/material.dart';

import '../../../core/themes/app_colors.dart';

class ArticleDetailWidget extends StatelessWidget {
  const ArticleDetailWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.iconColor = AppColors.primary200,
    this.textColor = AppColors.gray400,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color iconColor;
  final Color textColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: iconColor),
        const SizedBox(width: 6),
        Text(
          '$label : ',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap != null
            ? TextButton(
                onPressed: onTap,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  value,
                  style: TextStyle(color: textColor),
                ),
              )
            : Text(
                value,
                style: TextStyle(color: textColor),
              ),
      ],
    );
  }
}
