import 'package:flutter/material.dart';

import 'package:midad/core/router/app_routes.dart';

class HomePageCard extends StatelessWidget {
  const HomePageCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.routeName,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(.3),
              color.withOpacity(.2),
              color.withOpacity(.1),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(.1),
              blurRadius: 8,
            ),
          ]),
      child: Stack(
        children: [
          PositionedDirectional(
            top: 16,
            end: 32,
            child: Icon(
              icon,
              size: 64,
              color: Colors.white.withOpacity(0.3),
            ),
          ),
          ListTile(
            onTap: () => context.pushNamed(routeName),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            leading: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white.withOpacity(0.5),
              child: Icon(icon, size: 28, color: color),
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
            ),
            subtitle: Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                // color: Colors.grey.shade600,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              // color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
