import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/core/extensions/extensions.dart';

import '../../../components/errors/error_message.dart';
import '../../../core/locale/generated/l10n.dart';
import '../providers/partner_provider.dart';

import 'partner_item_widget.dart';
import 'partner_shimmer_widget.dart';

class PartnerListWidget extends ConsumerWidget {
  const PartnerListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final partnerAsync = ref.watch(partnerProvider);

    return partnerAsync.when(
      data: (partners) => SizedBox(
        height: context.height * 0.13,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemCount: partners.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            return PartnerItemWidget(partner: partners[index]);
          },
        ),
      ),
      loading: () => const PartnerShimmerWidget(),
      error: (e, _) =>
          Center(child: ErrorMessage(message: S.of(context).error)),
    );
  }
}
