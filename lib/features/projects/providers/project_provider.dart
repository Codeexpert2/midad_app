import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/core/client/client.dart';

import '../models/project_model.dart';
import '../services/project_service.dart';

final projectServiceProvider = Provider<ProjectService>((ref) {
  final apiClient = ref.read(networkServiceProvider);
  return ProjectService(apiClient);
});

final projectProvider = FutureProvider<List<Project>>((ref) async {
  final projectService = ref.watch(projectServiceProvider);
  return projectService.getProjects();
});
