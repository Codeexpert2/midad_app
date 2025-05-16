import 'package:flutter/material.dart';

import 'package:midad/core/locale/generated/l10n.dart';

import '../../article/models/article_model.dart';
import '../../article/models/type_model.dart';
import '../../category/models/category_model.dart';

List<Article> youthList(BuildContext context) {
  final localizations = S.of(context);

  final List<Article> youthList = [
    Article(
      title: localizations.accessToUniversityEducation,
      id: 101,
      image: '',
      content: '',
      promptContent: '',
      promptTypeId: 1,
      userId: 1,
      promptCategoryId: 1,
      status: '',
      category: Category(id: 1, name: '', status: ''),
      tags: [],
      type: TypeModel(id: 1, name: ''),
    ),
    Article(
      title: localizations.supportingUniversityEducation,
      id: 102,
      image: '',
      content: '',
      promptContent: '',
      promptTypeId: 1,
      userId: 1,
      promptCategoryId: 1,
      status: '',
      category: Category(id: 1, name: '', status: ''),
      tags: [],
      type: TypeModel(id: 1, name: ''),
    ),
    Article(
      title: localizations.devotingToEducation,
      id: 103,
      image: '',
      content: '',
      promptContent: '',
      promptTypeId: 1,
      userId: 1,
      promptCategoryId: 1,
      status: '',
      category: Category(id: 1, name: '', status: ''),
      tags: [],
      type: TypeModel(id: 1, name: ''),
    ),
    Article(
      title: localizations.qualifyingYouth,
      id: 104,
      image: '',
      content: '',
      promptContent: '',
      promptTypeId: 1,
      userId: 1,
      promptCategoryId: 1,
      status: '',
      category: Category(id: 1, name: '', status: ''),
      tags: [],
      type: TypeModel(id: 1, name: ''),
    ),
  ];

  return youthList;
}

List<Article> childrenList(BuildContext context) {
  final localizations = S.of(context);

  final List<Article> childrenList = [
    Article(
      title: localizations.communityParticipation,
      id: 101,
      image: '',
      content: '',
      promptContent: '',
      promptTypeId: 1,
      userId: 1,
      promptCategoryId: 1,
      status: '',
      category: Category(id: 1, name: '', status: ''),
      tags: [],
      type: TypeModel(id: 1, name: ''),
    ),
    Article(
      title: localizations.schoolSponsorship,
      id: 102,
      image: '',
      content: '',
      promptContent: '',
      promptTypeId: 1,
      userId: 1,
      promptCategoryId: 1,
      status: '',
      category: Category(id: 1, name: '', status: ''),
      tags: [],
      type: TypeModel(id: 1, name: ''),
    ),
    Article(
      title: localizations.developingQualityEducation,
      id: 103,
      image: '',
      content: '',
      promptContent: '',
      promptTypeId: 1,
      userId: 1,
      promptCategoryId: 1,
      status: '',
      category: Category(id: 1, name: '', status: ''),
      tags: [],
      type: TypeModel(id: 1, name: ''),
    ),
    Article(
      title: localizations.infrastructureSupport,
      id: 104,
      image: '',
      content: '',
      promptContent: '',
      promptTypeId: 1,
      userId: 1,
      promptCategoryId: 1,
      status: '',
      category: Category(id: 1, name: '', status: ''),
      tags: [],
      type: TypeModel(id: 1, name: ''),
    ),
  ];

  return childrenList;
}

final List<Article> organizationInterestsList = [
  Article(
    title: 'university education in northern Syria',
    id: 101,
    image: '',
    content: '',
    promptContent: '',
    promptTypeId: 1,
    userId: 1,
    promptCategoryId: 1,
    status: '',
    category: Category(id: 1, name: '', status: ''),
    tags: [],
    type: TypeModel(id: 1, name: ''),
  ),
  Article(
    title: 'education and community participation',
    id: 102,
    image: '',
    content: '',
    promptContent: '',
    promptTypeId: 1,
    userId: 1,
    promptCategoryId: 1,
    status: '',
    category: Category(id: 1, name: '', status: ''),
    tags: [],
    type: TypeModel(id: 1, name: ''),
  ),
];
