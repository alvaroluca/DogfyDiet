import 'package:dogfydiet/app/l10n/l10n.dart';
import 'package:dogfydiet/features/onboarding/domain/entities/food_profile_type.dart';
import 'package:dogfydiet/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:dogfydiet/features/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:dogfydiet/features/onboarding/presentation/widgets/onboarding_step_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodProfileStep extends StatelessWidget {
  const FoodProfileStep({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<OnboardingBloc>();
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        final dogName = state.onboardingData.dogName ?? '';
        final selectedIndex = state.onboardingData.foodProfile.index;
        const options = FoodProfileType.values;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OnboardingStepSection<FoodProfileType>(
                title: l10n.foodProfileTitle,
                subtitle: l10n.foodProfileSubtitle(dogName),
                options: options,
                selectedIndex: selectedIndex,
                onTap: (option) {
                  bloc.add(OnboardingEvent.updateFoodProfile(option));
                },
                assetBuilder: (option) => option.asset,
                description: options[selectedIndex].description(l10n),
              ),
            ],
          ),
        );
      },
    );
  }
}
