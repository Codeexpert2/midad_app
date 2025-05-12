// import 'package:flutter/material.dart';

// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import 'package:midad/components/loading/loading_widget.dart';


// class NotificationsList extends ConsumerWidget {
//   const NotificationsList({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final notificationsAsyncValue = ref.watch(notificationsProvider);

//     return notificationsAsyncValue.when(
//       loading: LoadingWidget.new,
//       error: (error, stack) => Text('Error: $error'),
//       data: (notifications) {
//         return ListView.builder(
//           itemCount: notifications.length,
//           itemBuilder: (context, index) {
//             final notification = notifications[index];
//             return ListTile(
//               title: Text(notification.title),
//               subtitle: Text(notification.body),
//               trailing: Icon(
//                 notification.seen ? Icons.visibility : Icons.visibility_off,
//               ),
//               onTap: () {
//                 // ref
//                 //     .read(notificationRepositoryProvider)
//                 //     .markAsSeen(notification.id);
//               },
//             );
//           },
//         );
//       },
//     );
//   }
// }
