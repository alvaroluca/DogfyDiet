import 'package:dogfydiet/app/constants/app_assets.dart';
import 'package:dogfydiet/app/l10n/l10n.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_event.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_state.dart';
import 'package:dogfydiet/presentation/widgets/custom_dropdown.dart';
import 'package:dogfydiet/presentation/widgets/onboarding_circle_image.dart';
import 'package:dogfydiet/presentation/widgets/onboarding_step_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedSelectionStep extends StatelessWidget {
  const BreedSelectionStep({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<OnboardingBloc>();
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        if (state.dogBreeds.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            const OnboardingCircleImage(imageAsset: AppAssets.lupa),
            const SizedBox(height: 16),
            OnboardingStepHeader(title: l10n.breedSelectionTitle),
            const SizedBox(height: 16),
            CustomDropdown<int>(
              value: state.onboardingData.breedId,
              labelText: l10n.homeBreedLabel,
              items: state.dogBreeds
                  .map(
                    (breed) => DropdownMenuItem<int>(
                      value: breed.id,
                      child: Text(breed.name),
                    ),
                  )
                  .toList(),
              onChanged: (id) {
                if (id != null) {
                  bloc.add(OnboardingEvent.updateBreed(id));
                }
              },
            ),
            const Expanded(child: SizedBox()),
          ],
        );
      },
    );
  }
}
