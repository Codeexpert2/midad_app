import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/client/client.dart';
import '../models/type_model.dart';
import '../services/type_service.dart';

final typeServiceProvider = Provider<TypeService>((ref) {
  final apiClient = ref.watch(networkServiceProvider);
  return TypeService(apiClient);
});

final typeSearchProvider = StateProvider<String?>(
  (ref) => null,
);

final typesProvider = FutureProvider<List<TypeModel>>((ref) async {
  final search = ref.watch(typeSearchProvider) ?? '';
  final typeService = ref.watch(typeServiceProvider);
  return typeService.getTypes(search);
});
