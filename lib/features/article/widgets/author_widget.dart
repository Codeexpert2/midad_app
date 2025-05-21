import 'package:flutter/material.dart';

import '../../../components/images/avatar_widget.dart';
import '../../../core/locale/generated/l10n.dart';
import '../../../core/themes/app_colors.dart';

class AuthorWidget extends StatelessWidget {
  const AuthorWidget({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  final String? name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AvatarWidget(imageUrl: imageUrl),
        const SizedBox(width: 10),
        Text(
          name?.isNotEmpty == true ? name! : S.of(context).unknown,
          style: const TextStyle(
            color: AppColors.gray400,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
