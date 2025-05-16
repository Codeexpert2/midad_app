import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/components/errors/no_content_indicator.dart';
import 'package:midad/components/loading/loading_widget.dart';
import 'package:midad/core/locale/generated/l10n.dart';

import '../providers/journal_provider.dart';

class JournalDetailsPage extends ConsumerWidget {
  const JournalDetailsPage({super.key, required this.journalId});
  final String journalId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final journalAsync = ref.watch(journalDetailsProvider(journalId));
    return Scaffold(
      appBar: AppBar(
        title:  Text(S.of(context).detailsJournal),
        centerTitle: true,
      ),
      body: journalAsync.when(
        loading: LoadingWidget.new,
        error: (error, stackTrace) => NoContentIndicator(
          message: error.toString(),
        ),
        data: (journal) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                journal.title ?? S.of(context).noTitle,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.person, size: 18, color: Colors.grey),
                  const SizedBox(width: 6),
                  Text(
                    journal.user?.name ?? 'مجهول',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const Spacer(),
                  const Icon(Icons.calendar_today,
                      size: 18, color: Colors.grey),
                  const SizedBox(width: 6),
                  Text(
                    _formatDate(journal.createdAt),
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (journal.url != null && journal.url!.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    journal.url!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(height: 20),
              Text(
                journal.body ?? 'لا يوجد محتوى.',
                style: const TextStyle(fontSize: 16, height: 1.6),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.year}/${date.month}/${date.day}';
  }
}
