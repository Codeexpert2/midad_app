import 'package:flutter/material.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/themes/app_colors.dart';
import '../../tag/models/tag_model.dart';

class TagChipWidget extends StatelessWidget {
  const TagChipWidget({super.key, required this.tags});
  final List<Tag> tags;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: tags.map(
          (tag) {
            return ActionChip(
              label: Text(
                tag.name,
                style: const TextStyle(color: AppColors.gray900),
              ),
              backgroundColor: AppColors.primary50,
              shape: const StadiumBorder(
                side: BorderSide(color: AppColors.primaryColor),
              ),
              onPressed: () {
                context.pushNamed(
                  AppRoutes.tagDetails.name,
                  queryParameters: {
                    'tagId': tag.id.toString(),
                    'tagName': tag.name,
                  },
                );
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
