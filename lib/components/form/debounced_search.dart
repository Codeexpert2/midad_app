import 'dart:async';

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/core/locale/generated/l10n.dart';

class DebouncedSearch extends ConsumerStatefulWidget {
  const DebouncedSearch({
    super.key,
    required this.onDebounceChange,
  });

  final void Function(String) onDebounceChange;

  @override
  ConsumerState<DebouncedSearch> createState() => _DebouncedSearchState();
}

class _DebouncedSearchState extends ConsumerState<DebouncedSearch> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(Durations.long1, () {
      widget.onDebounceChange(query);
    });
  }

  void _clearSearch() {
    _controller.clear();
    widget.onDebounceChange('');
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16) +
          const EdgeInsets.only(bottom: 8),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: S.of(context).search,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: _clearSearch,
                )
              : null,
          border: const OutlineInputBorder(),
        ),
        onChanged: _onSearchChanged,
      ),
    );
  }
}
