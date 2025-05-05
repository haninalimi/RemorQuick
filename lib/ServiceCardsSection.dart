import 'package:flutter/material.dart';
import 'package:remorquage/utils/constants/colors.dart';
import 'package:remorquage/utils/constants/sizes.dart';

class ServiceCardsSection extends StatelessWidget {
  const ServiceCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> services = [
      {
        'image': 'assets/images/tooww.png',
        'title': 'Standard Towing',
        'color': const Color(0xFFF9E0E6),
      },
      {
        'image': 'assets/images/toow1.png',
        'title': 'Multiple Vehicle Towing',
        'color': const Color(0xFFE6E7FB),
      },
      {
        'image': 'assets/images/heavy.png',
        'title': 'Heavy-Duty Towing',
        'color': const Color(0xFFDDF3F2),
      },
      {
        'image': 'assets/images/track.png',
        'title': 'Live Tracking',
        'color': const Color(0x8070FFB3), // 50% opacity
      },
    ];

    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: Tsizes.defaultSpace),
        itemCount: services.length,
        separatorBuilder:
            (context, index) => const SizedBox(width: Tsizes.spaceBtwItems),
        itemBuilder: (context, index) {
          return ServiceCard(
            image: services[index]['image'],
            title: services[index]['title'],
            color: services[index]['color'],
          );
        },
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String image;
  final String title;
  final Color color;

  const ServiceCard({
    super.key,
    required this.image,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(Tsizes.borderRadiusLg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(Tsizes.md),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, width: 60, height: 60),
          const SizedBox(height: Tsizes.spaceBtwItems),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: TColors.dark,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
