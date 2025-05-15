import 'package:flutter/material.dart';

import 'package:midad/core/locale/generated/l10n.dart';

import '../../article/models/article_model.dart';

List<Article> youthList(BuildContext context) {
  final localizations = S.of(context);

  final List<Article> youthList = [
    Article(
        title: localizations.accessToUniversityEducation,
        id: 101,
        imageUrl: '',
        description: ''),
    Article(
        title: localizations.supportingUniversityEducation,
        id: 102,
        imageUrl: '',
        description: ''),
    Article(
        title: localizations.devotingToEducation,
        id: 103,
        imageUrl: '',
        description: ''),
    Article(
        title: localizations.qualifyingYouth,
        id: 104,
        imageUrl: '',
        description: ''),
  ];

  return youthList;
}

List<Article> childrenList(BuildContext context) {
  final localizations = S.of(context);

  final List<Article> childrenList = [
    Article(
        title: localizations.communityParticipation,
        id: 101,
        imageUrl: '',
        description: ''),
    Article(
        title: localizations.schoolSponsorship,
        id: 102,
        imageUrl: '',
        description: ''),
    Article(
        title: localizations.developingQualityEducation,
        id: 103,
        imageUrl: '',
        description: ''),
    Article(
        title: localizations.infrastructureSupport,
        id: 104,
        imageUrl: '',
        description: ''),
  ];

  return childrenList;
}

final List<Article> organizationInterestsList = [
  Article(
      title: 'university education in northern Syria',
      id: 101,
      imageUrl: '',
      description: ''),
  Article(
      title: 'education and community participation',
      id: 102,
      imageUrl: '',
      description: ''),
];
