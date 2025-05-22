import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/components/errors/no_content_indicator.dart';
import 'package:midad/components/loading/loading_widget.dart';
import 'package:midad/core/locale/generated/l10n.dart';
import 'package:midad/core/router/app_routes.dart';
import 'package:midad/core/themes/app_gradients.dart';

import '../providers/project_provider.dart';
import '../widgets/project_card.dart';

class ProjectList extends ConsumerWidget {
  const ProjectList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsAsync = ref.watch(projectProvider);

    return projectsAsync.when(
      loading: LoadingWidget.new,
      error: (error, stackTrace) => NoContentIndicator(
        message: error.toString(),
      ),
      data: (projects) {
        final itemCount = projects.length > 4 ? 4 : projects.length;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                final project = projects[index];
                return ProjectCard(
                  project: project,
                );
              },
            ),
            const SizedBox(height: 12),
            Center(
              child: InkWell(
                onTap: () {
                  context.pushNamed(AppRoutes.allProjects.name);
                },
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: AppGradient.linearGradient,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.view_list_rounded, color: Colors.white),
                      const SizedBox(width: 10),
                      Text(
                        S.of(context).allProjects,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
