import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/client/client.dart';
import '../models/slide_model.dart';
import '../services/slide_service.dart';

final slideServiceProvider = Provider<SlideService>((ref) {
  final apiClient = ref.read(networkServiceProvider);
  return SlideService(apiClient);
});

final slidesProvider = FutureProvider.autoDispose<List<Slide>>((ref) async {
  final slideService = ref.read(slideServiceProvider);
  return await slideService.getSlides();
});
