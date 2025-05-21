import 'package:flutter/material.dart';

import 'package:midad/components/images/cached_image.dart';

import '../models/project_model.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    super.key,
    required this.project,
    required this.onTap,
  });

  final ProjectModel project;
  final VoidCallback onTap;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _showDescription = false;

  void _toggleDescription() {
    setState(() {
      _showDescription = !_showDescription;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity != null) {
          _toggleDescription();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              CachedImage(
                imageUrl: widget.project.imageUrl,
                height: 220,
                width: 260,
              ),
              if (!_showDescription)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      widget.project.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              if (_showDescription)
                AnimatedOpacity(
                  opacity: _showDescription ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    height: 220,
                    width: 260,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.85),
                          Colors.black.withOpacity(0.3),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        widget.project.description,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
