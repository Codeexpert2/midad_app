import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/core/router/app_routes.dart';

import '../../../core/locale/generated/l10n.dart';
import '../constant/content_list.dart';
import '../providers/home_provider.dart';

class OrganizationInterestMenu extends ConsumerWidget {
  const OrganizationInterestMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentProvider = ref.read(homeProvider);
    return ExpansionTile(
      title: Text(
        S.of(context).organizationInterests,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      initiallyExpanded: contentProvider.isExpanded,
      onExpansionChanged: (expanded) {
        contentProvider.isExpanded = expanded;
      },
      children: organizationInterestsList.map((article) {
        return ListTile(
          title: Text(article.title),
          onTap: () {
            contentProvider.isExpanded = false;
            Navigator.pop(context);
            context.pushNamed(
              AppRoutes.articleDetails.name,
              pathParameters: {'id': article.id.toString()},
            );
          },
        );
      }).toList(),
    );
  }
}
