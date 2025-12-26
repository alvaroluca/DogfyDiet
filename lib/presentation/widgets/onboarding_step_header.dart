import 'package:flutter/material.dart';

class OnboardingStepHeader extends StatelessWidget {
  const OnboardingStepHeader({
    super.key,
    required this.title,
    this.bottomSpacing = 24,
  });

  final String title;
  final double bottomSpacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: bottomSpacing),
      ],
    );
  }
}
