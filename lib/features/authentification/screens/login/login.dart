import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Pour Get.to()
import 'package:iconsax/iconsax.dart';
import 'package:remorquage/common/styles/spacing_styles.dart';
import 'package:remorquage/features/authentification/screens/login/verify_email.dart';
import 'package:remorquage/utils/constants/colors.dart';
import 'package:remorquage/utils/constants/image_string.dart';
import 'package:remorquage/utils/constants/sizes.dart';
import 'package:remorquage/utils/constants/text_string.dart';
import 'package:remorquage/utils/helpers/helpers_functions.dart';

// 👇️ Import de la page Sign In
import 'package:remorquage/features/authentification/screens/sign_in/sign_in.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Logo, Title & Subtitle
              Center(
                child: Image(
                  height: 100,
                  image: AssetImage(
                    dark ? TImages.lightAppLogo : TImages.darkAppLogo,
                  ),
                ),
              ),
              const SizedBox(height: Tsizes.spaceBtwItems),
              Center(
                child: Text(
                  TTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: Tsizes.sm),
              Center(
                child: Text(
                  TTexts.signupSubTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: Tsizes.spaceBtwSections),

              /// Form
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Tsizes.spaceBtwSections,
                  ),
                  child: Column(
                    children: [
                      /// Name Field
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.user),
                          labelText: TTexts.firstName,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: TColors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: TColors.primary),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: Tsizes.spaceBtwInputFields),

                      /// Email Field
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.direct_right),
                          labelText: TTexts.email,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: TColors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: TColors.primary),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: Tsizes.spaceBtwInputFields),

                      /// Password Field
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.password_check),
                          labelText: TTexts.password,
                          suffixIcon: const Icon(Iconsax.eye_slash),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: TColors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: TColors.primary),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: Tsizes.spaceBtwSections),

                      /// Terms & Conditions Checkbox
                      Row(
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Checkbox(
                              value: false,
                              onChanged: (value) {},
                            ),
                          ),
                          const SizedBox(width: Tsizes.sm),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${TTexts.iAgreeTo} ',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  TextSpan(
                                    text: TTexts.privacyPolicy,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall!.apply(
                                      color:
                                          dark
                                              ? TColors.white
                                              : TColors.primary,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ${TTexts.and} ',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  TextSpan(
                                    text: TTexts.termsOfUse,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall!.apply(
                                      color:
                                          dark
                                              ? TColors.white
                                              : TColors.primary,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: Tsizes.spaceBtwSections),

                      /// Sign Up Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Rediriger vers la page de vérification
                            Get.to(() => const VerifyEmail());
                          },
                          child: const Text(TTexts.signupTitle),
                        ),
                      ),

                      const SizedBox(height: Tsizes.spaceBtwSections),

                      /// Divider
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Divider(
                              color: dark ? TColors.darkGrey : TColors.grey,
                              thickness: 0.5,
                              indent: 60,
                              endIndent: 5,
                            ),
                          ),
                          Text(
                            TTexts.orSignWith.capitalize!,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Flexible(
                            child: Divider(
                              color: dark ? TColors.darkGrey : TColors.grey,
                              thickness: 0.5,
                              indent: 5,
                              endIndent: 60,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: Tsizes.spaceBtwSections),

                      /// Social Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialButton(TImages.google),
                          const SizedBox(width: Tsizes.spaceBtwItems),
                          _buildSocialButton(TImages.facebook),
                          const SizedBox(width: Tsizes.spaceBtwItems),
                          _buildSocialButton(
                            TImages.apple,
                          ), // Ajoute autre image si besoin
                        ],
                      ),
                      const SizedBox(height: Tsizes.spaceBtwSections),

                      /// Login Button
                      Center(
                        child: TextButton(
                          onPressed: () {
                            // ✅ Redirection vers SignInScreen
                            Get.to(() => const SignInScreen());
                          },
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '${TTexts.yourAccountCreate1} ',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                TextSpan(
                                  text: TTexts.SignInTitle,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodySmall!.apply(
                                    color:
                                        dark ? TColors.white : TColors.primary,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Widget pour les boutons sociaux
  Widget _buildSocialButton(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: TColors.grey),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Image.asset(
          imagePath,
          width: Tsizes.iconMd,
          height: Tsizes.iconMd,
        ),
      ),
    );
  }
}
