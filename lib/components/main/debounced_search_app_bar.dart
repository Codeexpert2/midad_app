import 'package:flutter/material.dart';

import 'package:midad/components/form/debounced_search.dart';


class DebouncedSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const DebouncedSearchAppBar({
    super.key,
    required this.title,
    required this.onDebounceChange,
    this.actions,
  });

  final String title;
  final List<Widget>? actions;
  final void Function(String) onDebounceChange;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
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
