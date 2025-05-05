import 'package:flutter/material.dart';
import 'package:remorquage/utils/constants/colors.dart';
import 'package:remorquage/utils/constants/sizes.dart';
import 'package:remorquage/utils/device/device_utility.dart';
import 'package:remorquage/utils/helpers/helpers_functions.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon,
    this.showBackground = true,
    this.showBarder = true,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBarder;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Tsizes.defaultSpace),
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        decoration: BoxDecoration(
          color:
              showBackground
                  ? dark
                      ? TColors.dark
                      : TColors.light
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(Tsizes.cardRadiusLg),
          border: showBarder ? Border.all(color: TColors.grey) : null,
        ),
        child: TextField(
          style: Theme.of(context).textTheme.bodySmall,
          decoration: InputDecoration(
            prefixIcon:
                icon != null
                    ? Icon(icon, color: TColors.darkGrey, size: 18)
                    : null,
            hintText: text,
            hintStyle: Theme.of(context).textTheme.bodySmall,
            border: InputBorder.none, // Pas de bordure supplémentaire
            contentPadding: const EdgeInsets.all(Tsizes.sm),
          ),
        ),
      ),
    );
  }
}
