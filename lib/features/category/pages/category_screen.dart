import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/errors/error_indicator.dart';
import '../../../components/loading/loading_widget.dart';
import '../../../components/main/debounced_search_app_bar.dart';
import '../../../core/locale/generated/l10n.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/themes/app_colors.dart';
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
          data: (categories) => RefreshIndicator(
            color: AppColors.primary200,
            onRefresh: () async {
              ref.invalidate(categoriesProvider);
            },
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryCard(
                  category: category,
                  onTap: () {
                    context.pushNamed(
                      AppRoutes.categoryDetails.name,
                      queryParameters: {
                        'categoryId': category.id.toString(),
                        'categoryName': category.name,
                      },
                    );
                  },
                );
              },
            ),
          ),
          loading: () => const LoadingWidget(),
          error: (e, _) => ErrorIndicator(
            errorMessage: S.of(context).error,
            onRetry: () {
              ref.invalidate(categoriesProvider);
            },
          ),
        ),
      ),
    );
  }
}
