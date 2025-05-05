import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remorquage/features/authentification/screens/login/success_screen.dart';
import 'package:remorquage/features/authentification/screens/sign_in/sign_in.dart';
import 'package:remorquage/utils/constants/sizes.dart';
import 'package:remorquage/utils/constants/text_string.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const SignInScreen()),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsizes.defaultSpace),
          child: Column(
            children: [
              Image.asset(
                'assets/images/success.png', // Replace with your image path
                height: 400, // Set height to your preference
                width: double.infinity, // Makes the image full-width
                fit: BoxFit.cover, // Adjust the image to fit properly
              ),
              const SizedBox(height: Tsizes.spaceBtwSections),

              Text(
                TTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Tsizes.spaceBtwItems),
              Text(
                'hanin@gmail.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Tsizes.spaceBtwItems),
              Text(
                TTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Tsizes.spaceBtwSections),

              // buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      () => Get.to(
                        () => SuccessScreen(
                          image: 'assets/images/verifyyy.png',
                          title: 'Your account has been verified!',
                          subTitle: 'You can now sign in and use the app.',
                          onPressed: () => Get.to(() => const SignInScreen()),
                        ),
                      ),
                  child: const Text("Continue"),
                ),
              ),
              const SizedBox(height: Tsizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    // TODO: add resend logic
                  },
                  child: const Text("Resend email"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
