import 'package:midad/configs/app_configs.dart';
import 'package:midad/core/client/client.dart';
import 'package:midad/core/errors/error_handler.dart';
import 'package:midad/core/pagination/models/paginated_response.dart';

import '../models/video_model.dart';

class VideoService {
  VideoService(this._apiClient);

  final ApiClient _apiClient;

  Future<PaginatedResponse<Video>> getVideos({
    int page = 1,
    int perPage = AppConfigs.perPage,
    String? search,
  }) async {
    try {
      final response = await _apiClient.get(
        '/videos',
        queryParameters: {
          'search': search,
          'page': page,
          'per_page': perPage,
        },
      );
      return PaginatedResponse.fromJson(
        response.data,
        Video.fromJson,
      );
    } catch (e) {
      throw ErrorHandler.handle(e).message;
    }
  }
}
