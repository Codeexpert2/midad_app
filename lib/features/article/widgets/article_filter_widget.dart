import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/core/extensions/extensions.dart';

import '../../../components/errors/error_message.dart';
import '../../../components/loading/loading_widget.dart';
import '../../../core/locale/generated/l10n.dart';
import '../../../core/pagination/models/pagination_state.dart';
import '../../../core/pagination/notifiers/paginated_list_notifier.dart';
import '../../../core/themes/app_colors.dart';
import '../../category/providers/category_provider.dart';
import '../../tag/providers/tag_provider.dart';
import '../../type/providers/type_provider.dart';
import '../models/article_model.dart';

class ArticleFilterBottomSheet extends ConsumerWidget {
  const ArticleFilterBottomSheet({
    super.key,
    required this.articleCategoryProvider,
    required this.articleTypeProvider,
    required this.articleTagProvider,
    required this.articlesProvider,
  });

  final AutoDisposeStateProvider<String?> articleCategoryProvider;
  final AutoDisposeStateProvider<String?> articleTypeProvider;
  final AutoDisposeStateProvider<List<String>?> articleTagProvider;
  final AutoDisposeStateNotifierProvider<PaginatedListNotifier<Article>,
      PaginationState<Article>> articlesProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(articleCategoryProvider);
    final selectedType = ref.watch(articleTypeProvider);
    final selectedTags = ref.watch(articleTagProvider) ?? [];

    final categoriesAsync = ref.watch(categoriesProvider);
    final typesAsync = ref.watch(typesProvider);
    final tagsAsync = ref.watch(tagsProvider);

    return Padding(
      padding: MediaQuery.of(context).viewInsets.add(const EdgeInsets.all(16)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).filterArticles,
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(height: 22),

            /// Category
            categoriesAsync.when(
              data: (categories) {
                return DropdownButtonFormField<String>(
                  value: selectedCategory,
                  isExpanded: true,
                  decoration: InputDecoration(
                    labelText: S.of(context).category,
                  ),
                  items: [
                    DropdownMenuItem(
                      value: null,
                      child: Text(S.of(context).all),
                    ),
                    ...categories.map((c) => DropdownMenuItem(
                          value: c.id.toString(),
                          child: Text(c.name),
                        ))
                  ],
                  onChanged: (value) {
                    ref.read(articleCategoryProvider.notifier).state = value;
                  },
                );
              },
              loading: LoadingWidget.new,
              error: (e, _) =>
                  Center(child: ErrorMessage(message: S.of(context).error)),
            ),
            const SizedBox(height: 15),

            /// Type
            typesAsync.when(
              data: (types) {
                return DropdownButtonFormField<String>(
                  value: selectedType,
                  isExpanded: true,
                  decoration: InputDecoration(labelText: S.of(context).type),
                  items: [
                    DropdownMenuItem(
                      value: null,
                      child: Text(S.of(context).all),
                    ),
                    ...types.map((t) => DropdownMenuItem(
                          value: t.id.toString(),
                          child: Text(t.name),
                        ))
                  ],
                  onChanged: (value) {
                    ref.read(articleTypeProvider.notifier).state = value;
                  },
                );
              },
              loading: LoadingWidget.new,
              error: (e, _) =>
                  Center(child: ErrorMessage(message: S.of(context).error)),
            ),
            const SizedBox(height: 15),

            /// Tag
            tagsAsync.when(
              data: (tagsList) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).tag),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: tagsList.map((tag) {
                        final isSelected =
                            selectedTags.contains(tag.id.toString());
                        return FilterChip(
                          label: Text(
                            tag.name,
                            style: TextStyle(
                              color: isSelected ? AppColors.white : null,
                            ),
                          ),
                          shape: const StadiumBorder(
                            side: BorderSide(),
                          ),
                          selectedColor: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.8),
                          backgroundColor: Colors.transparent,
                          showCheckmark: false,
                          selected: isSelected,
                          onSelected: (selected) {
                            final updatedTags = [...selectedTags];
                            if (selected) {
                              if (!updatedTags.contains(tag.id.toString())) {
                                updatedTags.add(tag.id.toString());
                              }
                            } else {
                              updatedTags.remove(tag.id.toString());
                            }
                            ref.read(articleTagProvider.notifier).state =
                                updatedTags;
                          },
                        );
                      }).toList(),
                    ),
                  ],
                );
              },
              loading: LoadingWidget.new,
              error: (e, _) =>
                  Center(child: ErrorMessage(message: S.of(context).error)),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary200,
                    ),
                    onPressed: () {
                      ref.read(articlesProvider.notifier).refresh();
                      context.pop(context);
                    },
                    child: Text(
                      S.of(context).applyFilters,
                      style: const TextStyle(color: AppColors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                TextButton(
                  onPressed: () {
                    ref.read(articleCategoryProvider.notifier).state = null;
                    ref.read(articleTypeProvider.notifier).state = null;
                    ref.read(articleTagProvider.notifier).state = null;
                    ref.read(articlesProvider.notifier).refresh();
                    context.pop(context);
                  },
                  child: Text(S.of(context).clearAll),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
