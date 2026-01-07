import 'package:dogfydiet/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingCircleImage extends StatelessWidget {
  final String imageAsset;

  const OnboardingCircleImage({super.key, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
        color: Color(AppColors.onboardingBackground),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(
          imageAsset,
          width: 40,
          height: 40,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
