import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/components/main/logo.dart';
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
            const DrawerHeader(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Logo(
                  width: 60,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text(
                S.of(context).home,
              ),
              onTap: () {
                context.pop();
                context.goNamed(AppRoutes.home.name);
              },
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: Text(
                S.of(context).search,
              ),
              onTap: () {
                context.pop();
                context.pushNamed(AppRoutes.search.name);
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: Text(S.of(context).category),
              onTap: () {
                context.pop();
                context.pushNamed(AppRoutes.category.name);
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: Text(S.of(context).type),
              onTap: () {
                context.pop();
                context.pushNamed(AppRoutes.types.name);
              },
            ),
            ListTile(
              leading: const Icon(Icons.tag),
              title: Text(S.of(context).tag),
              onTap: () {
                context.pop();
                context.pushNamed(AppRoutes.tags.name);
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
