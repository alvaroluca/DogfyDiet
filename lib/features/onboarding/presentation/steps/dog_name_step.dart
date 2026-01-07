import 'package:dogfydiet/core/constants/app_assets.dart';
import 'package:dogfydiet/core/l10n/l10n.dart';
import 'package:dogfydiet/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:dogfydiet/features/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:dogfydiet/features/onboarding/presentation/steps/cubit/dog_name/dog_name_cubit.dart';
import 'package:dogfydiet/features/onboarding/presentation/widgets/onboarding_circle_image.dart';
import 'package:dogfydiet/features/onboarding/presentation/widgets/onboarding_info_box.dart';
import 'package:dogfydiet/features/onboarding/presentation/widgets/onboarding_step_header.dart';
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
              return SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 8),
                    const OnboardingCircleImage(imageAsset: AppAssets.lapiz),
                    const SizedBox(height: 16),
                    OnboardingStepHeader(
                      title: l10n.dogNameTitleWithBreed(breedName),
                    ),
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
                    const SizedBox(height: 16),
                    OnboardingInfoBox(title: l10n.dogNameInfoBox),
                    const SizedBox(height: 24),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
