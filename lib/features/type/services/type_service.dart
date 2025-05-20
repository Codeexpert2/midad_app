import 'package:dio/dio.dart';

import '../../../core/client/client.dart';
import '../../../core/errors/error_handler.dart';
import '../models/type_model.dart';

class TypeService {
  TypeService(this._apiClient);

  final ApiClient _apiClient;

  Future<List<TypeModel>> getTypes(String? search) async {
    try {
      final queryParameters = {
        'search': search,
      };

      final response = await _apiClient.get(
        '/types',
        queryParameters: queryParameters,
        isCached : true,
      );
      final data = response.data;

      final types = (data['types'] as List)
          .map((e) => TypeModel.fromJson(e as Map<String, dynamic>))
          .toList();

      return types;
    } on DioException catch (e) {
      throw ErrorHandler.handle(e).message;
    }
  }
}
