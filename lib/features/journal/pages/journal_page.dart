import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/components/main/debounced_search_app_bar.dart';
import 'package:midad/core/pagination/paginated_list_widget.dart';
import 'package:midad/core/router/app_routes.dart';

import '../models/journal_model.dart';
import '../providers/journal_provider.dart';
import '../widgets/journal_card_widget.dart';

class JournalPage extends HookConsumerWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: DebouncedSearchAppBar(
        title: 'Journals',
        onDebounceChange: (value) {
          ref.read(journalSearchProvider.notifier).state = value;
          ref.read(journalProvider.notifier).refresh();
        },
      ),
      body: PaginatedListWidget<Journal>(
        provider: journalProvider,
        itemBuilder: (context, journal) {
          return JournalCard(
            journal: journal,
            onTap: () {
              context.pushNamed(
                AppRoutes.journalDetails.name,
                pathParameters: {'journalId': journal.id.toString()},
              );
            },
          );
        },
      ),
    );
  }
}
