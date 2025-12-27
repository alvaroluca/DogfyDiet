import 'package:dogfydiet/app/constants/app_assets.dart';
import 'package:dogfydiet/app/l10n/l10n.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_event.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_state.dart';
import 'package:dogfydiet/presentation/widgets/custom_choice_chip.dart';
import 'package:dogfydiet/presentation/widgets/onboarding_circle_image.dart';
import 'package:dogfydiet/presentation/widgets/onboarding_info_box.dart';
import 'package:dogfydiet/presentation/widgets/onboarding_step_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderSterilizationStep extends StatelessWidget {
  const GenderSterilizationStep({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<OnboardingBloc>();
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        final gender = state.onboardingData.gender;
        final isSterilized = state.onboardingData.isSterilized;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              const OnboardingCircleImage(imageAsset: AppAssets.mirada),
              const SizedBox(height: 16),
              OnboardingStepHeader(
                title: l10n.genderTitle(state.onboardingData.dogName ?? ''),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomChoiceChip(
                    label: l10n.genderMale,
                    selected: gender == 'male',
                    position: 0,
                    onTap: () =>
                        bloc.add(const OnboardingEvent.updateGender('male')),
                  ),
                  CustomChoiceChip(
                    label: l10n.genderFemale,
                    selected: gender == 'female',
                    position: 1,
                    onTap: () =>
                        bloc.add(const OnboardingEvent.updateGender('female')),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              OnboardingStepHeader(title: l10n.sterilizationQuestion),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomChoiceChip(
                    label: l10n.commonYes,
                    selected: isSterilized == true,
                    position: 0,
                    onTap: () => bloc.add(
                      const OnboardingEvent.updateSterilization(true),
                    ),
                  ),
                  CustomChoiceChip(
                    label: l10n.commonNo,
                    selected: isSterilized == false,
                    position: 1,
                    onTap: () => bloc.add(
                      const OnboardingEvent.updateSterilization(false),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              OnboardingInfoBox(title: l10n.genderSterilizationInfoBox),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }
}
