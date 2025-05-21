import 'package:flutter/material.dart';

import 'package:midad/core/locale/generated/l10n.dart';
import 'package:midad/core/themes/app_gradients.dart';
import 'package:midad/core/utils/snackbars.dart';

import '../data/dummy_projects.dart';
import '../widgets/project_card.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({super.key});

  @override
  Widget build(BuildContext context) {
    final int itemCount = dummyProjects.length > 4 ? 4 : dummyProjects.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            final project = dummyProjects[index];
            return ProjectCard(
              project: project,
              onTap: () {
                showSuccessSnackbar('Project Card Tapped');
              },
            );
          },
        ),
        const SizedBox(height: 12),
        Center(
          child: InkWell(
            onTap: () {
              showSuccessSnackbar('Show All Projects tapped');
            },
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                    // 'عرض كامل المشاريع',
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
  }
}
