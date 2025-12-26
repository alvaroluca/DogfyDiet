import 'package:dogfydiet/app/l10n/l10n.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_event.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_state.dart';
import 'package:dogfydiet/presentation/widgets/custom_dropdown.dart';
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
            Text(
              l10n.breedSelectionTitle,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
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
            const SizedBox(height: 12),
            const Expanded(child: SizedBox()),
          ],
        );
      },
    );
  }
}
