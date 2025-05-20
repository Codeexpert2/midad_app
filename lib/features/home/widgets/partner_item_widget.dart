import 'package:flutter/material.dart';

import 'package:midad/core/extensions/extensions.dart';

import '../../../components/images/avatar_widget.dart';
import '../models/partner_model.dart';

class PartnerItemWidget extends StatelessWidget {
  const PartnerItemWidget({super.key, required this.partner});
  final Partner partner;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AvatarWidget(
          imageUrl: partner.image,
          size: 80,
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: context.width * 0.2,
          child: Text(
            partner.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
