import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/core/extensions/extensions.dart';

import '../../../components/errors/error_message.dart';
import '../../../components/loading/loading_widget.dart';
import '../../../core/locale/generated/l10n.dart';
import '../../../core/pagination/models/pagination_state.dart';
import '../../../core/pagination/models/pagination_status.dart';
import '../../../core/pagination/notifiers/paginated_list_notifier.dart';
import '../../article/models/article_model.dart';
import '../../article/widgets/article_item_widget.dart';

class ArticleListWidget extends ConsumerWidget {
  const ArticleListWidget({
    super.key,
    required this.provider,
  });

  final AutoDisposeStateNotifierProvider<PaginatedListNotifier<Article>,
      PaginationState<Article>> provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);

    // Show loading state for initial load
    if (state.status == PaginationStatus.initial) {
      return const LoadingWidget();
    }

    // Show empty state if no items and not loading
    if (state.status == PaginationStatus.loading && state.items.isEmpty) {
      return const LoadingWidget();
    }

    // Show error state if error occurred and no items are loaded
    if (state.status == PaginationStatus.error && state.items.isEmpty) {
      return Center(child: ErrorMessage(message: S.of(context).error));
    }

    // Show empty state if no items and not loading
    if (state.items.isEmpty) {
      return Center(child: Text(S.of(context).noArticlesAvailable));
    }

    return SizedBox(
      height: context.height * 0.27,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: state.items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final article = state.items[index];
          return ArticleItemWidget(
            article: article,
            width: context.width * 0.6,
            imageHeight: context.height * 0.15,
          );
        },
      ),
    );
  }
}
