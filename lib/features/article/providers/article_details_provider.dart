import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/article_model.dart';

import 'article_service_provider.dart';

final articleDetailsProvider = FutureProvider.family<Article, int>((ref, id) {
  final service = ref.watch(articleServiceProvider);
  return service.getArticleDetails(id);
});
