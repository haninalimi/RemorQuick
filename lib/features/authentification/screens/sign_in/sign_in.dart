import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:remorquage/common/styles/spacing_styles.dart';
import 'package:remorquage/features/authentification/screens/password_configuartion/forgot_password.dart';
import 'package:remorquage/navigation_menu.dart';
import 'package:remorquage/utils/constants/colors.dart';
import 'package:remorquage/utils/constants/image_string.dart';
import 'package:remorquage/utils/constants/sizes.dart';
import 'package:remorquage/utils/constants/text_string.dart';
import 'package:remorquage/utils/helpers/helpers_functions.dart';
import 'package:remorquage/features/authentification/screens/login/login.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
                  height: 150,
                  image: AssetImage(
                    dark ? TImages.lightAppLogo : TImages.darkAppLogo,
                  ),
                ),
              ),
              const SizedBox(height: Tsizes.spaceBtwItems),
              Center(
                child: Text(
                  TTexts.SignInTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: Tsizes.sm),
              Center(
                child: Text(
                  TTexts.loginSubTitle,
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
                      /// Email Field
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.direct_right),
                          labelText: TTexts.email,
                        ),
                      ),
                      const SizedBox(height: Tsizes.spaceBtwInputFields),

                      /// Password Field
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check),
                          labelText: TTexts.password,
                          suffixIcon: Icon(Iconsax.eye_slash),
                        ),
                      ),
                      const SizedBox(height: Tsizes.spaceBtwInputFields / 2),

                      /// Remember Me & Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Remember Me
                          Row(
                            children: [
                              Checkbox(value: true, onChanged: (value) {}),
                              const Text(TTexts.rememberMe),
                            ],
                          ),

                          /// Forgot Password
                          TextButton(
                            onPressed:
                                () => Get.to(() => const ForgetPassword()),
                            child: const Text(TTexts.forgetPassword),
                          ),
                        ],
                      ),
                      const SizedBox(height: Tsizes.spaceBtwSections),

                      /// Sign In Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Get.to(() => NavigationMenu()),
                          child: const Text(TTexts.signIn),
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
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: TColors.grey),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Image(
                                width: Tsizes.iconMd,
                                height: Tsizes.iconMd,
                                image: AssetImage(TImages.google),
                              ),
                            ),
                          ),
                          const SizedBox(width: Tsizes.spaceBtwItems),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: TColors.grey),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Image(
                                width: Tsizes.iconMd,
                                height: Tsizes.iconMd,
                                image: AssetImage(TImages.facebook),
                              ),
                            ),
                          ),
                          const SizedBox(width: Tsizes.spaceBtwItems),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: TColors.grey),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Image(
                                width: Tsizes.iconMd,
                                height: Tsizes.iconMd,
                                image: AssetImage(TImages.apple),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: Tsizes.spaceBtwSections),

                      /// Sign Up Option
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: TTexts.yourAccountCreate,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                TextSpan(
                                  text: ' ${TTexts.signUp}',
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
}
