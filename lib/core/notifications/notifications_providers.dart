// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import 'notification_model.dart';

// // Provider for the NotificationRepository
// final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
//   final store = ref.watch(storeProvider);
//   final notificationBox = store.box<NotificationModel>();
//   return NotificationRepository(notificationBox);
// });

// ignore_for_file: lines_longer_than_80_chars

// // Stream provider to watch changes in notifications ordered by date
// final notificationsProvider = StreamProvider<List<NotificationModel>>((ref) {
//   final repository = ref.watch(notificationRepositoryProvider);
//   return repository.getNotificationsStreamOrderedByDate();
// });
