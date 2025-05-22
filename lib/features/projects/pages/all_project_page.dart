import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/components/errors/no_content_indicator.dart';
import 'package:midad/components/loading/loading_widget.dart';
import 'package:midad/core/locale/generated/l10n.dart';

import '../providers/project_provider.dart';
import '../widgets/project_card.dart';

class AllProjectsPage extends ConsumerWidget {
  const AllProjectsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsAsync = ref.watch(projectProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).allProjects),
        centerTitle: true,
      ),
      body: projectsAsync.when(
        loading: LoadingWidget.new,
        error: (error, stackTrace) => NoContentIndicator(
          message: error.toString(),
        ),
        data: (projects) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              return ProjectCard(
                project: project,
              );
            },
          );
        },
      ),
    );
  }
}
