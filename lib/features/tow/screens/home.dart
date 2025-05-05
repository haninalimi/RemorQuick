import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:remorquage/CarSelectionScreen.dart';
import 'package:remorquage/ServiceCardsSection.dart';
import 'package:remorquage/TPromotionalCard.dart';
import 'package:remorquage/appbar.dart';
import 'package:remorquage/common/widgets/circular_container.dart';
import 'package:remorquage/lib/LocationSelectionScreen copy.dart';
import 'package:remorquage/search_container.dart';
import 'package:remorquage/section_heading.dart';
import 'package:remorquage/trachingScreen.dart';
import 'package:remorquage/utils/constants/colors.dart';
import 'package:remorquage/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Partie bleue (AppBar + Search)
            Container(
              color: Colors.white,
              child: Stack(
                children: [
                  TRoundedBottomContainer(
                    outerColor: const Color(0xFF4254B5),
                    centerColor: const Color(0xFF4254B5).withOpacity(0.9),
                    child: Column(
                      children: [
                        TAppBar(
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: TColors.primary,
                                    width: 2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 3,
                                      blurRadius: 10,
                                      offset: const Offset(0, 0),
                                    ),
                                  ],
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/images/fille.jpeg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hello Manel',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(color: TColors.white),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        ' Ksar, Gafsa',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(color: TColors.white),
                                      ),
                                      const SizedBox(width: 4),
                                      const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: Tsizes.spaceBtwItems),
                        const TSearchContainer(
                          text: 'Search towing services...',
                          icon: Iconsax.search_normal,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Carte Promotionnelle
            const TPromotionalCard(),
            // Section Services
            Transform.translate(
              offset: const Offset(0, -50),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Tsizes.defaultSpace,
                ),
                child: Column(
                  children: [
                    // Section existante
                    const TSelectioHeading(
                      title: 'Service Categories',
                      showActionButton: false,
                      textColor: TColors.dark,
                    ),
                    const SizedBox(height: Tsizes.spaceBtwItems),
                    const ServiceCardsSection(),
                    const SizedBox(height: Tsizes.spaceBtwSections),
                    // Nouvelle section "Our Services"
                    const TSelectioHeading(
                      title: 'Our Services',
                      showActionButton: false,
                      textColor: TColors.dark,
                    ),
                    const SizedBox(height: Tsizes.spaceBtwItems),
                    // Bouton Emergency avec ombre rouge
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFF4444).withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF4444),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                            shadowColor: const Color.fromARGB(0, 154, 44, 44),
                          ),
                          onPressed: () {
                            // Redirection vers LocationSelectionScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => LocationSelectionScreen2(),
                              ),
                            );
                          },
                          child: const Text(
                            'Emergency Towing',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: Tsizes.spaceBtwSections),
                    // Cartes Services avec fond blanc
                    Row(
                      children: [
                        Expanded(
                          child: _buildServiceCard(
                            context: context,
                            imagePath: 'assets/images/remorquagee.png',
                            title: 'Standard Towing',
                            subtitle: 'Reliable service for all vehicles',
                            hasButton: true,
                            buttonText: 'Request Now',
                          ),
                        ),
                        const SizedBox(width: Tsizes.spaceBtwItems),
                        Expanded(
                          child: _buildServiceCard(
                            context: context,
                            imagePath: 'assets/images/gpps.png',
                            title: 'Live Tracking',
                            subtitle: 'Track your vehicle in real-time',
                            hasButton: true,
                            buttonText: 'Track Now', // Bouton personnalisé
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard({
    required String imagePath,
    required String title,
    required String subtitle,
    required bool hasButton,
    required BuildContext context,
    String buttonText = 'Request Now',
  }) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 260, maxHeight: 280),
      child: GestureDetector(
        onTap: () {
          if (!hasButton && title == 'Live Tracking') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TrackingScreen()),
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.17),
                blurRadius: 17,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 110,
                  width: double.infinity,
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF3C1509),
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF999999),
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Roboto',
                    height: 1.4,
                  ),
                ),
                const Spacer(),
                if (hasButton)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        if (title == 'Standard Towing') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CarSelectionScreen(),
                            ),
                          );
                        } else if (title == 'Live Tracking') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TrackingScreen(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        buttonText,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
