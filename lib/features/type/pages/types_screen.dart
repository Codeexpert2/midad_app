import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/errors/error_indicator.dart';
import '../../../components/loading/loading_widget.dart';
import '../../../components/main/debounced_search_app_bar.dart';
import '../../../core/locale/generated/l10n.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/themes/app_colors.dart';
import '../providers/type_provider.dart';
import '../widgets/type_card_widget.dart';

class TypesScreen extends ConsumerWidget {
  const TypesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typesAsync = ref.watch(typesProvider);

    return Scaffold(
      appBar: DebouncedSearchAppBar(
        title: S.of(context).types,
        onDebounceChange: (value) {
          ref.read(typeSearchProvider.notifier).state = value;
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: typesAsync.when(
          data: (types) => RefreshIndicator(
            color: AppColors.primary200,
            onRefresh: () async {
              ref.invalidate(typesProvider);
            },
            child: ListView.builder(
              itemCount: types.length,
              itemBuilder: (context, index) {
                final type = types[index];
                return TypeCard(
                  type: type,
                  onTap: () {
                    context.pushNamed(
                      AppRoutes.typeDetails.name,
                      queryParameters: {
                        'typeId': type.id.toString(),
                        'typeName': type.name,
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
              ref.invalidate(typesProvider);
            },
          ),
        ),
      ),
    );
  }
}
