import 'package:flutter/widgets.dart';

import 'package:midad/core/constants/images.dart';
import 'package:midad/features/onboarding/models/onboarding_model.dart';

import '../../locale/generated/l10n.dart';

List<OnboardingPageData> pages(BuildContext context) {
  return [
    OnboardingPageData(
      title: S.of(context).empowerEducation,
      description: S
          .of(context)
          .supportStudentsSchoolsAndUniversitiesWithResourcesThatMakeA,
      imagePath: AppImages.imagesOnboarding,
    ),
    OnboardingPageData(
      title: S.of(context).inspireMinds,
      description: S
          .of(context)
          .exploreRichCulturalAndAwarenessArticlesDesignedToBroadenHorizons,
      imagePath: AppImages.imagesOnboarding1,
    ),
    OnboardingPageData(
      title: S.of(context).shapeTheFuture,
      description: S
          .of(context)
          .joinOurJourneyToPromoteInclusiveInnovativeAndQualityEducation,
      imagePath: AppImages.imagesOnboarding2,
    ),
  ];
}
