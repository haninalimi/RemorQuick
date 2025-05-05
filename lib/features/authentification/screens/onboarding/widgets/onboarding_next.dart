import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:remorquage/utils/constants/colors.dart';
import 'package:remorquage/utils/constants/sizes.dart';
import 'package:remorquage/utils/device/device_utility.dart';
import 'package:get/get.dart';
import 'package:remorquage/features/authentification/controllers/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;

    return Obx(() {
      final isLastPage =
          controller.currentPageIndex.value ==
          2; // Vérifie si on est à la dernière page

      return Positioned(
        bottom:
            TDeviceUtils.getBottomNavigationBarHeight() +
            40, // Espacement depuis le bas
        left: 0,
        right: 0,
        child: GestureDetector(
          onTap: () => controller.nextPage(), // Action lors du clic
          child: Container(
            width: 100, // Taille du bouton
            height: 100,
            decoration: const BoxDecoration(
              color: TColors.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 4),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Center(
              child:
                  isLastPage
                      ? const Text(
                        'Go', // Affiche "Go" pour la dernière page
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                      : const Icon(
                        // Sinon affiche une flèche
                        Iconsax.arrow_right_3,
                        color: Colors.white,
                        size: 28,
                      ),
            ),
          ),
        ),
      );
    });
  }
}
