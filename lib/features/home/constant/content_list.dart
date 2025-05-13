import 'package:flutter/material.dart';

import '../../../locale/generated/l10n.dart';
import '../models/content_model.dart';

List<OrganizationContent> organizationContentList(BuildContext context) {
  final localizations = S.of(context);

  final List<OrganizationContent> contentList = [
    OrganizationContent(
      title: localizations.youth,
      subItems: [
        SubItem(
            title: localizations.accessToUniversityEducation, articleId: 101),
        SubItem(
            title: localizations.supportingUniversityEducation, articleId: 102),
        SubItem(title: localizations.devotingToEducation, articleId: 103),
        SubItem(title: localizations.qualifyingYouth, articleId: 104),
      ],
    ),
    OrganizationContent(
      title: localizations.children,
      subItems: [
        SubItem(title: localizations.communityParticipation, articleId: 201),
        SubItem(title: localizations.schoolSponsorship, articleId: 202),
        SubItem(
            title: localizations.developingQualityEducation, articleId: 203),
        SubItem(title: localizations.infrastructureSupport, articleId: 204),
      ],
    ),
    OrganizationContent(
      title: localizations.organizationInterests,
      subItems: [
        SubItem(
            title: 'university education in northern Syria', articleId: 301),
        SubItem(title: 'education and community participation', articleId: 302),
      ],
    ),
  ];

  return contentList;
}
