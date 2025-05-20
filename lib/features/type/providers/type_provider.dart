import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/client/client.dart';
import '../models/type_model.dart';
import '../services/type_service.dart';

final typeServiceProvider = Provider<TypeService>((ref) {
  final apiClient = ref.read(networkServiceProvider);
  return TypeService(apiClient);
});

final typeSearchProvider = StateProvider.autoDispose<String?>((ref) => null);

final typesProvider = FutureProvider.autoDispose<List<TypeModel>>((ref) async {
  final search = ref.watch(typeSearchProvider);
  final typeService = ref.read(typeServiceProvider);
  return await typeService.getTypes(search);
});
