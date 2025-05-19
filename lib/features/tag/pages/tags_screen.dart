import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/errors/error_indicator.dart';
import '../../../components/loading/loading_widget.dart';
import '../../../components/main/debounced_search_app_bar.dart';
import '../../../core/locale/generated/l10n.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/themes/app_colors.dart';
import '../providers/tag_provider.dart';
import '../widgets/tag_card_widget.dart';

class TagsScreen extends ConsumerWidget {
  const TagsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagsAsync = ref.watch(tagsProvider);

    return Scaffold(
      appBar: DebouncedSearchAppBar(
        title: S.of(context).tags,
        onDebounceChange: (value) {
          ref.read(tagSearchProvider.notifier).state = value;
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: tagsAsync.when(
          data: (tags) => RefreshIndicator(
            color: AppColors.primary200,
            onRefresh: () async {
              ref.invalidate(tagsProvider);
            },
            child: ListView.builder(
              itemCount: tags.length,
              itemBuilder: (context, index) {
                final tag = tags[index];
                return TagCard(
                  tag: tag,
                  onTap: () {
                    context.pushNamed(
                      AppRoutes.tagDetails.name,
                      queryParameters: {
                        'tagId': tag.id.toString(),
                        'tagName': tag.name,
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
              ref.invalidate(tagsProvider);
            },
          ),
        ),
      ),
    );
  }
}
