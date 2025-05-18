import 'package:dio/dio.dart';

import '../../../configs/app_configs.dart';
import '../../../core/client/client.dart';
import '../../../core/errors/error_handler.dart';
import '../../../core/pagination/models/paginated_response.dart';
import '../../../core/pagination/models/pagination_params.dart';
import '../models/article_model.dart';

class ArticleService {
  ArticleService(this._apiClient);

  final ApiClient _apiClient;

  Future<PaginatedResponse<Article>> getArticles(
      PaginationParams params) async {
    try {
      final queryParameters = {
        'search': params.query,
        'page': params.page,
        'per_page': AppConfigs.perPage,
        if (params.filters != null) ...params.filters ?? {},
      };

      final response = await _apiClient.get(
        '/articles',
        queryParameters: queryParameters,
      );

      return PaginatedResponse.fromJson(
        response.data,
        Article.fromJson,
      );
    } on DioException catch (e) {
      throw ErrorHandler.handle(e).message;
    }
  }

  Future<Article> getArticleById(int articleId) async {
    try {
      final response = await _apiClient.get(
        '/articles/$articleId',
      );

      return Article.fromJson(response.data);
    } on DioException catch (e) {
      throw ErrorHandler.handle(e).message;
    }
  }
}
