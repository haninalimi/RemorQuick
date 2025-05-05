import 'package:flutter/material.dart';
import 'package:remorquage/utils/constants/sizes.dart';
import 'package:remorquage/utils/device/device_utility.dart';
import 'package:remorquage/features/authentification/controllers/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: Tsizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnboardingController.instance.skipPage(),
        child: const Text('Skip'),
      ),
    );
  }
}
