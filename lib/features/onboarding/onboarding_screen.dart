import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/components/button/custom_circle_button.dart';
import 'package:midad/core/keys/keys.dart';
import 'package:midad/core/router/app_routes.dart';
import 'package:midad/core/themes/app_colors.dart';
import 'package:midad/features/onboarding/pages.dart';
import 'package:midad/features/onboarding/widgets/onboarding_page_widget.dart';
import 'package:midad/features/settings/widgets/locale_buttom.dart';
import 'package:midad/initialize_app.dart';
import 'package:midad/services/local_storage/storage_service.dart';

import 'constants/onboarding_constants.dart';
import 'provider/onboarding_provider.dart';

final storage = locator<StorageService>();

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(onboardingProvider);
    final pageController = PageController();

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: pages(context).length,
            onPageChanged: ref.read(onboardingProvider.notifier).setPage,
            itemBuilder: (context, index) => OnboardingPage(
              pageData: pages(context)[index],
            ),
          ),
          const Positioned(top: 60, left: 20, child: LocaleButtom()),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          pages(context).length,
                          (index) {
                            return AnimatedContainer(
                              curve: onboardingCurves,
                              duration: onboardingDuration,
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              width: currentPage == index
                                  ? maxSize * 2.5
                                  : minSize,
                              height: minSize,
                              decoration: BoxDecoration(
                                color: currentPage == index
                                    ? AppColors.warningColor
                                    : AppColors.gray400,
                                borderRadius: BorderRadius.circular(minSize),
                              ),
                            );
                          },
                        ),
                      ),
                      CustomCircleButton(
                        icon: const Icon(Icons.arrow_forward,
                            color: Colors.white),
                        gradientColors: [
                          AppColors.primaryColor,
                          AppColors.primary200
                        ],
                        size: 60.0,
                        onPressed: currentPage == pages(context).length - 1
                            ? () async {
                                storage.saveBool(onboardingKey, true);
                                context.goNamed(AppRoutes.home.name);
                              }
                            : () {
                                pageController.nextPage(
                                  duration: onboardingDuration,
                                  curve: onboardingCurves,
                                );
                              },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
