import 'package:dogfydiet/presentation/widgets/onboarding_step_header.dart';
import 'package:dogfydiet/presentation/widgets/step_progress_with_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingStepSection<T> extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<T> options;
  final Function(T) onTap;
  final int selectedIndex;
  final double optionSpacing;
  final String description;
  final String Function(T) assetBuilder;

  const OnboardingStepSection({
    super.key,
    required this.title,
    this.subtitle,
    required this.options,
    required this.onTap,
    required this.selectedIndex,
    this.optionSpacing = 8,
    required this.description,
    required this.assetBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        OnboardingStepHeader(title: title, subtitle: subtitle),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(options.length, (i) {
            final option = options[i];
            final isSelected = selectedIndex == i;
            return GestureDetector(
              onTap: () => onTap(option),
              child: Opacity(
                opacity: isSelected ? 1.0 : 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: SvgPicture.asset(assetBuilder(option), height: 90),
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 24),
        StepProgressWithCircle(
          selectedIndex: selectedIndex,
          steps: 3,
          circleSize: 30,
          height: 44,
          topOffset: 4,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
          child: Text(
            description,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
