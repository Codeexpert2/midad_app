import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/client/client.dart';
import '../models/category_model.dart';
import '../services/category_service.dart';

final categoryServiceProvider = Provider<CategoryService>((ref) {
  final apiClient = ref.read(networkServiceProvider);
  return CategoryService(apiClient);
});

final categorySearchProvider = StateProvider<String?>(
  (ref) => null,
);

final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  final search = ref.watch(categorySearchProvider) ?? '';
  final categoryService = ref.read(categoryServiceProvider);
  return categoryService.getCategories(search);
});
