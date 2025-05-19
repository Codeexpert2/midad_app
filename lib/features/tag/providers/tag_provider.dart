import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/client/client.dart';
import '../models/tag_model.dart';
import '../services/tag_service.dart';

final tagServiceProvider = Provider<TagService>((ref) {
  final apiClient = ref.watch(networkServiceProvider);
  return TagService(apiClient);
});

final tagSearchProvider = StateProvider<String?>(
  (ref) => null,
);

final tagsProvider = FutureProvider<List<Tag>>((ref) async {
  final search = ref.watch(tagSearchProvider) ?? '';
  final tagService = ref.watch(tagServiceProvider);
  return tagService.getTags(search);
});
