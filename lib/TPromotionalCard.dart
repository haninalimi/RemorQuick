import 'package:flutter/material.dart';
import 'package:remorquage/utils/constants/colors.dart';
import 'package:remorquage/utils/constants/sizes.dart';

class TPromotionalCard extends StatelessWidget {
  const TPromotionalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -80), // Remonter plus la carte promotionnelle
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Tsizes.defaultSpace),
        child: Container(
          height: 180,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Tsizes.cardRadiusLg),
            border: Border.all(color: TColors.primary, width: 2),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFA4B3F4).withOpacity(0.5),
                blurRadius: 6,
                spreadRadius: 1,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Image de fond
              ClipRRect(
                borderRadius: BorderRadius.circular(Tsizes.cardRadiusLg),
                child: Opacity(
                  opacity: 0.85,
                  child: Image.asset(
                    'assets/images/remorquage.jpeg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              // Overlay dégradé
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Tsizes.cardRadiusLg),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      const Color(0xFFA4B3F4).withOpacity(0.7),
                    ],
                  ),
                ),
              ),
              // Texte
              Padding(
                padding: const EdgeInsets.all(Tsizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Need a fast and secure towing service?',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineLarge?.copyWith(
                        color: TColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
