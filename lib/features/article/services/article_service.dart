import 'package:dio/dio.dart';

import '../../../configs/app_configs.dart';
import '../../../core/client/client.dart';
import '../../../core/errors/error_handler.dart';
import '../../../core/pagination/models/paginated_response.dart';
import '../models/article_model.dart';

class ArticleService {
  ArticleService(this._apiClient);

  final ApiClient _apiClient;

  Future<PaginatedResponse<Article>> getArticles({
    int page = 1,
    int perPage = AppConfigs.perPage,
    String? query,
    String? type,
    String? category,
    List<String>? tag,
  }) async {
    try {
      final queryParameters = {
        'page': page,
        'per_page': perPage,
        'search': query,
        'type': type,
        'category': category,
        if (tag != null && tag.isNotEmpty) ...{
          for (int i = 0; i < tag.length; i++) 'tags[]': tag[i],
        },
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
