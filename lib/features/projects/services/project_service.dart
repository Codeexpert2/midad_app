import 'package:midad/core/client/client.dart';
import 'package:midad/core/errors/error_handler.dart';

import '../models/project_model.dart';


class ProjectService {
  ProjectService(this._apiClient);
  final ApiClient _apiClient;

  Future<List<Project>> getProjects() async {
    try {
      final response = await _apiClient.get(
        '/projects',
      );
      final data = ProjectModel.fromJson(response.data);
      return data.projects ?? [];
    } catch (e) {
      throw ErrorHandler.handle(e).message;
    }
  }
}
