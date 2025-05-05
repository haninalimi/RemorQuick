import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:remorquage/utils/constants/image_string.dart';
import 'package:remorquage/utils/constants/sizes.dart';
import 'package:remorquage/utils/constants/text_string.dart';
import 'package:remorquage/utils/helpers/helpers_functions.dart';
import 'package:remorquage/utils/theme/custom_themes/text_field_theme.dart';
import 'package:remorquage/utils/theme/custom_themes/text_theme.dart';
import 'package:remorquage/utils/constants/text_string.dart';
import 'package:remorquage/utils/constants/text_string.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back,
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(Tsizes.defaultSpace),
        child: Column(
          children: [
            Image(
              image: const AssetImage(TImages.password),
              width: THelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(height: Tsizes.spaceBtwSections),
            Text(
              TTexts.changeYourPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Tsizes.spaceBtwItems),
            Text(
              TTexts.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Tsizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Done"),
              ),
            ),
            const SizedBox(height: Tsizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: const Text("Resend Email"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
