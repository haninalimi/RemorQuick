import 'package:flutter/material.dart';
import 'package:remorquage/utils/constants/colors.dart';
import 'package:remorquage/utils/constants/sizes.dart';
import 'package:remorquage/utils/helpers/helpers_functions.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    this.extraWidget,
  });

  final String image, title, subTitle;
  final Widget? extraWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Tsizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: THelperFunctions.screenWidth() * 0.8,
            height: THelperFunctions.screenHeight() * 0.6,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Tsizes.spaceBtwItems),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: TColors.subtitle),
          ),
          if (extraWidget != null) ...[
            const SizedBox(height: 30),
            extraWidget!,
          ],
        ],
      ),
    );
  }
}
