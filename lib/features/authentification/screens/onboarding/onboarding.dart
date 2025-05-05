import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remorquage/features/authentification/controllers/onboarding_controller.dart';
import 'package:remorquage/features/authentification/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:remorquage/features/authentification/screens/onboarding/widgets/onboarding_next.dart';
import 'package:remorquage/features/authentification/screens/onboarding/widgets/onboarding_page.dart';
import 'package:remorquage/features/authentification/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:remorquage/utils/constants/image_string.dart';
import 'package:remorquage/utils/constants/text_string.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
