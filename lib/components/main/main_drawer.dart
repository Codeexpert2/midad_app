import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/core/router/app_routes.dart';

import '../../core/locale/generated/l10n.dart';
import '../../features/home/widgets/children_menu.dart';
import '../../features/home/widgets/organization_interest_menu.dart';
import '../../features/home/widgets/youth_menu.dart';

import 'app_divider.dart';

class MainDrawer extends ConsumerWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      bottom: false,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text(
                S.of(context).home,
              ),
              onTap: () {
                Navigator.pop(context);
                context.goNamed(AppRoutes.home.name);
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: Text(S.of(context).category),
              onTap: () {
                Navigator.pop(context);
                context.pushNamed(AppRoutes.category.name);
              },
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: Text(
                S.of(context).search,
              ),
              onTap: () {
                Navigator.pop(context);
                context.pushNamed(AppRoutes.search.name);
              },
            ),
            const AppDivider(),
            const YouthMenu(),
            const ChildrenMenu(),
            const OrganizationInterestMenu(),
            const AppDivider(),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: Text(
                S.of(context).help,
              ),
              onTap: () {
                Navigator.pop(context);
                context.pushNamed(AppRoutes.help.name);
              },
            ),
            const AppDivider(),
            // ListTile(
            //   leading: Icon(
            //     Icons.exit_to_app,
            //     color: Theme.of(context).colorScheme.error,
            //   ),
            //   title: Text(
            //     S.of(context).logout,
            //     style: TextStyle(
            //       color: Theme.of(context).colorScheme.error,
            //     ),
            //   ),
            //   onTap: () {
            //     // confirm dialog
            //     Navigator.pop(context);
            //     ref.read(authNotifierProvider.notifier).logout();
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
