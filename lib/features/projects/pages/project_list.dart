import 'package:flutter/material.dart';

import 'package:midad/core/utils/snackbars.dart';

import '../data/dummy_projects.dart';
import '../widgets/project_card.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dummyProjects.length,
        itemBuilder: (context, index) {
          final project = dummyProjects[index];
          return ProjectCard(
            project: project,
            onTap: () {
              showSuccessSnackbar('project Card Tapped');
            },
          );
        },
      ),
    );
  }
}
