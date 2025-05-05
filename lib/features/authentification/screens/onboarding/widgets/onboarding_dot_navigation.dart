import 'package:flutter/material.dart';
import 'package:remorquage/features/authentification/controllers/onboarding_controller.dart';
import 'package:remorquage/utils/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;

    return Align(
      alignment: Alignment.topCenter, // ⬅️ place les dots en haut au centre
      child: Padding(
        padding: const EdgeInsets.only(
          top: 80,
        ), // ⬅️ ajoute un espace depuis le haut
        child: SmoothPageIndicator(
          count: 3,
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          effect: const ExpandingDotsEffect(
            activeDotColor: TColors.primary,
            dotHeight: 6,
          ),
        ),
      ),
    );
  }
}
