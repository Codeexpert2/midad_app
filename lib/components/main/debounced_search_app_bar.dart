import 'package:flutter/material.dart';

import 'package:midad/components/form/debounced_search.dart';

class DebouncedSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const DebouncedSearchAppBar({
    super.key,
    required this.title,
    required this.onDebounceChange,
    this.actions,
    this.onFilterTap,
  });

  final String title;
  final List<Widget>? actions;
  final void Function(String) onDebounceChange;
  final VoidCallback? onFilterTap;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Expanded(child: Text(title)),
          if (onFilterTap != null)
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: onFilterTap,
              tooltip: 'Filter',
            ),
        ],
      ),
      actions: actions,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: DebouncedSearch(
          onDebounceChange: onDebounceChange,
        ),
      ),
    );
  }
}
