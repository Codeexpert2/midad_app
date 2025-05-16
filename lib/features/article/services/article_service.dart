import 'package:dio/dio.dart';

import '../../../configs/app_configs.dart';
import '../../../core/client/client.dart';
import '../../../core/log/app_log.dart';
import '../../../core/pagination/models/pagination_params.dart';
import '../models/article_model.dart';

class ArticleService {
  ArticleService(this._apiClient);

  final ApiClient _apiClient;

  Future<List<Article>> getArticles(PaginationParams params) async {
    try {
      final queryParameters = {
        'search': params.query,
        'page': params.page,
        'per_page': AppConfigs.perPage,
        if (params.filters != null) ...params.filters!,
      };

      final response = await _apiClient.get(
        '/articles',
        queryParameters: queryParameters,
      );
      final data = response.data;

      final articles = (data['data'] as List)
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList();

      return articles;
    } on DioException catch (e) {
      AppLog.error('e: $e');
      rethrow;
    }
  }

  Future<Article> getArticleDetails(int articleId) async {
    try {
      final response = await _apiClient.get('/articles/$articleId');
      final data = response.data;

      final article = Article.fromJson(data);

      return article;
    } on DioException catch (e) {
      AppLog.error('e: $e');
      rethrow;
    }
  }
}
