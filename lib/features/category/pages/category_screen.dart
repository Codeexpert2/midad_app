import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/errors/error_indicator.dart';
import '../../../components/loading/loading_widget.dart';
import '../../../components/main/debounced_search_app_bar.dart';
import '../../../core/locale/generated/l10n.dart';
import '../providers/category_provider.dart';
import '../widgets/category_card_widget.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);

    return Scaffold(
      appBar: DebouncedSearchAppBar(
        title: S.of(context).categories,
        onDebounceChange: (value) {
          ref.read(categorySearchProvider.notifier).state = value;
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: categoriesAsync.when(
          data: (categories) => ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return CategoryCard(
                category: category,
                onTap: () {},
              );
            },
          ),
          loading: () => const LoadingWidget(),
          error: (e, _) => ErrorIndicator(
            errorMessage: 'Error',
            onRetry: () {
              ref.invalidate(categoriesProvider);
            },
          ),
        ),
      ),
    );
  }
}
