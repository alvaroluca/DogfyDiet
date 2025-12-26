import 'package:dogfydiet/app/constants/app_colors.dart';
import 'package:dogfydiet/app/l10n/l10n.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_event.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_state.dart';
import 'package:dogfydiet/presentation/features/onboarding/steps/cubit/dog_name_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogNameStep extends StatelessWidget {
  const DogNameStep({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<OnboardingBloc>();
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        if (state.dogBreeds.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        final breedName = state.dogBreeds
            .firstWhere((b) => b.id == state.onboardingData.breedId)
            .name;
        return BlocProvider<DogNameCubit>(
          create: (_) => DogNameCubit(
            initial: state.onboardingData.dogName ?? '',
            onChanged: (value) =>
                bloc.add(OnboardingEvent.updateDogName(value)),
          ),
          child: Builder(
            builder: (context) {
              final cubit = context.read<DogNameCubit>();
              final dogName = state.onboardingData.dogName ?? '';
              if (cubit.controller.text != dogName) {
                cubit.controller.text = dogName;
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    l10n.dogNameTitleWithBreed(breedName),
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: cubit.controller,
                    decoration: InputDecoration(
                      labelText: l10n.dogNameLabel,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: Text(l10n.dogNameMultiCta),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(AppColors.onboardingBackground),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      l10n.dogNameInfoBox,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
