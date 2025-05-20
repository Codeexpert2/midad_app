import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/components/errors/no_content_indicator.dart';
import 'package:midad/components/loading/loading_widget.dart';
import 'package:midad/core/locale/generated/l10n.dart';
import 'package:midad/core/router/app_routes.dart';
import 'package:midad/core/themes/app_colors.dart';

import '../providers/journal_provider.dart';

class JournalDetailsPage extends ConsumerWidget {
  const JournalDetailsPage({super.key, required this.journalId});
  final String journalId;

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final journalAsync = ref.watch(journalDetailsProvider(journalId));
    return journalAsync.when(
      loading: () => const Scaffold(body: LoadingWidget()),
      error: (error, stackTrace) => Scaffold(
        appBar: AppBar(title: Text(S.of(context).detailsJournal)),
        body: NoContentIndicator(message: error.toString()),
      ),
      data: (journal) => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).detailsJournal),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
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
              const SizedBox(height: 20),
              HtmlWidget(journal.body ?? ''),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pushNamed(
              AppRoutes.pdfViewer.name,
              extra: journal.url ?? '',
            );
          },
          child: const Icon(
            Icons.picture_as_pdf,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}

                  // 'pdfPath':
                  //     'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',