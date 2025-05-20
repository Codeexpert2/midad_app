import 'package:dio/dio.dart';

import '../../../core/client/client.dart';
import '../../../core/errors/error_handler.dart';
import '../models/slide_model.dart';

class SlideService {
  SlideService(this._apiClient);

  final ApiClient _apiClient;

  Future<List<Slide>> getSlides() async {
    try {
      final response = await _apiClient.get(
        '/slides',
      );

      final slides = (response.data['slides'] as List)
          .map((e) => Slide.fromJson(e as Map<String, dynamic>))
          .toList();

      return slides;
    } on DioException catch (e) {
      throw ErrorHandler.handle(e).message;
    }
  }
}
