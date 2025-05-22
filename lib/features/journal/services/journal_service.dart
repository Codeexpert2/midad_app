import 'package:midad/configs/app_configs.dart';
import 'package:midad/core/client/client.dart';
import 'package:midad/core/errors/error_handler.dart';
import 'package:midad/core/pagination/models/paginated_response.dart';
import 'package:midad/features/journal/models/journal_model.dart';

class JournalService {
  JournalService(this._apiClient);

  final ApiClient _apiClient;

  Future<PaginatedResponse<Journal>> getJournal({
    int page = 1,
    int perPage = AppConfigs.perPage,
    String? search,
  }) async {
    try {
      final response = await _apiClient.get(
        '/journals',
        queryParameters: {
          'search': search,
          'page': page,
          'per_page': perPage,
        },
      );
      return PaginatedResponse.fromJson(
        response.data,
        Journal.fromJson,
      );
    } catch (e) {
      throw ErrorHandler.handle(e).message;
    }
  }

  Future<Journal> getJournalById(String id) async {
    try {
      final response = await _apiClient.get(
        '/journals/$id',
      );

      return Journal.fromJson(response.data);
    } catch (e) {
      throw ErrorHandler.handle(e).message;
    }
  }
}
