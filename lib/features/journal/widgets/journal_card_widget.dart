import 'package:flutter/material.dart';

import 'package:midad/core/locale/generated/l10n.dart';

import '../models/journal_model.dart';

class JournalCard extends StatelessWidget {
  const JournalCard({
    super.key,
    required this.journal,
    required this.onTap,
  });
  final Journal journal;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.only(bottom: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.menu_book_rounded,
                  color: Colors.orange,
                  size: 30,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      journal.title ?? S.of(context).noTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // const SizedBox(height: 6),
                    //  HtmlWidget(journal.body??''),

                    // Text(
                    //   journal.body != null && journal.body!.isNotEmpty
                    //? '${journal.body!.substring(0, journal.body!.length > 60 ? 60 : journal.body!.length)}...'
                    //       : S.of(context).noDescription,
                    //   maxLines: 2,
                    //   overflow: TextOverflow.ellipsis,
                    //   style: const TextStyle(
                    //     fontSize: 13,
                    //     color: Colors.black54,
                    //   ),
                    // ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
