import 'package:dogfydiet/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingInfoBox extends StatelessWidget {
  final String title;

  const OnboardingInfoBox({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(AppColors.onboardingBackground),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
