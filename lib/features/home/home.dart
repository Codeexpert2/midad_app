import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/components/main/main_appbar.dart';
import 'package:midad/components/main/main_drawer.dart';
import 'package:midad/core/client/client.dart';
import 'package:midad/core/router/app_routes.dart';
import 'package:midad/core/locale/generated/l10n.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: MainAppBar(
        title: S.of(context).homeScreen,
        // actions: [
        //   IconButton(
        //     onPressed: ref.read(authNotifierProvider.notifier).logout,
        //     icon: const Icon(Icons.logout_rounded),
        //   )
        // ],
      ),
      drawer: const MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.of(context).welcomeToTheHomeScreen),
            TextButton(
              onPressed: () {
                context.pushNamed(AppRoutes.settings.name);
              },
              child: Text(S.of(context).settings),
            ),
            TextButton(
              onPressed: () {
                context.pushNamed(AppRoutes.profile.name);
              },
              child: Text(S.of(context).profile),
            ),
            TextButton(
              onPressed: () {
                ref.watch(networkServiceProvider).get('/');
              },
              child: Text(S.of(context).test),
            ),
            TextButton(
              onPressed: () {
                context.pushNamed('paginated_list_notifier');
              },
              child: const Text('pagintion'),
            ),
          ],
        ),
      ),
      // body: ListView.builder(
      //   itemCount: 5,
      //   itemBuilder: (context, index) {
      //     return Padding(
      //       padding: const EdgeInsets.all(16),
      //       child: Row(
      //         children: [
      //           ShimmerWidget(
      //             child: Container(
      //               width: 50,
      //               height: 50,
      //               decoration: BoxDecoration(
      //                 color: Colors.grey[300],
      //                 borderRadius: BorderRadius.circular(8),
      //               ),
      //             ),
      //           ),
      //           const SizedBox(width: 16),
      //           Expanded(
      //             child: ShimmerWidget(
      //               child: Container(
      //                 width: double.infinity,
      //                 height: 20,
      //                 color: Colors.grey[300],
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
