import 'package:dio/dio.dart';

import '../../../core/client/client.dart';
import '../../../core/errors/error_handler.dart';
import '../models/category_model.dart';

class CategoryService {
  CategoryService(this._apiClient);

  final ApiClient _apiClient;

  Future<List<Category>> getCategories(String? search) async {
    try {
      final queryParameters = {
        'search': search,
      };

      final response = await _apiClient.get(
        '/categories',
        queryParameters: queryParameters,
        isCached : true,
      );
      final data = response.data;

      final categories = (data['categories'] as List)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList();

      return categories;
    } on DioException catch (e) {
      throw ErrorHandler.handle(e).message;
    }
  }
}
