import 'package:dogfydiet/app/l10n/l10n.dart';
import 'package:dogfydiet/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class NavigationButtons extends StatelessWidget {
  final VoidCallback? onNext;
  final bool isStepComplete;
  final bool isLoading;
  final String nextButtonText;

  const NavigationButtons({
    super.key,
    this.onNext,
    this.isStepComplete = true,
    this.isLoading = false,
    this.nextButtonText = '',
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final resolvedNextText = nextButtonText.isEmpty
        ? l10n.onboardingContinue
        : nextButtonText;
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: CustomButton(
            onPressed: (isStepComplete && !isLoading) ? onNext : null,
            isLoading: isLoading,
            text: resolvedNextText,
          ),
        ),
      ],
    );
  }
}
