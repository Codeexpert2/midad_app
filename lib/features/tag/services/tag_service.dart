import 'package:dio/dio.dart';

import '../../../core/client/client.dart';
import '../../../core/errors/error_handler.dart';
import '../models/tag_model.dart';

class TagService {
  TagService(this._apiClient);

  final ApiClient _apiClient;

  Future<List<Tag>> getTags(String? search) async {
    try {
      final queryParameters = {
        'search': search,
      };

      final response = await _apiClient.get(
        '/tags',
        queryParameters: queryParameters,
        isCached : true,
      );
      final data = response.data;

      final tags = (data['tags'] as List)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList();

      return tags;
    } on DioException catch (e) {
      throw ErrorHandler.handle(e).message;
    }
  }
}
