import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/core/locale/generated/l10n.dart';

import '../../../core/themes/app_colors.dart';
import '../constant/content_list.dart';
import '../providers/home_provider.dart';

class ContentMenu extends ConsumerWidget {
  const ContentMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentProvider = ref.read(homeProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: contentProvider.toggleDropDown,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.gray400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(S.of(context).select,
                      style: const TextStyle(fontSize: 16)),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          if (ref.watch(homeProvider).isExpanded)
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.gray400),
                borderRadius: BorderRadius.circular(8),
              ),
              constraints: const BoxConstraints(maxHeight: 500),
              child: ListView(
                shrinkWrap: true,
                children: organizationContentList(context).map((content) {
                  return ExpansionTile(
                    title: Text(content.title),
                    children: content.subItems.map((subItem) {
                      return ListTile(
                          title: Text(subItem.title),
                          onTap: () {
                            // context.pushNamed(
                            //   AppRoutes.articleDetails.name,
                            //   extra: subItem.articleId.toString(),
                            // );
                            contentProvider.collapseDropDown;
                          });
                    }).toList(),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
