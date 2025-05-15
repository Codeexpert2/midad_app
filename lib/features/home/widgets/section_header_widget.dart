import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.isShowMore,
    this.buttonText,
    this.onButtonPressed,
  });
  final String title;
  final bool isShowMore;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
          ),
          if (isShowMore)
            TextButton(
              onPressed: onButtonPressed,
              child: Text(buttonText!),
            ),
        ],
      ),
    );
  }
}
