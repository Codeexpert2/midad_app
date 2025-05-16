import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/client/client.dart';
import '../services/article_service.dart';

// final articleServiceProvider = Provider((ref) => ArticleService());

final articleServiceProvider = Provider<ArticleService>((ref) {
  final apiClient = ref.watch(networkServiceProvider);
  return ArticleService(apiClient);
});